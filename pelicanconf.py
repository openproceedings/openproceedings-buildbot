#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os

AUTHOR = u'Andrea Zonca'
SITENAME = u'OpenProceedings'
SITEURL = ''

TIMEZONE = 'America/Los_Angeles'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
DISPLAY_CATEGORIES_ON_MENU=False
TRANSLATION_FEED_ATOM = None
PDF_PROCESSOR=True
BIBTEX_PROCESSOR=True

SOCIAL = None

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

THEME = "themes/pelican-bootstrap3"

PLUGIN_PATH = "plugins"
import sys
sys.path.append(".")
import figshare_pdf 
PLUGINS = ["pdf", figshare_pdf]

FIGSHARE_CLIENT_KEY = '541lmG0dcTUK0sjCWquPog'
FIGSHARE_CLIENT_SECRET = os.environ["FIGSHARE_CLIENT_SECRET"]
FIGSHARE_TOKEN_KEY = 'v7RkXTnx2bIbhuNR3pvc0wPMDbv7CxteYwMgdbJe05kAv7RkXTnx2bIbhuNR3pvc0w'
FIGSHARE_TOKEN_SECRET = os.environ["FIGSHARE_TOKEN_SECRET"]
FIGSHARE_CATEGORY_ID = 77 #applied computer science

FIGSHARE_BIBTEX_TEMPLATE = """@InProceedings{ %(tag)s-openproc-2013,
  author    = { %(authors)s },
  title     = { %(title)s },
  booktitle = { Test Proceedings for OpenProceedings },
  year      = { 2013 },
  editor    = { Andrea Zonca },
  doi    = { %(doi)s },
  url    = { %(url)s }
}
"""
