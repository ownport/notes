Title: AVRO-1124: RESTful service for holding schemas (re-post)
Date: 2015-11-16 08:15
Tags: avro, schema, repository

Original post: [AVRO-1124](https://issues.apache.org/jira/browse/AVRO-1124) RESTful service for holding schemas

### Motivation

It is nice to be able to pass around data in serialized form but still know the exact schema that was used to serialize it. The overhead of storing the schema with each record is too high unless the individual records are very large. There are workarounds for some common cases: in the case of files a schema can be stored once with a file of many records amortizing the per-record cost, and in the case of RPC the schema can be negotiated ahead of time and used for many requests. For other uses, though it is nice to be able to pass a reference to a given schema using a small id and allow this to be looked up. Since only a small number of schemas are likely to be active for a given data source, these can easily be cached, so the number of remote lookups is very small (one per active schema version).

### Details

Basically this would consist of two things:

- A simple REST service that stores and retrieves schemas
- Some helper java code for fetching and caching schemas for people using the registry

We have used something like this at LinkedIn for a few years now, and it would be nice to standardize this facility to be able to build up common tooling around it. This proposal will be based on what we have, but we can change it as ideas come up.

The facilities this provides are super simple, basically you can register a schema which gives back a unique id for it or you can query for a schema. There is almost no code, and nothing very complex. The contract is that before emitting/storing a record you must first publish its schema to the registry or know that it has already been published (by checking your cache of published schemas). When reading you check your cache and if you don't find the id/schema pair there you query the registry to look it up. I will explain some of the nuances in more detail below.

An added benefit of such a repository is that it makes a few other things possible:

- A graphical browser of the various data types that are currently used and all their previous forms.
- Automatic enforcement of compatibility rules. Data is always compatible in the sense that the reader will always deserialize it (since they are using the same schema as the writer) but this does not mean it is compatible with the expectations of the reader. For example if an int field is changed to a string that will almost certainly break anyone relying on that field. This definition of compatibility can differ for different use cases and should likely be pluggable.

Here is a description of one of our uses of this facility at LinkedIn. We use this to retain a schema with "log" data end-to-end from the producing app to various real-time consumers as well as a set of resulting AvroFile in Hadoop. This schema metadata can then be used to auto-create hive tables (or add new fields to existing tables), or inferring pig fields, all without manual intervention. One important definition of compatibility that is nice to enforce is compatibility with historical data for a given "table". Log data is usually loaded in an append-only manner, so if someone changes an int field in a particular data set to be a string, tools like pig or hive that expect static columns will be unusable. Even using plain-vanilla map/reduce processing data where columns and types change willy nilly is painful. However the person emitting this kind of data may not know all the details of compatible schema evolution. We use the schema repository to validate that any change made to a schema don't violate the compatibility model, and reject the update if it does. We do this check both at run time, and also as part of the ant task that generates specific record code (as an early warning).

Some details to consider:

### Deployment

This can just be programmed against the servlet API and deploy as a standard war. You have lots of instances and load balance traffic over them.

### Persistence

The storage needs are not very heavy. The clients are expected to cache the id => schema mapping, and the server can cache as well. Even after several years of heavy use we have <50k schemas, each of which is pretty small. I think this part can be made pluggable and we can provide a jdbc- and file-based implementation as these don't require outlandish dependencies. People can easily plug in their favorite key-value store thingy if they like by implementing the right plugin interface. Actual reads will virtually always be cached in memory so this is not too important.

### Group

In order to get the "latest" schema or handle compatibility enforcement on changes there has to be some way to group a set of schemas together and reason about the ordering of changes over these. I am going to call the grouping the "group". In our usage it is always the table or topic to which the schema is associated. For most of our usage the group name also happens to be the Record name as all of our schemas are records and our default is to have these match. There are use cases, though, where a single schema is used for multiple topics, each which is modeled independently. The proposal is not to enforce a particular convention but just to expose the group designator in the API. It would be possible to make the concept of group optional, but I can't come up with an example where that would be useful.

### Compatibility

There are really different requirements for different use cases on what is considered an allowable change. Likewise it is useful to be able to extend this to have other kinds of checks (for example, in retrospect, I really wish we had required doc fields to be present so we could require documentation of fields as well as naming conventions). There can be some kind of general pluggable interface for this like SchemaChangeValidator.isValidChange(currentLatest, proposedNew)

A reasonable implementation can be provided that does checks based on the rules in [http://avro.apache.org/docs/current/spec.html#Schema+Resolution](http://avro.apache.org/docs/current/spec.html#Schema+Resolution). Be default no checks need to be done. Ideally you should be able to have more than one policy (say one treatment for database schemas, one for logging event schemas, and one which does no checks at all). I can't imagine a need for more than a handful of these which would be statically configured (db_policy=com.mycompany.DBSchemaChangePolicy, noop=org.apache.avro.NoOpPolicy,...). Each group can configure the policy it wants to be used going forward with the default being none.

### Security and Authentication

There isn't any of this. The assumption is that this service is not publicly available and those accessing it are honest (though perhaps accident prone). These are just schemas, after all.

### Ids

There are a couple of questions about ids how we make ids to represent the schemas:

- Are they sequential (1,2,3..) or hash based? If hash based, what is sufficient collision probability?
- Are they global or per-group? That is, if I know the id do I also need to know the group to look up the schema?
- What kind of change triggers a new id? E.g. if I update a doc field does that give a new id? If not then that doc field will not be stored.

For the id generation there are various options:

- A sequential integer
- [AVRO-1006](https://issues.apache.org/jira/browse/AVRO-1006) creates a schema-specific 64-bit hash.
- Our current implementation at LinkedIn uses the MD5 of the schema as the id.

Our current implementation at LinkedIn uses the MD5 of the schema text after removing whitespace. The additional attributes like doc fields (and a few we made up) are actually important to us and we want them maintained (we add metadata fields of our own). This does mean we have some updates that generate a new schema id but don't cause a very meaningful semantic change to the schema (say because someone tweaked their doc string), but this doesn't hurt anything and it is nice to have the exact schema text represented. An example of uses these metadata fields is using the schema doc fields as the hive column doc fields.

The id is actually just a unique identifier, and the id generation algorithm can be made pluggable if there is a real trade-off. In retrospect I don't think using the md5 is good because it is 16 bytes, which for a small message is bulkier than needed. Since the id is retained with each message, size is a concern.

The AVRO-1006 fingerprint is super cool, but I have a couple concerns (possibly just due to misunderstanding):

- Seems to produce a 64-bit id. For a large number of schemas, 64 bits makes collisions unlikely but not unthinkable. Whether or not this matters depends on whether schemas are versioned per group or globally. If they are per group it may be okay, since most groups should only have a few hundred schema versions at most. If they are global I think it will be a problem. Probabilities for collision are given here under the assumption of perfect uniformity of the hash (it may be worse, but can't be better) [http://en.wikipedia.org/wiki/Birthday_attack](http://en.wikipedia.org/wiki/Birthday_attack). If we did have a collision we would be dead in the water, since our data would be unreadable. If this becomes a standard mechanism for storing schemas people will run into this problem.
- Even 64-bits is a bit bulky. Since this id needs to be stored with every row size is a concern, though a minor one.
- The notion of equivalence seems to throw away many things in the schema (doc, attributes, etc). This is unfortunate. One nice thing about avro is you can add your own made-up attributes to the schema since it is just JSON. This acts as a kind of poor-mans metadata repository. It would be nice to have these maintained rather than discarded.

It is possible that I am misunderstanding the fingerprint scheme, though, so please correct me.

My personal preference would be to use a sequential id per group. The main reason I like this is because the id doubles as the version number, i.e. my_schema/4 is the 4th version of the my_schema record/group. Persisted data then only needs to store the varint encoding of the version number, which is generally going to be 1 byte for a few hundred schema updates. The string my_schema/4 acts as a global id for this. This does allow per-group sharding for id generation, but sharding seems unlikely to be needed here. A 50GB database would store 52 million schemas. 52 million schemas "should be enough for anyone".

Probably the easiest thing would be to just make the id generation scheme pluggable. That would kind of satisfy everyone, and, as a side-benefit give us at linkedin a gradual migration path off our md5-based ids. In this case ids would basically be opaque url-safe strings from the point of view of the repository and users could munge this id and encode it as they like.

### APIs

Here are the proposed APIs. This tacitly assumes ids are per-group, but the change if pretty minor if not:


`GET /schemas/{group}/{id}`

- Get a schema by id
- If the schema exists the response code will be 200 and the response body will be the schema text.
- If it doesn't exist the response will be 404.

`GET /schemas`

- Produces a list of group names, one per line.

`GET /schemas/group`

- Produces a list of versions for the given group, one per line.

`GET /schemas/group/latest`

- If the group exists the response code will be 200 and the response body will be the schema text of the last registered schema.
- If the group doesn't exist the response code will be 404.

`POST /schemas/groups/{group_name}`

- Register a schema

Parameters:

- schema={text of schema}
- compatibility_model=XYZ
- force_override=(true|false)

There are a few cases:

- If the group exists and the change is incompatible with the current latest, the server response code will be 403 (forbidden) UNLESS the force_override flag is set in which case not check will be made.
- If the server doesn't have an implementation corresponding to the given compatibility model key it will give a response code 400
- If the group does not exist it will be created with the given schema (and compatibility model)
- If the group exists and this schema has already been registered the server returns response code 200 and the id already assigned to that schema
- If the group exists, but this schema hasn't been registered, and the compatibility checks pass, then the response code will be 200 and it will store the schema and return the id of the schema

The force_override flag allows registering an incompatible schema. We have found that sometimes you know "for sure" that your change is okay and just want to damn the torpedoes and charge ahead. This would be intended for manual rather than programmatic usage.

### Intended Usage

Let's assume we are implementing a put and get API as a database would have using this registry, there is no substantial difference for a messaging style api. Here are the details of how this works:

`void put(table, key, record)`

Put is expected to do the following under the covers:

- Check the record's schema against a local cache of schema=>id to get the schema id
- If it is not found then register it with the schema registry and get back a schema id and add this pair to the cache
- Store the serialized record bytes and schema id

`Record get(table, key)`

Get is expected to do the following:

- Retrieve the serialized record bytes and schema id from the store
- Check a local cache to see if this schema is known for this schema id
- If not, fetch the schema by id from the schema registry
- Deserialize the record using the schema and return it

### Links

- [schema-repo/schema-repo](https://github.com/schema-repo/schema-repo)  The Schema Repo is a RESTful web service for storing and serving mappings between schema identifiers and schema definitions. [http://schemarepo.org](http://schemarepo.org)

