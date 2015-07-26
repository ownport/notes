# ownport.github.io

Personal website, based on [pelican](http://blog.getpelican.com/)

## Installation

```sh
$ docker build -t 'ownport.github.io' .
$ docker run -ti --rm --name 'blog' -v ${pwd}/blog:/data/blog ownport.github.io
```


