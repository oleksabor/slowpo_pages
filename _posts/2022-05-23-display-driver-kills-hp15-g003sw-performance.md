---
layout: post
title: Display driver reduces HP 15-g003sw  performance
date: 2022-05-23 17:03:00 +3:00
description: Display driver reduces HP 15-g003sw  performance fresh OS setup when Windows update downloads drivers mouse pointer starts to lag
tags: [lifesucks,  рукаЖопи]
category: dev
lang: en
---

Memes are made from the reality I know.
We are getting to know each other better here and I was asked to install Windows (because _I'm a programmer_).

![developer install Windows meme](../assets/images/2022/installWindows.jpg)

##### mouse pointer lag
The computer is the HP 15-g003sw laptop (part number g2a33ea).
I installed Windows however the mouse pointer was very unresponsive that was bad surprise for me.
The 15-g003sw  laptop is not the most powerful model in the world however it should not be so slow.
The laptop has 4GB of Ram (originally, has been upgrated to 8GB) and 500GB HDD.

I thought that have disabled Windows telemetry in wrong way that causes slow mouse pointer movement.

I installed Windows again paying attention how mouse pointer performs on each step.
Both `setup`, `copy files` and `start configuration` steps have no impact on the mouse pointer speed.
However the mouse pointer is starting to lag when internet is connected.

The problem was with the display adapter driver is being installed by Windows Update automatically with internet connection available.
It caused mouse to stop responding on a touchpad.
The CPU load has about 90% also.

The HP support web site has the display driver available for the 15-g003sw model.  The HP's driver works well. 
The only one problem was to download the correct  driver having mouse pointer reacting with 4 seconds lag.

#### working display driver 
You may find correct  AMD Radeon HD 8210  drivers version below.

The display driver version should be like __15.201.1101__ built at __06.08.2015__.
This is the version supplied by HP and it is working fine.

#### lifehack
Now I think that driver download can be done in more comfortable way.
The idea is to install Windows skipping internet connection step (do not connect to a LAN or WIFI network).
And to stop Windows Update before connecting to the internet. 
Then it would be possible to download correct display driver and do not have mouse lagging problem. 
You may want to enable Windows Update later.
