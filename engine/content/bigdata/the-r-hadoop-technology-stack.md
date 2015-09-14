Title: The R-Hadoop technology stack (notes)
Date: 2015-09-13 9:30
Tags: hadoop, bigdata, r, statistic

[R](http://www.r-project.org/) is a free, open-source statistical programming language originally based on the S programming language. 
Here are a few reasons why R is a great place to start for data analysis:

- It’s completely free: SAS and SPSS are expensive to get started with, and you often need to buy new methods if you want to try them out
- It’s comprehensive: almost any statistical or machine-learning task you could think of has pre-built libraries for you to use in R.
- R is easy to learn, and especially good for hacking: you don’t need to have a lot of programming experience to get started doing useful work in R
- R is a full-fledged programming language: unlike SAS or SPSS, R is not just a procedural language for doing data analysis
- R is great for getting a job, especially in the tech industry

[Hadoop](http://hadoop.apache.org/) is a free, open-source distributed computing framework. Hadoop is used for all aspects of Big Data: storage, databases, analysis, and even modeling. Hadoop is used at many of the top companies in the world, including Facebook, Twitter, and LinkedIn. When you hear about Hadoop, you typically hear about MapReduce, which is a framework that allows you to solve (extremely) large-scale data processing problems on a cluster of commodity computers. Here are a few reasons why Hadoop is a great way to get started with Big Data:

- Again, it’s completely free
- It’s easy to get started, even if you don’t have your own cluster of computers: check out [Cloudera](http://www.cloudera.com/content/support/en/downloads.html) for an online trial and a VM you can download for free
- Hadoop is comprehensive: almost any Big Data storage or processing problem can be solved within the Hadoop ecosystem
- Hadoop is great for getting a job: it seems like it’s on every data science job ad nowadays!

The R-Hadoop stack allows to do almost anything you need to for data hacking:

- Statistical Programming: R has packages for data exploration, statistical tests, regression, and everything else you could imagine.
- Machine Learning: The [caret](http://caret.r-forge.r-project.org/) package is a wrapper for dozens of machine learning algorithms, and makes it easy to train, tune, and test machine-learning models.
- Visualization: The [ggplot2](http://ggplot2.org/) package allows you to make professional-looking, fully customizable 2D plots.
- Reporting/Dashboarding: The [knitr](http://yihui.name/knitr/) package allows you to generate beautiful, dynamic reports with R. The [shiny](http://shiny.rstudio.com/) package is a web framework for building stylish, interactive web apps with R.
- Databases: [Hive](https://hive.apache.org/) is a highly-scalable data warehousing system built on Hadoop for ad-hoc SQL-style querying of huge datasets (developed at Facebook). [Cassandra](http://cassandra.apache.org/) (used by Netflix) and [HBase](http://hbase.apache.org/) (used by Twitter) are other database solutions for other purposes built on Hadoop.
- Big Data: This is what Hadoop was made for. Hadoop allows you to store and process essentially unlimited amounts of data on commodity hardware (you don’t need a supercomputer anymore). And depending on how big you mean by “big” data, R has some spectacular libraries for working directly with it, like [data.table](http://datatable.r-forge.r-project.org/).
- Data “Munging”: Data munging refers to “cleaning” data and rearranging data in more useful ways (think parsing unusual date formats, removing malformed values, turning columns into rows, etc.). Both R and Hadoop have facilities for this. R is awesome and easy for small to moderate-sized data sets, and Hadoop allows you to write your own programs to clean and rearrange really big data sets when needed.
