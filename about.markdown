---
layout: single
title: About
permalink: /about/
---

Software developer from 
[Kyiv, Ukraine](https://www.google.com/maps/place/Kiev/@50.4020355,30.5326905,10z)

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

I have two projects almost-in-production besides my work.
* <a href="https://github.com/oleksabor/atropos/releases"  class="btn" title="GitHub"><i class="fab fa-fw fa-github" aria-hidden="true"></i><span>Atropos</span></a> application
  that calculates time user is logged in Windows. 
  I've created it to control how many time my son spends playing computer games.
* <a href="https://github.com/oleksabor/work-tracker"  class="btn" title="GitHub"><i class="fab fa-fw fa-github" aria-hidden="true"></i><span>Workout tracker </span></a> application for Android.
  I was interested in the new mobile development Flutter platform and has created the application to check is it so easy to use. 
  The application is working however still in beta phase: requires additional testing on different devices.
