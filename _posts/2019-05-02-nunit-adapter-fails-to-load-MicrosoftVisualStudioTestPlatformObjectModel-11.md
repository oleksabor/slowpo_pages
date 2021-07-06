---
layout: post
title: nunit adapter fails to load Microsoft.VisualStudio.TestPlatform.ObjectModel 11
date: 2019-05-02 23:52 
tags: [.net]
category: dev
---
Today I've met with the error message below

> testhost.x86.exe System.IO.FileNotFoundException: Could not load file or assembly 'Microsoft.VisualStudio.TestPlatform.ObjectModel, Version=11.0.0.0'

The problem occurs on the computer that has no .Net Framework 3.5 installed (4.5 and newer frameworks are installed)


It can be fixed by installing Microsoft.VisualStudio.TestPlatform.ObjectModel package from the nuget.org and using app.config with assembly binding from version 11 to 14:
```xml
<runtime>
<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
<dependentAssembly>
<assemblyIdentity name="Microsoft.VisualStudio.TestPlatform.ObjectModel" publicKeyToken="b03f5f7f11d50a3a" culture="neutral" />
<bindingRedirect oldVersion="11.0.0.0-14.0.0.0" newVersion="14.0.0.0" />
</dependentAssembly>
</assemblyBinding>
</runtime>
```

upd: I'd like to add that this happens if test code tries to load all assemblies in the folder (like plugin search does)
