Title: Practices of Continuous Integration
Date: 2016-03-19 09:59
Tags: continuous, integration


#### Maintain a Single Source Repository

Everything you need to build your source code and run your software should be kept in a version control system (VCS). 


#### Automate the Build

A central impartial instance that takes care of compiling and packaging the build artifact is crucial. That’s were Jenkins comes into play. Jenkins manages all build, test and deploy jobs for all software artifacts. Every developer should have access to Jenkins to be able to access log files, test reports and the job configuration. This gives software teams full transparency of the build process.


#### Make Your Build Self-Testing

Once you have a central automated build with Jenkins in place, testing becomes easy and reproducible. Mike Cohn introduced the Test Pyramid in his book "[Succeeding with Agile](http://www.succeedingwithagile.com/)". The pyramid covers different types of tests that improve the overall quality of the software. Agile software development processes strive to deploy software not just once in a quarter but every other week or even more frequently. In order to reduce the deployment cycle time, manual testing needs to be automated as much as possible. Unit tests help with testing single modules/classes. Service/integration tests make sure that all modules work together with other systems (i.e. databases, queues, web services, …). UI tests are more business centric and test features that provide actual business value. For each section of the pyramid there are various Open Source frameworks available.

Test frameworks:

- UI tests: Selenium, Robot Framework, Protractor
- Service tests: JBehave, FitNesse, SoapUI, JMeter Performance Tests
- Unit tests: JUnit, TestNG, Mockito (Mock Framework)


#### Everyone Commits To the Mainline Every Day

In order to integrate all code changes continuously it is necessary that every developer commits their code daily to a Git repository. Additionally, the CI build can verify right away if new changesets break existing code. In case problems arise, it’s much easier to roll back the latest changeset, instead of figuring out the problem in a couple weeks worth of changes.


#### Every Commit Should Build the Mainline on an Integration Machine

Every developer commits to the master branch in Git. The CI job is simply triggered using VCS post commit hooks. In Jenkins you can configure build triggers, that check your VCS regularly for changes.

Here is a list of various Git workflows and comparisons that you can examine, in case you want to learn more on the topic:

- [Git Flow, Vincent Driessen](http://nvie.com/posts/a-successful-git-branching-model/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [GitLab Flow](https://about.gitlab.com/2014/09/29/gitlab-flow/)
- [Atlassian Git workflow comparison](https://www.atlassian.com/git/tutorials/comparing-workflows/centralized-workflow)


#### Fix Broken Builds Immediately

As part of every Jenkins job you can define post build actions. These post build actions can be used to send out emails or instant messages to the developer that broke the build or the whole team. There are various plugins for integrating Jenkins with modern team communication tools like Slack or HipChat.


#### Keep the Build Fast

There are a couple of things you should keep in mind to keep your build fast:

- use decent hardware for Jenkins, SonarQube, Nexus and whatever other tools you use for your CI platform. Do not make the mistake and use an old PC that you found under the table.
- keep your Unit tests fast.
- split your build into separate jobs and concatenate them to a [Deployment Pipeline](https://blog.codecentric.de/en/2012/05/continuous-delivery-in-the-cloud-part-5-configure-your-continuous-delivery-pipeline/).
- parallelize as many build steps as possible. i.e. Unit tests can run in parallel to improve overall build time.
- mock slow systems in order to speed up your tests.
- in case the previous steps can not be further improved, run long-running test suites during nightly builds.


#### Test in a Clone of the Production Environment

Most of the time it is easy to create a copy of your production environment and it is simply a matter of doubling a couple of servers. If your production environments runs on expensive hardware, requires expensive licenses or runs in a cluster with hundreds of servers, it might turn out to be a tough challenge to create an identical production clone. If that is the case in your company, try to get as close as possible to your production environment, so you are able to detect as many problems as possible in your production clone before deploying a new version to production.


#### Make it Easy for Anyone to Get the Latest Executable

Every artifact that is built using Jenkins gets versioned and deployed to an artifact repository. The most widely used artifact repositories are Nexus from Sonatype and Artifactory from JFrog. They are both Open Source and provide a REST API for integrating them with other build tools.


#### Everyone can see what’s happening

All CI tools like Jenkins, GitLab, Nexus and SonarQube should be accessible for all team members. All tools provide LDAP integration and customizable permission schemes. This adds full transparency to all of your software projects and keeps teams motivated to fix broken builds and failing unit tests.

- GitLab provides a nice dashboard which displays the latest code changes
- Jenkins provides a customizable dashboard with all jobs results
- SonarQube provides a customizable dashboard with the latest static code analysis results

#### Automate Deployment

Jenkins is not just great for compiling source code, it can also be used to execute shell and bash scripts on remote servers or run Puppet and Ansible scripts to provision servers. Over the last years configuration management tools like Ansible, Puppet, Chef and CFEngine have come a long way. It has become a good practice to store these configuration management scripts in Git repositories just like your source code. You should treat your infrastructure just like your source code. Therefore the operation team can use the full power of a modern version control system and does not need to keep their scripts on network shares.

To deploy your software you should use a single deployment script. This deployment script will be used for deploying to every environment. As a result you automatically test the script before doing an actual production deployment.
