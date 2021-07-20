---
layout: post
title: read assemblyversion from text file in the cmd script
date: 2019-06-04 23:44 
tags: [csharp, .net]
category: dev
lang: en
---
recently I've got the task to read AssemblyVersion value from the AccemblyInfo.cs file in the cmd batch script

This can be easily solved using PowerShell but requires signed PS script (or PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command )

however the same can be done using windows cmd batch file. 
Please find command below

```
for /F delims^=^"^ tokens^=2 %%a in ('findstr AssemblyVersion properties\AssemblyInfo.cs') do set version=%%~a
```

explanation:

`for /F in` starts string parsing

`findstr AssemblyVersion properties\AssemblyInfo.cs` finds line from the AssemblyInfo.cs file with `AssemblyVersion` in it.

`delims^=^"^` defines double quotes to be delimiter for string that is going to be parsed

`tokens^=2` configures for to take second delimiter in the string is going to be parsed

`do set version=%%~a` sets version variable to the string found by for.

`%%~a` removes double quotes if `%%a` has the value with double quotes around


so `findstr` result is the string like `[assembly: AssemblyVersion("1.2.3.4")]`

`for` parses the line that has been found by `findstr` and uses double quotes as delimter. 
It returns set of values like below
```
[assembly: AssemblyVersion(
1.2.3.4
)]
```

`tokens^=2` instructs for to get second token from the set of values.
and here we are - `%version%` variable contains value between `[assembly: AssemblyVersion(` and `)]` from the AssemblyInfo.cs file
