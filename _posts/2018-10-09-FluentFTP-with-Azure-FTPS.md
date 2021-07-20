---
layout: post
title: FluentFTP with Azure FTPS
date: 2018-10-09 09:47 
tags: [azure,.net]
category: dev
lang: en
---
I've just tried to connect to Azure FTPS site using
[FluentFTP](https://github.com/robinrodricks/FluentFTP)
library. 
Local `FileZilla` server tests were passed successfully but Azure FTPS connection fails.

Error looks like
> System.IO.IOException: Authentication failed because the remote party has closed the transport stream.
   at System.Net.Security.SslState.StartReadFrame(Byte[] buffer, Int32 readBytes, AsyncProtocolRequest asyncRequest)



Finally I've resolved this issue by using the `SslProtocols.Tls12` option like below

{% highlight csharp %}

var cln = new FtpClient(s.Url, s.Port, s.User, s.Password);
cln.EncryptionMode = FtpEncryptionMode.Implicit;
cln.SslProtocols = SslProtocols.Tls12;

{% endhighlight %}
