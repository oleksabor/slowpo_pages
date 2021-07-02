---
layout: post
title: short syntax for WPF DependencyProperty registration
date: 2021-05-27 01:01:55 +03:00 
category: dev
---

Would like to share short syntax for depencecy properties registration found on web

{% highlight csharp %}
public static readonly DependencyProperty TypeNameProperty = RegisterProperty(_ => _.TypeName).OnChange(_ => _.OnTypeNameChanged);

public static readonly DependencyProperty BankClientProperty = RegisterProperty(_ => _.Client).Default(null);
{% endhighlight %}

Found at the https://github.com/dotnet/wpf/issues/2352

`DependencyPropertyRegistrar` source code is stored at the https://gist.github.com/zlatanov/8ed191d517d2a84529f66b73347cd7ca