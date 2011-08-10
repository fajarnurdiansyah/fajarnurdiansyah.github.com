---
layout: post
title: Top Bookmarklet for Web Reading
intro: Lazy people do stuff effectively
published: true
---
doc_prefix: topbookmarkletforwebreading

Try install a time tracking software on your computer. Usually a small app running in the background that record what application you are spending your time with.[^time tracking] I bet the top, most used application will be a web browser.

[![XKCD comic][1]{:title="xkcd: Mac/PC" .right}][2]
[1]: http://imgs.xkcd.com/comics/mac_pc.png
[2]: http://xkcd.com/934/

Web browser have become a big part of our computing life. From my own experiment with tracking, I know that web browser is 60% of my time. 

When you spend so much time in an application, you're bound to develop a few tricks to make your life easier. Most people use browser plugin. While Chrome [^Chrome] now supports plugin, I generally avoid them and try to use as few plugins as possible. Plugins in Chrome runs as a separate process and reserves a slice of memory even when you are not using them, while bookmarklet is just a bookmark that execute code only when you run it. Another advantage of bookmarklet is that they are mostly browser agnostic.[^agnostic] If your browser support javascript, it support bookmarklet.

[^Chrome]: My favorite browser. I you never used it, give it a try.

This is a list of my bookmarklet collection so far.

## <a id="bookmarklet" href="javascript:(function(){_readableOptions={'text_font':'quote(Quattrocento), quote(Quattrocento Roman Regular), quote(Palatino Linotype), Palatino, quote(Book Antigua), Georgia, serif','text_font_monospace':'quote(Lucida Console), quote(Andale Mono), Monaco, monospace','text_font_header':'quote(OFL Sorts Mill Goudy TT), Palatino, Georgia, serif','text_size':'22px','text_line_height':'1.5','box_width':'30em','color_text':'#F0F0F0','color_background':'#343A3A','color_links':'#99CCFF','text_align':'normal','base':'blueprint','custom_css':'#box{width:25em;text-shadow: #DDD 0px 0px 1px;}blockquote { padding: 0em 0em 0em 0.7em; font-style: normal; margin-left: 1em;border-left: solid 1px #AAA;}'};if(document.getElementsByTagName('body').length>0);else{return;}if(window.$readable){if(window.$readable.bookmarkletTimer){return;}}else{window.$readable={};}window.$readable.bookmarkletTimer=true;window.$readable.options=_readableOptions;if(window.$readable.bookmarkletClicked){window.$readable.bookmarkletClicked();return;}_readableScript=document.createElement('script');_readableScript.setAttribute('src','http://readable-static.tastefulwords.com/target.js?rand='+encodeURIComponent(Math.random()));document.getElementsByTagName('body')[0].appendChild(_readableScript);})()">Readable</a> -- [Tastefulwords]
This is my most used bookmarklet. It works very much like Readability or Reader Mode in safari, using some black magic it extracts the main text of an article and presents it to you in a simple, easy to read layout. Very useful considering the current state of the web that push publisher to put more and more ad to generate revenue.[^ad]

It is more customizable than the competition. You can choose your font style, size, header, color, even add your own css code. This what made me chose this over the alternative like Readability or viewtext. 

## [Read Later] -- [Instapaper]
The time shifting software by Marco Arment, one of the early developer of tumblr. When you don't have time to read, use this bookmarklet to save the article to instapaper, and you can read it later when you have the time. There's an application for iPhone and Android that sync with your reading list, making sure that the article is available to you even when you are offline. 

This is very useful because the best article always seems to show up when you are doing something important.

## [Bitly Sidebar] -- [Bit.ly](http://bit.ly)
This one is for sharing things on twitter. It automatically shorten the url and if you select any text, it will use it as the default tweet text. You need to register first and then authenticate it to twitter.

## [Share on Tumblr] -- [Tumblr](http://tumblr.com)
If you have a tumblr account, use this to quickly share stuff. It can automatically detect post type like photo, quote, or link most of the time.

## [View on Flick] -- [Flick](http://flick.fajarnurdiansyah.com)
I wrote this one myself. If you are currently opening a flickr page, this will take you to the equivalent page in flick, a flickr web client I wrote on my spare time. Unlike flickr, flick usually load faster and more importantly, it's not blocked in most company network.


[Instapaper]: http://www.instapaper.com
[Tastefulwords]: http://readable.tastefulwords.com

[Read Later]: javascript:function%20iprl5(){var%20d=document,z=d.createElement('scr'+'ipt'),b=d.body,l=d.location;try{if(!b)throw(0);d.title='(Saving...)%20'+d.title;z.setAttribute('src',l.protocol+'//www.instapaper.com/j/YpdELsFR0ryf?u='+encodeURIComponent(l.href)+'&t='+(new%20Date().getTime()));b.appendChild(z);}catch(e){alert('Please%20wait%20until%20the%20page%20has%20loaded.');}}iprl5();void(0)

[Bitly Sidebar]: javascript:var%20e=document.createElement('script');e.setAttribute('language','javascript');e.setAttribute('src','//bitly.com/bookmarklet/load.js');document.body.appendChild(e);void(0);

[Share on Tumblr]: javascript:var%20d=document,w=window,e=w.getSelection,k=d.getSelection,x=d.selection,s=(e?e():(k)?k():(x?x.createRange().text:0)),f='http://www.tumblr.com/share',l=d.location,e=encodeURIComponent,p='?v=3&u='+e(l.href)%20+'&t='+e(d.title)%20+'&s='+e(s),u=f+p;try{if(!/^(.*\.)?tumblr[^.]*$/.test(l.host))throw(0);tstbklt();}catch(z){a%20=function(){if(!w.open(u,'t','toolbar=0,resizable=0,status=1,width=450,height=430'))l.href=u;};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();}void(0)

[View on Flick]: javascript:(function(){var%20str=location.href;str=str.replace('www.flickr','flickrforsalaryman.appspot');var%20regs=new%20RegExp('x\/t\/[0-9]+\/','g');str=str.replace(regs,'');;location.href=str;})();

[^time tracking]: I tried [wakoopa](http://social.wakoopa.com) and [rescue time](http://www.rescuetime.com). Both have free version and highly recommended.
[^vs]: I track time on both office and home computer, so it only make sense if Visual studio only got a third of my time in a day.
[^ad]: I'm not saying publisher are wrong by placing ad on their content, it just this business model is not helping anyone.
[^agnostic]: Mobile browser on smartphone needs a little bit of adjustment to make it work like their desktop counterpart.