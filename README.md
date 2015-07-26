# ownport.github.io

Personal website, based on [pelican](http://blog.getpelican.com/). Homepage: [http://ownport.github.io/blog/](http://ownport.github.io/blog/)


## Installation

```sh
$ docker build -t 'ownport.github.io' .
```

## Update siate

Run container and re-generate HTML pages

```sh
$ docker run -ti --rm --name 'blog' -v ${pwd}/blog:/data/blog ownport.github.io
$ cd /data/blog/
$ make html
$ exit
```

Outside of container update GitHub pages in gh-pages branch

```sh
$ ./scripts/ghp-import blog/output/
$ git push origin gh-pages 
```


