---
layout: post
title: upgraded SDK to 31 and set android:exported to false
date: 2022-08-13 21:13:13 +03:00
description: upgraded Android application SDK to 31 and set android:exported to false caused application not to start
tags: [android,flutter]
category: dev
lang: en
---

I've met Google Play restriction while uploading test version recently.
The new release page prohibits to upload app bundle targeted to SDK below 31.

It was easy to locate and adjust `targetSdkVersion 31` in the `android/app/build.gradle` file.

However SDK 31 has a requirement to set `android:exported` value in the `android/app/src/main/ApplicationManifest.xml` file explicity.

You have to _choose wisely_ and set `android:exported="true"` for the `android:name=".MainActivity"` entry.

```xml
<activity
android:name=".MainActivity"
android:launchMode="singleTop"
android:theme="@style/LaunchTheme"
android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
android:hardwareAccelerated="true"
android:exported="true"
android:windowSoftInputMode="adjustResize">
```

Setting `android:exported="false"` is wrong and application fails to start in such case.
The error generated with `exported=false` main activity value is like below:

```
Permission Denial: starting Intent
```


