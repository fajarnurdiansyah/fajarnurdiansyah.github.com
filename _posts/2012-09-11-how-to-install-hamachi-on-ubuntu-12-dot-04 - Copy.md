---
layout: post
title: "How to Install Hamachi on Ubuntu 12.04"
date: 2012-09-11 15:42
comments: true
published: false
intro: 
---
This guide is for installing Hamachi on Ubuntu 12.04. Hamachi is a vpn tool for connecting to LogMeIn network.

First, make sure you have tun enabled. 

Hamachi require LSB, so install that too.

{% highlight bash %}
$ sudo apt-get install lsb
{% endhighlight %}

After you have a working tun device and LSB, download Hamachi installer from [LogMeIn labs][1] and install it using dpkg.

{% highlight bash %}
$ wget https://secure.logmein.com/labs/logmein-hamachi_2.1.0.76-1_amd64.deb
$ sudo dpkg -i logmein-hamachi_2.1.0.76-1_amd64.deb
{% endhighlight %}

Now we can start the hamachi daemon.

{% highlight bash %}
$ sudo service logmein-hamachi start
{% endhighlight %}

You can find out your options with this command

{% highlight bash %}
$ hamachi help
{% endhighlight %}

{% highlight bash %}
$ sudo hamachi do-join 057-682-285
{% endhighlight %}

{% highlight bash %}
$ sudo hamachi set-nick officepc
{% endhighlight %}

{% highlight bash %}
$ sudo hamachi login
{% endhighlight %}

{% highlight bash %}
$ sudo hamachi list
{% endhighlight %}

{% highlight bash %}
$ ping 5.163.224.23
{% endhighlight %}


[1]: https://secure.logmein.com/labs/#HamachiforLinux
