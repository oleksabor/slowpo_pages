---
layout: post
title: hap be lite від Mikrotik
date: 2026-10-27 23:15:45 +02:00
description: Mikrotik hap be lite wifi freezes version downgrade for RouterOS 
tags: [diy,Mikrotik]
category: life
lang: uk
---

На рідній прошивці, що була по замовченню з магазину (забув, яка) а також на 7.25, 7.26beta3 WIFI переставав працювати десь за годину півтори-дві.
Симптоми такі : 
після двох або півтори годин роботи підключені клієнти отримували помилки авторизації, нові клієнти не могли підключитись.
Підключення по дроту працювало без змін.

За порадами на форумі Mikrotik спробував провести downgrade з прошивки 7.26beta3 на 7.24.5 і десь налажав:
роутер припинив завантажуватись нормально.
Мабуть через те що скріпт по замовченню був з 7.26beta3 а встановлена була 7.24.5 (або з інших причин).

Оновлення через netInstall з Windows не запрацювало взагалі - помилка `recv з буферу timeout`.

Оновлення через netInstall з Ubunbtu генерувало помилки 
* `Unknown BOOTP architecture option Flashboot` 
  для команди `sudo ./netinstall-cli -v -i eno1 routeros-7.24.5-arm.npk`
* та `Could not determine architecture for BOOTP request from`
  для команди `sudo ./netinstall-cli -v -i eno1 routeros-7.25-arm.npk`.

Поки роутер не хотів встановлювати 7.24.5 (а може і хотів але мовчав) методом тика з'ясував: 
при генерації помилок netInstall можна підключитись до роутера через WinBox.

Підключився, встановив паролі користувачів, зробив Reset configuration і далі отримав чистий як сльоза Mikrotik.
Налаштував default config але виникла інша проблема - не знаходились wifi1 wifi2 інтерфейси.

З'ясував що в RouterOS для `hap be lite` 
[має використовуватись](https://manual.mikrotik.com/docs/wireless/wifi/) 
`wifi-mediatek` package.
При його використанні почали відображатись wifi1 wifi2 інтерфейси роутера.
Для активації `wifi-mediatek` необхідно в `System\Packages` зробити Enable для пакета і Disable для `wireless` `wifi-qcom` і перезавантажити роутер.

В мене після спроб пониження версії RouterOS на 7.24.5 по замовченню чомусь був активний старий `wireless` пакет.
Саме тому інтерфейси `wifi1` `wifi2` не відображались в WIFI інтерфейсах.

{% responsive_image path: assets/images/2026/routerOSwifiMediatek.png alt: "routerOS wifi package list for hap be lite" title: "так має бути для hap be lite" %}

Після оновлення RouterOS на 7.24.5 також оновив firmware RouterBOARD до версії 7.25.4.
Це можна зробити через меню `System\RouterBOARD`.
`Current firmware` покаже що за версія встановлена.
`Upgrade firmware` покаже на яку версію буде проведено оновлення якщо натиснути Upgrade.

Зараз тестую чи дійсно 7.24.5 буде стабільно працювати.

Вказаний пароль в WiFi configuration не підтягується в mld1 wifi1 wifi2.
Треба для кожного інтерфейсу прописувати пароль окремо.