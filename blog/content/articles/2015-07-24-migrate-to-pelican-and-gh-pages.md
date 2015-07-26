Title: Migrate blog to Pelican and GitHub Pages
Date: 2015-07-24 23:30
Tags: pelican

### Installation

```sh
$ docker build -t 'ownport.github.io' .
$ docker run -ti --rm --name 'blog' -v ${pwd}/blog:/data/blog ownport.github.io
```

### Publishing to GitHub

[GitHub Pages](https://help.github.com/categories/20/articles) offer an easy and convenient way to publish Pelican sites. There are [two types of GitHub Pages](https://help.github.com/articles/user-organization-and-project-pages): Project Pages and User Pages. Pelican sites can be published as both Project Pages and User Pages.

### Links

- [ownport.github.io](https://github.com/ownport/ownport.github.io)
- [Pelican](http://blog.getpelican.com/) Static Site Generator, Powered by Python
- [GitHub Pages](https://pages.github.com/)
