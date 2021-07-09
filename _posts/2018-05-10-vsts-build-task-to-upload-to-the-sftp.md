---
layout: post
title: vsts build task to upload to the sftp
date: 2018-05-10 10:08 
tags: [azure,sftp]
category: dev
---
`VisualStudioTeamServices` can upload files to the FTP host using FTP upload task

However only ftp and ftps protocol extension are supported by this task

To upload files on sftp host you have to use the 
[Copy files over SSH](https://github.com/Microsoft/vsts-tasks/issues/3195)

You have to set up the `SSH endpoint` and select it in the task configuration. 
Put host name without protocol value and leave the public key field empty in the `SSH endpoint` configuration.

Set a source folder (like `$(Build.ArtifactStagingDirectory)` ) and a file filter (`*.7z`) and a target folder with the path value on the remote host.

You are ready to copy files in `vsts` build over sftp protocol.
