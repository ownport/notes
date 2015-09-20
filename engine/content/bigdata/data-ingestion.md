Title: BigData Data Ingestion links
Date: 2015-07-28 22:00
Tags: hadoop, bigdata

- [Amazon Kinesis](http://aws.amazon.com/kinesis/): real-time processing of streaming data at massive scale

- [Apache Chukwa](http://incubator.apache.org/chukwa/): data collection system

- [Apache Flume](http://flume.apache.org/): service to manage large amount of log data

- [Apache Samza](http://samza.incubator.apache.org/): stream processing framework, based on Kafla and YARN

- [Apache Sqoop](http://sqoop.apache.org/): tool to transfer data between Hadoop and a structured datastore

- [Apache UIMA](https://uima.apache.org/): Unstructured Information Management applications are software systems that analyze large volumes of unstructured information in order to discover knowledge that is relevant to an end user

- [Cloudera Morphlines](https://github.com/cloudera/cdk/tree/master/cdk-morphlines): framework that help ETL to Solr, HBase and HDFS

- [Facebook Scribe](https://github.com/facebook/scribe): streamed log data aggregator

- [Fluentd](http://fluentd.org/): tool to collect events and logs

- [Google Photon](http://research.google.com/pubs/pub41318.html): geographically distributed system for joining multiple continuously flowing streams of data in real-time with high scalability and low latency

- [Heka](https://github.com/mozilla-services/heka): open source stream processing software system

- [HIHO](https://github.com/sonalgoyal/hiho): framework for connecting disparate data sources with Hadoop

- [LinkedIn Databus](http://data.linkedin.com/projects/databus): stream of change capture events for a database

- [LinkedIn Kamikaze](https://github.com/linkedin/kamikaze): utility package for compressing sorted integer arrays

- [LinkedIn White Elephant](https://github.com/linkedin/white-elephant): log aggregator and dashboard

- [Logstash](http://logstash.net): a tool for managing events and logs

- [Netflix Suro](https://github.com/Netflix/suro): data pipeline service for collecting, aggregating, and dispatching large volume of application events including log data based on Chukwa

- [Pinterest Secor](https://github.com/pinterest/secor): is a service implementing Kafka log persistance

- [Record Breaker](http://cloudera.github.io/RecordBreaker/): Automatic structure for your text-formatted data

- [TIBCO Enterprise Message Service](http://www.tibco.com/products/automation/enterprise-messaging/enterprise-message-service): standards-based messaging middleware

- [Twitter Zipkin](https://github.com/twitter/zipkin): distributed tracing system that helps us gather timing data for all the disparate services at Twitter

- [Vibe Data Stream](http://www.informatica.com/us/products/big-data/vibe-data-stream/): streaming data collection for real-time Big Data analytics

- [LinkedIn Camus](https://github.com/linkedin/camus) LinkedIn's Kafka to HDFS pipeline. Camus is being phased out and replaced by Gobblin. For those using or interested in Camus, we suggest taking a look at Gobblin.

- [LinkedIn Gobblin](https://github.com/linkedin/gobblin) Gobblin is a universal data ingestion framework for extracting, transforming, and loading large volume of data from a variety of data sources, e.g., databases, rest APIs, FTP/SFTP servers, filers, etc., onto Hadoop. Gobblin handles the common routine tasks required for all data ingestion ETLs, including job/task scheduling, task partitioning, error handling, state management, data quality checking, data publishing, etc. Gobblin ingests data from different data sources in the same execution framework, and manages metadata of different sources all in one place. This, combined with other features such as auto scalability, fault tolerance, data quality assurance, extensibility, and the ability of handling data model evolution, makes Gobblin an easy-to-use, self-serving, and efficient data ingestion framework. 

- [Apache NiFi](https://nifi.apache.org/index.html) supports powerful and scalable directed graphs of data routing, transformation, and system mediation logic.
	- Web-based user interface: seamless experience between design, control, feedback, and monitoring
    - Highly configurable: loss tolerant vs guaranteed delivery, low latency vs high throughput, dynamic prioritization, flow can be modified at runtime, back pressure
    - Data Provenance: track dataflow from beginning to end
    - Designed for extension: build your own processors and more, enables rapid development and effective testing
    - Secure: SSL, SSH, HTTPS, encrypted content, pluggable role-based authentication/authorization
