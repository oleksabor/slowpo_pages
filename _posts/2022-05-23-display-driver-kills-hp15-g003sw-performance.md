---
layout: post
title: Display driver reduces HP 15-g003sw  performance
date: 2022-05-23 17:03:00 +3:00
description: Display driver reduces HP 15-g003sw  performance fresh OS setup when Windows update downloads drivers mouse pointer starts to lag
tags: [lifesucks,  рукаЖопи]
category: dev
lang: en
---

{% responsive_image path: assets/images/2022/installWindows.jpg alt: "install windows meme" %}

Memes are made from the reality I know.
We are geting to know each other better here and I was asked to install Windows because I'm a developer.

The computer is the HP 15-g003sw laptop (part number g2a33ea).
I installed Windows however the mouse pointer was very unresponsive that was bad surprise for me.
The 15-g003sw  laptop is not the most powerful model in the world however it should not be so slow.
The laptop has 4GB of Ram (originally) and 500GB HDD.

I thought that have disabled Windows telemetry in wrong way that causes slow mouse pointer movement.

I installed Windows again paying attention how mouse pointer performs on each step.
Both setup, copy files and start configuration have no impact on mouse pointer speed.
However the mouse pointer is starting to lag when internet is connected.

The problem was with the display adapter driver is being installed by Windows Update.
It caused mouse to stop responding on a touchpad.
The CPU load has about 90% load  also.

The HP support web site has the display driver available for the 15-g003sw model.  The driver works well. 
The only one problem was to download the correct  driver having mouse pointer reacting with 4 seconds lag.
 
You may find correct  AMD Radeon HD 8210  drivers version below

{% responsive_image path: assets/images/2022/scr2_015646.png  alt: "HP display driver" %} 
{% responsive_image path: assets/images/2022/scr3_015647.png g alt: "HP display driver" %}

It should be like 15.201.1101 built at 06.08.2015 
