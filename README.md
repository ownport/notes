# ownport.github.io

Personal website, based on [pelican](http://blog.getpelican.com/). Homepage: [http://ownport.github.io/blog/](http://ownport.github.io/blog/)


## Installation

```sh
$ docker build -t 'ownport.github.io' .
```

## Update siate

Run container and re-generate HTML pages

```sh
$ docker run -ti --rm --name 'notes' -v ${pwd}/engine:/data/engine ownport.github.io
$ cd /data/engine/
$ make html
$ exit
```

Outside of container update GitHub pages in gh-pages branch

```sh
$ ./scripts/ghp-import engine/output/
$ git push origin gh-pages 
```


