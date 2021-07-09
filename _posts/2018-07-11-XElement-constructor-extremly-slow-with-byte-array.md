---
layout: post
title: XElement constructor extremly slow with byte[] array
date: 2018-07-11 09:52 
tags: [.net]
category: dev
---
Recently I've tried to build a xml document using Linq to XML classes like `XDocument` and `XElement`
One element has to contain byte array. I've checked
`XElement(XName name, object content)`
constructor and found that it works fine for `DateTime`, `string` `decimal` or `bool`.

Then I've wrote something like code below:

{% highlight csharp %}
var c = 1;
var buf = GetBytes(c);

x = new XElement("testB", buf);
{% endhighlight %}

(I will show the `GetBytes` method later but it returns requested array of bytes)

For small arrays (up to 100KB) code above works fine. 
However I've tried to put 512KB using this approach and program halted.

I've made some investigations trying to put byte array to the xml and below are results:
```
testB in 2592ms (50KB)
testB in 11514ms (100KB)
testB in 29173ms (150KB)
testB in 40936ms (175KB)
```

it means that to execute `XElement` constructor with 175KB byte array takes about 40 seconds (!)

I've checked `XElement` source code and found that this behaviour is caused by string concatenation

{% highlight csharp %}
// System.Xml.Linq.XContainer
internal void AddStringSkipNotify(string s)
{
    this.ValidateString(s);
    if (this.content == null)
    {
        this.content = s;
        return;
    }
    if (s.Length > 0)
    {
        if (this.content is string)
        {
            this.content = (string)this.content + s; // exactly this code executed 512000 times shows why string concatenation should not be made
            return;
        }
...
    }
}
{% endhighlight %}

The `AddStringSkipNotify` method is executed for each element of the byte array (`IEnumerable` object passed to the `XElement` content parameter):

{% highlight csharp %}

// System.Xml.Linq.XContainer source code
internal void AddContentSkipNotify(object content)
{
... // some checks are here for predefined types
IEnumerable enumerable = content as IEnumerable;
    if (enumerable != null)
    {
        foreach (object current in enumerable)
        {
            this.AddContentSkipNotify(current);
        }
        return;
    }
    this.AddStringSkipNotify(XContainer.GetStringValue(content));
}
{% endhighlight %}

To resolve this issue I converted byte array to the `Base64` string and pass a sting as `content` parameter value:

{% highlight csharp %}

var c = 175;
var buf = GetBytes(c);

x = new XElement("testB", Convert.ToBase64String(buf));
{% endhighlight %}

