Title: REST Resources, URL (notes)
Date: 2015-09-16 22:30
Tags: rest, api, resources

read original posts:

- [Restful API Design/Resources](https://restful-api-design.readthedocs.org/en/latest/resources.html)
- [Restful API Design/URLs](https://restful-api-design.readthedocs.org/en/latest/urls.html)

The fundamental concept in any RESTful API is the resource. A resource is an object with a type, associated data, relationships to other resources, and a set of methods that operate on it. It is similar to an object instance in an object-oriented programming language, with the important difference that only a few standard methods are defined for the resource (corresponding to the standard HTTP GET, POST, PUT and DELETE methods), while an object instance typically has many methods.

Resources can be grouped into collections. Each collection is homogeneous so that it contains only one type of resource, and unordered. Resources can also exist outside any collection. In this case, we refer to these resources as singleton resources. Collections are themselves resources as well.

Collections can exist globally, at the top level of an API, but can also be contained inside a single resource. In the latter case, we refer to these collections as sub-collections. Sub-collections are usually used to express some kind of “contained in” relationship. We go into more detail on this in Relationships.

### Resources data

Resources have data associated with them. The richness of data that can be associated with a resource is part of the resource model for an API. It defines for example the available data types and their behavior.

In JSON, just three types of data exist:

- scalar (number, string, boolean, null).
- array
- object

Scalar types have just a single value. Arrays contain an ordered list of values of arbitrary type. Objects consist of a unordered set of key:value pairs, where the key is a string and the value can have an arbitrary type. The three types of data (scalars, arrays and objects) are powerful enough to describe in a natural way virtually all the data that you might want to expose as resource, and at the same time these types are minimal enough so that almost any modern language has built-in support for them.

#### Application Data

The data that can be associated with a resource in terms of the JSON data model, using the following mapping rules:

- Resources are modeled as a JSON object. The type of the resource is stored under the special key:value pair “_type”.
- Data associated with a resource is modeled as key:value pairs on the JSON object. To prevent naming conflicts with internal key:value pairs, keys must not start with “_”.
- The values of key:value pairs use any of the native JSON data types of string, number, boolean, null, or arrays thereof. Values can also be objects, in which case they are modeling nested resources.
- Collections are modeled as an array of objects.

#### REST Metadata

In addition to exposing application data, resources also include other information that is specific to the RESTful API. Such information includes URLs and relationships.

The following table lists generic attributes that are defined and have a specific meaning on all resources. They should not be used for mapping application model attributes.

Attributes    | Type      | Meaning
--------------| --------- | -------------
id            | String    | Identifies the unique ID of a resource.
href          | String    | Identifies the URL of the current resource.
link          | Object    | Identifies a relationship for a resource. This attribute is itself an object and has “rel” “href” attributes.



#### Other Data

Apart from application data, and REST metadata, sometimes other data is required as well. This is usually “RPC like” data where a setting is needed for an operation, and where that setting will not end up being part of the resource itself.

It is the responsibility of the API code to merge the application data together with the REST metadata and the other data into a single resource, resolving possible naming conflicts that may arise.


### Representation

We have defined resources, and defined the data associated with them in terms of the JSON data model. However, these resources are still abstract entities. Before they can be communicated to a client over an HTTP connection, they need to be serialized to a textual representation. This representation can then be included as an entity in an HTTP message body.

The following representations are common for resources. The table also lists the appropriate content-type to use:

Type          | Content-Type
------------- | ----------------
JSON          | application/x-resource+json, application/x-collection+json
YAML          | application/x-resource+yaml, application/x-collection+yaml
XML           | application/x-resource+xml, application/x-collection+xml
HTML          | text/html

Note: all these content types use the “x-” experimental prefix that is allowed by [RFC2046](http://www.ietf.org/rfc/rfc2046.txt)


### URLs

A RESTful API needs to have one and exactly one entry point. The URL of the entry point needs to be communicated to API clients so that they can find the API.

Technically speaking, the entry point can be seen as a singleton resource that exists outside any collection. It is common for the entry point to contain some or all of the following information:

- Information on API version, supported features, etc.
- A list of top-level collections.
- A list of singleton resources.
- Any other information that the API designer deemed useful, for example a small summary of operating status, statistics, etc.


#### URL Structure

Each collection and resource in the API has its own URL. URLs should never be constructed by an API client. Instead, the client should only follow links that are generated by the API itself.

The recommended convention for URLs is to use alternate collection / resource path segments, relative to the API entry point. This is best described by example. The table below uses the ”:name” URL variable style from Rail’s “Routes” implementation.

URL                               | Description
--------------------------------- | ------------------
/api                              | The API entry point
/api/:coll                        | A top-level collection named 'coll'
/api/:coll/:id                    | The resource 'id' inside collection 'coll'
/api/:coll/:id/:subcoll           | Sub-collection “subcoll” under resource “id”
/api/:coll/:id/:subcoll/:subid    | The resource “subid” inside “subcoll”


#### Relative vs Absolute

It is strongly recommended that the URLs generated by the API should be absolute URLs.

The reason is mostly for ease of use by the client, so that it never has to find out the correct base URI for a resource, which is needed to interpret a relative URL. The URL [RFC3986](http://tools.ietf.org/html/rfc3986#section-5.1) specifies the algorithm for determining a base URL, which is rather complex. One of the options for finding the base URL is to use the URL of the resource that was requested. Since a resource may appear under multiple URLs (for example, as part of a collection, or stand-alone), it would be a significant overhead to a client to remember where he retrieved a representation from. By using absolute URLs, this problem doesn’t present itself.


#### URL Templates

A [draft standard](http://tools.ietf.org/html/draft-gregorio-uritemplate-05) for URL templates exists. URL templates can be useful in link attributes where the target URL takes query arguments. It is recommended though to make only conservative use of these. So far the only good use case I have come across is when searching in a collection. In that case, it seems fair that the search criteria can be specified as GET style query arguments appended to the collection URL.


#### Variants

Sometimes you need to work on a variant of a resource. In our RHEV-M API for example, some attributes on a virtual machine can be updated while a virtual machine is running. This amounts to a hot plug/unplug of the resource, which is a different operation altogether from changing the saved representation. A nice way to implement this is using ”;variant” identifier in a URL. For example:

URL                         | Description
--------------------------- | -------------------------------------------
/api/:coll/:id;saved        | Identifies the saved variant of a resource.
/api/:coll/:id;current      | Identifies the current variant of a resource

The use of the semicolon to provide options that are specific to a path segment is explicitly alowed in [RFC3986](http://tools.ietf.org/html/rfc3986#section-3.3). The advantage over using a ”?variant” query argument is that this format is specific to a path segment only, and would allow you to e.g. work on the saved variant of a sub-resource in a sub-collection of the current variant of another resource.




