---
layout: post
title: darktable після lightroom
date: 2026-05-14 09:28:14 +03:00
description: 
tags: [photo,diy]
category: life
lang: uk
---

Перестав платити за Lightroom у 2022 році.
В 2025 після відпустки "проявив" фото в darktable.

Весною 2026 року сів за darktable i зрозумів що забув геть усе.
Пошуком прибило  
[darktable 5.4 - A Simple Beginner Workflow and Interactive Walkthrough](https://www.darktable.org/2025/12/darktable-5.4-beginner-workflow/)
тільки не вистачає редагування тіней `shadow highlights`.

Друга, виявилась більш помічна (цілий цикл), 
[How I Develop Photos With Darktable](https://luxagraf.net/essay/tools/developing-photos-with-darktable)

Набрав собі preset `scene-reffered` згідно рекомендацій з зазначених посилань:
* base
  * sigmoid
  * crop
  * tone equalizer - ввімкнути за потреби і на `advanced` посовати криву компенації експозиції, виходить майже `shadow highlits`
  * exposure - підкрутити трохи значення `exposure`
  * orientation - авто
  * highlight reconstruction - авто
  * white balance - все в авто
* color
  * AgX - тицьнути `auto tune levels`, `contrast`, `shoudler power` (контраст в світах) і `saturation`
  * color calibration - найбільш складна частина, зробити білий білим
* correct
  * lens correction - вмикається автоматично для raw файлів
* effect
  * diffuse or sharpen (вибираю зазвичай preset sharpen demisaicin/AA filter)

Сподіваюсь, наступної відпустки буду менш шукати.

PS 
Відео знімати фотоапаратом з рук без штатива або програмного стабілізатора - марна справа.
