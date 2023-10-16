---
layout: post
date: 2022-05-09 19:06:00 +02:00
title: Publish to Jekyll web site from mobile
description: build and publish jekyll web site from mobile
tags: [hosting, Jekyll]
category: dev
lang: en
toc: true
toc_label: Content # defautl: Content
toc_sticky: true   # enables sticky toc
---

I do not have regular access to the notebook any more because of war.

{% responsive_image path: assets/images/2022/airAlert.png alt: "air alert notification" %}

However I'd like to keep posting some notes and make them available online rather than waiting for vacation to get to the notebook and run generator.

[Vercel](https://vercel.com) has free hosting plan for static personal web sites.
I'm using it as social media alternative.

### Building pages localy

So I had Vercel CI/CD pipeline established that copies generated html files.
Html files had been generated locally on my notebook.
Then I had to push generated html files to Github,
Vercel CI pipeline fires and updates the hosting environment.

### Building pages by CI/CD pipeline

Now it works almost the same but  publishing pipeline is activated by `.md` files modification.

Vercel pipeline generates html sources for the whole web site by creating Jekyll environment and building html sources.

Now i can use Vercel's environments feature.
A staging environment is created by a push to any branch.

{% responsive_image path: assets/images/2022/vercelStaging.png alt: "staging environment" %}

The production environment is updated by the main branch modification.

{% responsive_image path: assets/images/2022/vercelProduction.png alt: "production environment" %}

### Mobile phone prerequisites

To make `.md` files modifications I have installed
* Termux terminal application for Android.
  Works like *nix emulator, can have CLI utilities (like `git`) installed via package system. 
  Termux is outdated at Google Play market and has to be [downloaded manually](https://github.com/termux/termux-app#github).
* Text file editor 
  to adjust `.md` files. 
  I had bought QuickEdit+ but it can be any editor you like. 
  QuickEdit+ can render `.md` and is not expensive.
  
That is how can I update Jekyll powered blog within edits made on my mobile.

### Generic flow

Publishing process is made by several steps:
* update file in the git reposotory on phone
* push changes to GitHub
* Vercel watches for repository changes and starts build pipeline if any modification was made
* pipeline creates Jekyll build environment and generates html static pages from `.md`
* site is available online (as staging or production)

Seems I need light and small bluetooth keyboard for field notes :-)
 
