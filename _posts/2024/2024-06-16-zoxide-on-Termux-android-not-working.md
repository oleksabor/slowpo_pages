---
layout: post
title: zoxide on Termux android not working
date: 2024-06-16 22:34:53 +03:00
description: run zoxide on termux andriod not working
tags: [android,bash]
category: dev
lang: uk
---

Just found [Zoxide](https://github.com/ajeetdsouza/zoxide) tool for *nix.

The only one problem i got is Zoxide was not working after 

> pkg install zoxide

command on Termux.

Error was `z command is unknown`.

From the [SO post](https://stackoverflow.com/questions/54970738/how-to-change-the-default-startup-folder-in-termux) 
I've learned that bashrc file on Termux is stored at `/data/data/com.termux/files/usr/etc/bash.bashrc`.

I've opened it in the `nano` editor and added a line with required configuration 

> eval "$(zoxide init bash)"

by `opened` i mean running bash command 
> nano /data/data/com.termux/files/usr/etc/bash.bashrc