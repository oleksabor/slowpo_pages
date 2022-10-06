---
layout: post
date: 2022-05-09 11:06:00 +02:00
title: Exclude tags and categories from sitemap.xml
description: how to exclude generated tags and categories pages from sitemap.xml jekyll
tags: [Jekyll]
category: dev
lang: en
last_modified_at: 2022-10-06 10:49:00 +03:00
---

The jekyll-sitemap plugin has a feature to exclude pages from sitemap.xml

I'd like to use it to remove `tags` and `categories` from the sitemap.
However modifying  `_layouts` files header with the `sitemap: false` was not successful.
Still sitemap contains links to `tags` and `categories` pages.

According to jekyll-sitemap [documentation](https://github.com/jekyll/jekyll-sitemap#exclusions) `_config.yml` can have `sitemap: false` configured as well.

The problem is that I failed to apply sitemap exclusion using wildcards as shown by example.
Both `path: "tags/**"` or `path: "tags/**/*"` were not able to prevent tags (and categories) pages to be listed in the sitemap.

However filtration works fine if no multiplier is set. 
Here is sample from my `_config.yml`.

```
# removing tags and categories pages from the generated sitemap.xml
defaults:
  -
    scope:
      path:            "tags"
    values:
      sitemap:         false
      noindex:         true
  -
    scope:
      path:            "categories"
    values:
      sitemap:         false
      noindex:         true
```

#### UPD noindex tag
`noindex:         true` should be added to the `defaults` to exclude `tags/*` and `categories/*` pages from the indexing.
However the problem is that the root `/categories/index.html` page does't have the `noindex` tag despite the defaults configuration.

I had to copy the `_layouts/categories.html` to the local folder from the **Minimal-mistakes** scheme sources.
Then I have adjusted the local copy of `categories.html` and appended `noindex: true` line to the layout header like below.

```
---
layout: archive
noindex: true
---
....
```

The `_layouts/defaults.html` file has been copied as well.
I've modified the `head` section by adding check for `.noindex` value:
{% raw %}
```html
  <head>
    { % include head.html % } 
    {% include head/custom.html %}
    {% if page.noindex or layout.noindex%}
    <meta name="robots" content="noindex">
    {% endif %}
  </head>
``` 
{% endraw %}

