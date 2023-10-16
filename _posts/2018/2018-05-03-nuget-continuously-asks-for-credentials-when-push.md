---
layout: post
title: nuget continuously asks for credentials when push
date: 2018-05-03 10:11 
tags: [nuget,vsts]
category: dev
---

Recently I've stuck with nuget push credentials problem

I'm using the `vsts` package host to handle custom packages
The problem is that when the `nuget push` command is executed from my local machine credentials are asked several times and then timeout exception is raised. 
Sequence [login, then organization login page, password] is repeated three times and the timeout error is raised

I've provided an `apikey` and `source` parameters in the `nuget` command line parameters.
However nuget tries to get source url first of all that causes credentials to be asked.

so i run the command

```
& nuget push $nupkgname -ApiKey $apikey -Source $packagehost
```

and see that fiddler shows a request

```
GET https://_org_.pkgs.visualstudio.com/_packaging/_guid_/nuget/v3/index.json HTTP/1.1
User-Agent: VSServices/15.112.26224.0 (CredentialProvider.VSS.exe) VssPkgsAuthLib/0.34.0.0 CredentialProvider.VSS/0.34.0.0
```
with response
```
TF400813: Resource not available for anonymous access. Client authentication required.
```
This is strange since the same apikey is working fine when used from `vsts` build private agent.
However the `nuget push` task uses different command (`VstsNuGetPush`), with the `accesskey` parameter.
I've checked an `api key` permissions and it was fine (read, write and manage).

```
_work\_tasks\NuGetCommand_333b11bd-d341-40d9-afcf-b32d5ce6f23b\2.0.27\VstsNuGetPush\0.13.0\VstsNuGetPush.exe C:\build.agent\hosted\_work\3\a\package.0.2.19.nupkg -Source https://_org_.pkgs.visualstudio.com/_packaging/_guid_/nuget/v3/index.json -AccessToken ******** -NonInteractive -Verbosity Detailed
```

First idea was to use the `VstsNugetPush` command instead of `nuget.exe` tool.
However the v3 `nuget` feed has several links but the v2 feed version is an ordinary atomic feed.

So I changed `v3` to `v2` and package was pushed without any problem

```
nuget push packagename -apikey keyvalue -Source https://_org_.pkgs.visualstudio.com/_packaging/_guid_/nuget/v2/ 
```
does not cause additional credentials to be entered by user
