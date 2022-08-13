---
layout: post
title: Google Pixel 4a намалював No sim card
date: 2022-07-01 18:30:21 +03:00
description: Google Pixel 4a shows No sim card unexpectedly
tags: [lifesucks]
category: life
lang: uk
last_modified_at: 2022-07-13 15:56:00 +03:00
---

Гугл Піксель не бачить сім карту.
No sim card і все.
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
Якщо це здох весь gsm модуль - тоді пічаль.

{% responsive_image path: assets/images/2022/pixel4a4636.png alt: "Pixel 4a gsm settings" %}

UPD 
В Києві ремонт навряд чи можливий: _відсутні запчастини_. Хоча по телефону казали _треба тестувати, днів 10_.

Аукціон на allegro.pl не виграв. 
Мабуть і добре, економії було б хай 1000 грн але виникає питання доставки і проходження митного контролю.
Питання _чи не вкрадуть по дорозі?_ та _скільки навісять мита?_ Так-то meest - працює.

Відправити в Америку на ремонт - правлять одразу 270$ що демотивує.

{% responsive_image path: assets/images/2022/pixel270.png alt: "Pixel 4a gsm settings" %}

Купив тут бушний сумного чорного кольору за 7000 грн.
Підозрюю що з того самого allegro тільки привезений в кармані.

Взагалі дивує, що невеликих охайних телефонів роблять все менше.
Доки живий канал постачання 4х пікселів в західні області неньки - можна жити.
А там і чіпізація населення, сподіваюсь бо носити великі телефони - банально карманів не вистачає.
