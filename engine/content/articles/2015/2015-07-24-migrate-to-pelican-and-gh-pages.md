Title: Migrate blog to Pelican and GitHub Pages
Date: 2015-07-24 23:30
Tags: pelican

### Installation

```sh
$ git clone https://github.com/ownport/notes.git
$ cd notes
$ docker build -t 'ownport.github.io' .
```

### Update site

Run container and re-generate HTML pages

```sh
$ docker run -ti --rm --name 'notes' -v ${pwd}/engine:/data/engine ownport.github.io
$ cd /data/engine/
$ make html
$ exit
```

### Publishing to GitHub

[GitHub Pages](https://help.github.com/categories/20/articles) offer an easy and convenient way to publish Pelican sites. There are [two types of GitHub Pages](https://help.github.com/articles/user-organization-and-project-pages): Project Pages and User Pages. Pelican sites can be published as both Project Pages and User Pages.

Outside of container you need to update GitHub pages in gh-pages branch

```sh
$ ./scripts/ghp-import engine/output/
$ git push origin gh-pages 
```

### Plugins

```python
PLUGIN_PATHS = ['plugins']
PLUGINS = ['sitemap',]
```

#### Links

- [How to use plugins](http://docs.getpelican.com/en/3.6.0/plugins.html#how-to-use-plugins)
- [Plugin descriptions](https://github.com/getpelican/pelican-plugins#plugin-descriptions)

### Sitemap

Add to pelicanconf.py

```python
SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5
    },
    'changefreqs': {
        'articles': 'monthly',
        'indexes': 'daily',
        'pages': 'monthly'
    }
}
```

### Links

- [ownport.github.io](https://github.com/ownport/ownport.github.io)
- [Pelican](http://blog.getpelican.com/) Static Site Generator, Powered by Python
- [GitHub Pages](https://pages.github.com/)
