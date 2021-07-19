---
layout: post
title: TF400030 The local data store is currently in use
date: 2018-06-01 10:00 
tags: [tfs]
category: dev
description: fix error TF400030 The local data store is currently in use by another operation
---
I've initiated get latest version operation for local workspace using command line utility `tf.exe`

It was created as local workspace by default but there were a lot of files under source control.

`tf.exe` hanged up because of local workspaces limitations and has broken some logical workspace structure. 
It was not possible to view/update/remove this broken workspace. 
`SourceControlExplorer` and `tf.exe` hang up when any operation was started. 
`Task Manager` has shown hig CPU usage and memory consumption

VS shows the error

```
TF400030: The local data store is currently in use by another operation. Please wait and then try your operation again. If this error persists, restart the application.
```
I've tried to clear the TFS cache folder (appdata\local\Microsoft\Team Foundation\7.0\Cache) but no luck

Solution is to delete the `$tf` folder that is located in the root of the workspace folder. This helped me.
I converted local workspace to the server one immediately

