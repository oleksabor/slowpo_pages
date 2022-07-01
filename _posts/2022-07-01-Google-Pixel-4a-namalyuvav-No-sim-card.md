---
layout: post
title: Google Pixel 4a намалював No sim card
date: 2022-07-01 18:30:21 +03:00
description: 
tags: [lifesucks]
category: life
lang: uk
---

Гугл Піксель не бачить сім карту. 
Сім карту поміняв - не допомогло :-(

Пошук по інтернету сказав, що вирішується це в надрах Гугла заміною материнської плати.
Мені зараз серед пісків ще тільки цього не вистачало.

Нашукав ще цікаву 
[комбінацію з конфігурації стандартів gsm](https://support.google.com/fi/thread/14484935?msgid=15400024)
 (для Pixel 2).

> Dial *#*#4636#*#* to get to the network settings
(At first nothing happened for me, but after a few seconds the menu appeared.  If you don't see it at first, enter the code in the dialer again)

> Tap on Phone Information

> There's a small drop down with network settings. Check to make sure that it's set for: LTE/CDMA/UMTS auto (PRL)
(Mine was set to LTE/CDMA auto (PRL), no idea why it was different or what may have changed it)

Тільки це не допомогло - налаштування такі, як треба.
Посовав Enable DSDS (як у дружини) - не фуричить.
Всякі перезавантаження, витягти/вставити, safe mode нічого не змінили.

З плану Б є ще спроба перейти на eSim, хоча хто зна, в якому місці зламався цей телефон.

{% responsive_image path: assets/images/2022/pixel4a4636.png alt: "Pixel 4a gsm settings" %}
