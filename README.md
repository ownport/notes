# ownport.github.io

Personal website, based on [pelican](http://blog.getpelican.com/). Homepage: [http://ownport.github.io/notes/](http://ownport.github.io/notes/)


## Installation

```sh
$ docker pull ownport/pelican:latest
```

## Update site

Run container and re-generate HTML pages

```sh
$ docker run -ti --rm --name 'notes' -v $(pwd)/engine:/data/engine ownport.github.notes
$ cd /data/engine/
$ make html
$ exit
```

Outside of container update GitHub pages in gh-pages branch

```sh
$ ./scripts/ghp-import engine/output/
$ git push origin gh-pages 
```


