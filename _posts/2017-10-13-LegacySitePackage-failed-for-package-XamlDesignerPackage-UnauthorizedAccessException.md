---
layout: post
title: LegacySitePackage failed for package [XamlDesignerPackage] UnauthorizedAccessException
date: 2017-10-13 21:27 
tags: [vs2017]
category: dev
lang: en
related: true
---

If you have `VS 2015` or `VS 2017` installed and suddenly `XAML designer` stopped to load with error like below:
```
LegacySitePackage failed for package [XamlDesignerPackage]Source: 'mscorlib' Description: Attempted to perform an unauthorized operation. System.UnauthorizedAccessException
```
Or `VS Tools - Options - XAML Designer` is not opened.

Then it may be possible that `perfc.dll` file ownership was broken. 
And even VS that is started as administrator has no chance to open this file.

You have to open `perfc.dll` file properties and take ownership back. 
File `perfc.dll` is located in the Windows folder (%WinDir%). 
I've used my domain user as new file owner. 
Also I've granted modify permissions to the Administrators groups for this file.

### UPD 
XAML designer can be broken in case of any `*.dll` or `*.exe` file without permissions were assigned to the user.

To find such files [code like this](https://developercommunity.visualstudio.com/comments/131028/view.html) can be used.
