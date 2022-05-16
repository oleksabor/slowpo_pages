---
layout: single
title: About
permalink: /about/
---

Software developer from Kyiv, Ukraine

* 1999 I've graduated from Kyiv Natioanal university of economics with a master's degree in information systems of economics.
* 1998-2004 worked in KINTO (securities dealer) as software developer and "responsible for everything" IT guy
* 2004-2007 in ProCredit bank Ukraine as software developer.
* 2007-2013 in representative office of Quipu Gmbh in Ukraine (as back-end developer)
* 2013-2022 as a private entrepreneur
* 2022- I enlisted to the army

 
{% assign author = site["oleksabor"] %}
{% if author.email %}
<a href="mailto:{{ author.email }}" class="btn" title="email">
<i class="fas fa-fw fa-envelope-square" aria-hidden="true"></i>
<span>email</span>
</a>{% endif %}{% if author.github %}
<a href="https://github.com/{{ author.github }}" class="btn" title="GitHub"><i class="fab fa-fw fa-github" aria-hidden="true"></i><span>GitHub</span></a>{% endif %}{% if author.stackoverflow %}
<a href="https://stackoverflow.com/users/{{ author.stackoverflow }}"  class="btn" title="StackOverflow">
<i class="fab fa-fw fa-stack-overflow" aria-hidden="true"></i><span class="label">Stack Overflow</span>
</a>
{% endif %}

Built with 
[Jekyll](https://github.com/jekyll/jekyll)

