Title: SonarQube in Docker environment
Date: 2015-09-07 23:30
Tags: sonarqube, postgresql, quality controle, docker, testing

### Install

Pull Docker images for PostgreSQL and SonarQube

```sh
$ docker pull postgres:9.4
$ docker pull sonarqube:5.1.2
```

### Configuration

#### Database configuration

By default, the image will use an embedded H2 database that is not suited for production.

The production database is configured with these variables: 

- SONARQUBE_JDBC_USERNAME
- SONARQUBE_JDBC_PASSWORD
- SONARQUBE_JDBC_URL

```sh
$ docker run -d --name sonarqube \
    -p 9000:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar \
    -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
    sonarqube:5.1.2
```

### Run

The server is started this way:

```sh
$ docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube:5.1.2
```

### Run SonarQube with a PostgreSQL database

- compose.yml

```
sonarqube:
  image: "sonarqube:5.1.2"
  ports:
   - "9000:9000"
   - "5432:5432"
  environment:
   - SONARQUBE_JDBC_URL=jdbc:postgresql://localhost:5432/sonar

db:
  image: postgres:9.4
  net: container:sonarqube
  environment:
   - POSTGRES_USER=sonar
   - POSTGRES_PASSWORD=sonar
```


### Links

- [SonarQube](http://www.sonarqube.org/) is an open platform to manage code quality.
- [PostgreSQL](http://www.postgresql.org) is a powerful, open source object-relational database system. It has more than 15 years of active development and a proven architecture that has earned it a strong reputation for reliability, data integrity, and correctness.




