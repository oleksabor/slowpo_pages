---
layout: post
date: 2022-05-09 11:06:00 +02:00
title: Exclude tags and categories from sitemap.xml
description: how to exclude generated tags and categories pages from sitemap.xml jekyll
tags: [Jekyll]
category: dev
lang: en
---

The jekyll-sitemap plugin has a feature to exclude pages from sitemap.xml

I'd like to use it to remove `tags` and `categories` from the sitemap.
However modifying  `_layouts` files header with the `sitemap: false` was not successful.
Still sitemap contains links to `tags` and `categories` pages.

According to jekyll-sitemap [documentation](https://github.com/jekyll/jekyll-sitemap#exclusions) `_config.yml` can have `sitemap: false` configured as well.

The problem is that I failed to apply sitemap exclusion using wildcards as shown by example.
Both `path: "tags/**"` or `path: "tags/**/*"` were not able to prevent tags (and categories) pages to be listed in the sitemap.

However filtration works fine if no multiplier is set. Here is sample from my `_config.yml`.

```
# removing tags and categories pages from the generated sitemap.xml
defaults:
  -
    scope:
      path:            "tags"
    values:
      sitemap:         false
  -
    scope:
      path:            "categories"
    values:
      sitemap:         false
```


