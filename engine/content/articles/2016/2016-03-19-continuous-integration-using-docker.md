Title: Continuous Integration using Docker
Date: 2016-03-19 12:43
Tags: docker, continuous, integration, jenkins, sonarqube, nexus, gitlab

Original article: [Continuous Integration Platform Using Docker Containers: Jenkins, SonarQube, Nexus, GitLab](http://www.sonatype.org/nexus/2016/03/11/continuous-integration-platform-using-docker-containers-jenkins-sonarqube-nexus-gitlab/)

_Continuous Integration is a software development practice where members of a team integrate their work frequently, usually each person integrates at least daily - leading to multiple integrations per day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. Many teams find that this approach leads to significantly reduced integration problems and allows a team to develop cohesive software more rapidly. This article is a quick overview of Continuous Integration summarizing the technique and its current usage._ (c) Martin Fowler

- [GitLab](https://about.gitlab.com/) is used for storing the source code in Git repositories and is a great alternative to GitHub.com. GitLab uses a PostgreSQL database for storing user information and Redis for storing tasks. For more details on the Redis and PostgreSQL Docker containers have a look at [GitLab architecture](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/development/architecture.md).
- [Jenkins](https://jenkins-ci.org/) is used for automating the software development process. 
- [Nexus](http://www.sonatype.org/nexus/) is a typical Maven Artifact Repository. The Maven build uses Nexus as a Proxy Repository for third party libs. After the build the packaged artifacts are deployed to the Nexus Release Repository.
- [SonarQube](http://www.sonarqube.org/) is the most widespread Source Code Quality Management Tool. As part of the CI build, Jenkins triggers a static source code analysis and the results are stored in SonarQube. It uses typical code analysis frameworks like FindBugs, Checkstyle, PMD and others.


### Links

- [Continuous Integration](http://www.martinfowler.com/articles/continuousIntegration.html)
- [marcelbirkner/docker-ci-tool-stack](Docker Infrastructure via docker-compose (Jenkins, SonarQube, Nexus, GitLab))
- [Using Jenkins Job DSL for Job Lifecycle Management](https://blog.codecentric.de/en/2015/10/using-jenkins-job-dsl-for-job-lifecycle-management)
- [Jenkins/Job DSL Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Job+DSL+Plugin) The job-dsl-plugin allows the programmatic creation of projects using a DSL. Pushing job creation into a script allows you to automate and standardize your Jenkins installation, unlike anything possible before.
- [Tutorial Using the Jenkins Job DSL](https://github.com/jenkinsci/job-dsl-plugin/wiki/Tutorial---Using-the-Jenkins-Job-DSL)
