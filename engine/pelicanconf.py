#!/usr/bin/env python
# -*- coding: utf-8 -*- #

from __future__ import unicode_literals

AUTHOR = u'ownport'
SITENAME = u'ownport.github.io/notes'
SITEURL = u'http://ownport.github.io/notes'
TIMEZONE = u'Europe/Kiev'
DEFAULT_LANG = u'en'

# -----------------------------------
#   Paths
# -----------------------------------

PATH = u'content'

# path-specific metadata
EXTRA_PATH_METADATA = {
    'static/robots.txt': {'path': 'robots.txt'},
}

STATIC_PATHS = [
    # Directories
    'images/',
    # Files 
    'static/robots.txt',
]

ARTICLE_URL = 'posts/{date:%Y}/{date:%m}/{slug}.html'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{date:%m}/{slug}.html'

# -----------------------------------
#   Feeds
# -----------------------------------

FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# -----------------------------------
#   Links
# -----------------------------------

LINKS = (('GitHub', 'http://github.com/ownport'),)
SOCIAL = ()

# -----------------------------------
#   Plugins
# -----------------------------------
PLUGIN_PATHS = ['plugins']
PLUGINS = ['sitemap',]

#   Sitemap
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

# -----------------------------------
#   Looks and feels
# -----------------------------------
THEME = 'nikhil'
DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
