---
layout: post
title: get symbol files and source code from Azure DevOps symbol server
date: 2019-01-24 20:05 
tags: [vs2017]
category: dev
---
Recently I've got a task to build package and use it for debugging purposes

We are using Visual Studion Team Services VSTS (or Azure DevOps) to create packages and use it internally. 
However it would be nice to have a possiblitiy to debug package directly from calling project.

To do it you will need symbol server to host package symbol files and source code for each package version.

VSTS has symbol server available as extension. So I've tried it first.

Actually to enable package debugging you have to do two simple steps:

* Upload symbol files and source code to the Symbol server
* Set up VS to use symbol server

First point can be easily implemented if you use VSTS build pipeline to create package.
Just check that you have `Publish symbols` and `Index sources` set on

{% responsive_image path: assets/images/2019/18771.jpg alt: "Azure DevOps symbol server" %}

You have to add nuget pack and nuget push tasks in the same build to get exact match between symbols and dlls uploaded.

Then when package is built and ready to be used you can consume it in the project.
To do it just add it using Package manager and update Visual studio settings:
* set AzureDevOps symbol server (Tools \ Options \ Debugging \ Symbols \ New Azure DevOps Symbol server location)

{% responsive_image path: assets/images/2019/18530.jpg alt: "Azure DevOps symbol server" %}
* allow source to be downloaded when debugging

{% responsive_image path: assets/images/2019/18954.jpg alt: "Azure DevOps symbol server" %}
