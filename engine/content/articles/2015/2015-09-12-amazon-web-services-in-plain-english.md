Title: Amazon Web Services in Plain English (notes)
Date: 2015-09-12 11:30
Tags: amazon, services, cloud, servers, bigdata, management

Read original page: [Amazon Web Services in Plain English](https://www.expeditedssl.com/aws-in-plain-english)


### Base Services

- **EC2 (Amazon Virtual Servers)**: Host the bits of things you think of as a computer. It's handwavy, but EC2 
instances are similar to the virtual private servers you'd get at Linode, DigitalOcean or Rackspace

- **IAM (Users, Keys and Certs)**: Setup additional users, setup new AWS Keys and policies

- **S3 (Amazon Unlimited FTP Server)**: Store images and other assets for websites. Keep backups and share 
files between services. Host static websites. Also, many of the other AWS services write and read from S3.

- **VPC (Amazon Virtual Colocated Rack)**: Overcome objections that "all our stuff is on the Internet!" by 
adding an additional layer of security. Makes it appears as if all of your AWS services are on the same 
little network instead of being small pieces in a much bigger network. It's like, if you're familar with networking: VLANs


### Web Developer Services

- **API Gateway (API Proxy)**: Proxy your apps API through this so you can throttle bad client traffic, test 
new versions, and present methods more cleanly. It's like 3Scale

- **RDS (Amazon SQL)**: Be your app's Mysql, Postgres, Oracle database. It's like Heroku Postgres

- **Route53 (Amazon DNS + Domains)**: Buy a new domain, setup the DNS records for that domain. It's like DNSimple, GoDaddy, Gandi

- **SES (Amazon Transactional Email)**: Send one off emails like password resets, notifications, etc. You could use it send 
Newsletter if you wrote all the code, but that's not a great idea. It's like SendGrid, Mandrill, Postmark

- **Cloudfront (Amazon CDN)**: Make your websites load faster by spreading out static file delivery to be closer to where your 
users are. It's like MaxCDN, Akamai

- **CloudSearch (Amazon Fulltext Search)**: Pull in data on S3 or in RDS and and then search it for every instance of 'Jimmy'. 
It's like Sphinx, Solr, ElasticSearch

- **DynamoDB (Amazon NoSQL)**: Be your app's MongoDB. It's like MongoLab

- **Elasticache (Amazon Memcached)**: Be your app's Memcached or Redis. It's like Redis to Go, Memcachier

- **Elastic Transcoder (Amazon Beginning Cut Pro)**: Deal with video weirdness (change formats, compress, etc.) 

- **Lambda (Javascript Execution As A Service)**: Run little self contained snippets of JS to do discrete tasks. Sort of 
a combination of a queue and execution in one. Currently mostly used for storing and then executing changes to your 
AWS setup. Also, you can put it behind the API Gateway and expose it that way.

- **SQS (Amazon Queue)**: Store data for future processing in a queue. The lingo for this is storing "messages" 
but it doesn't have anything to do with email or SMS. SQS doesn't have any logic it's just a place to put things and 
take things out. It's like RabbitMQ, Sidekiq.


### Mobile App Developer Services

- **Cognito (Amazon OAuth As A Service)**: Give end users - (non AWS) - the ability to log in with Google, Facebook, etc. 
It's like OAuth.io

- **Device Farm (Amazon Drawer of old Android devices)**: Test your app on a bunch of different IOS and Android devices simultaneously. 
It's like MobileTest, iOS emulator

- **Mobile Analytics (Spot on Name, Amazon Product Managers take note)**: Track what people are doing inside of your app. It's like Flurry.

- **SNS (Amazon Messenger)**: Send mobile notifications, emails and/or SMS messages. It's like UrbanAirship, Twilio


### Ops and Code Deployment Services

- **CodeCommit (Amazon GitHub)**: Version control your code - hosted Git. It's like Github, BitBucket

- **Code Deploy**: Get your code from your CodeCommit repo (or Github) onto a bunch of EC2 instances in a sane way. 
It's like Heroku, Capistrano

- **CodePipeline (Amazon Continuous Integration)**: Run automated test on your code and then do stuff with it depending on if 
it passes those tests. It's like CircleCI, Travis.

- **EC2 Container Service (Amazon Docker As a Service)**: Put a Dockerfile into an EC2 instance so you can run a website

- **Elastic Beanstalk (Amazon Platform As A Service)**: Move your app hosted on Heroku to AWS when it gets too expensive. 
It's like Heroku, BlueMix, Modulus


### Enterprise / Corporate Services

- **AppStream (Amazon Citrix)**: Put a copy of a Windows application on a windows machine that people get remote access to. 
It's like Citrix, RDP

- **Direct Connect**: Pay your Telco + AWS to get a dedicated leased line from your data center or network to AWS. Cheaper than 
Internet out for Data. It's like a toll road turnpike bypassing the crowded side streets

- **Directory Service**: Tie together other apps that need a Microsoft Active Directory to control them

- **WorkDocs (Amazon Unstructured Files)**: Share Word Docs with your colleagues. It's like Dropbox, DataAnywhere

- **WorkMail (Amazon Company Email)**: Give everyone in your company the same email system and calendar. It's like
Google Apps for Domains

- **Workspaces (Amazon Remote Computer)**: Gives you a standard windows desktop that you're remotely controlling

- **Service Catalog (Amazon Setup Already)**: Give other AWS users in your group access to preset apps you've built so they 
don't have to read guides like this. 

- **Storage Gateway**: S3 pretending it's part of your corporate network. Stop buying more storage to keep word docs on. 
Make automating getting files into S3 from your corporate network easier.


### BigData Services

- **Data Pipeline (Amazon ETL)**: Extract, Transform and Load data from elsewhere in AWS. Schedule when it happens and 
get alerts when they fail.

- **Elastic Map Reduce (Amazon Hadooper)**: Iterate over massive text files of raw data that you're keeping in S3. It's like
Treasure Data.

- **Glacier (Really slow Amazon S3)**: Make backups of your backups that you keep on S3. Also, beware the costs of getting 
data back out in a hurry. For long term archiving.

- **Kinesis (Amazon High Throughput)**: Injest lots of data very quickly (For things like analytics or people retweeting Kanye) 
that you then later use other AWS services to analyze. It's like Kafka

- **RedShift (Amazon Data Warehouse)**: Store a whole bunch of analytics data, do some processing and dump it out

- **Machine Learning (Skynet)**: Predict future behavior from existing data for problems like fraud detection or "people that 
bought x also bought y"

- **SWF (Amazon EC2 Queue)**: Build a service of "deciders" and "workers" on top of EC2 to accomplish a set task. Unlike 
SQS - logic is setup inside the service to determine how and what should happen. It's like IronWorker


### AWS Management Services

- **CloudFormation (Amazon Services Setup)**: Setup a bunch of connected AWS services in one go

- **CloudTrail (Amazon Logging)**: Log who is doing what in your AWS stack (API calls)

- **CloudWatch (Amazon Status Pager)**: Get alerts about AWS services messing up or disconnecting. It's like PagerDuty, Statuspage.

- **Config (Amazon Configuration Management)**: Keep from going insane if you have a large AWS setup and changes are happening 
that you want to track.

- **OpsWorks (Amazon Chef)**: Handle running your application with things like auto-scaling

- **Trusted Advisor (Amazon Pennypincher)**: Find out where you're paying too much in your AWS setup (unused EC2 instances, etc.)



