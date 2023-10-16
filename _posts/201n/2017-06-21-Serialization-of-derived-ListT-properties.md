---
layout: post
title: Serialization of derived List<T> properties
date: 2017-06-21 13:23 
tags: [xml serialization]
category: dev
lang: en
related: true
---

Derived from `List` class properties are not serialized. 
So if you have

{% highlight csharp %}

public class Mapping : List<string>
{
	public string Name {get; set;}
}
{% endhighlight %}

`XmlSerializer` will not serialize `Name` property value at all.

I've just found that `XmlSerializer` does the same if class implements `IEnumerable`
So for class definition like below:

{% highlight csharp %}

public class Mapping : IEnumerable<string>
{
	public string Name {get; set;}
}
{% endhighlight %}

will cause `XmlSerializer` to omit Name property values from serialization.

https://forums.asp.net/t/1267870.aspx?Serialization+of+derived+List+T+properties

