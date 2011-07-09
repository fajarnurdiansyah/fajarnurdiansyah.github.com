---
layout: post
title: Why Can't Android Have A Smooth UI Animation?
intro: This sucks.
---
css: published/style.css
title: Why android can't have smooth UI animation
doc_prefix: whycantandroidhavesmoothUI

Last week I had the unfortunate experience of trying out an iOS device. Unfortunate because it leaves a bad aftertaste knowing what I'm missing with my android phone. [^lgp500] The thing is slick. Every animation is buttery smooth and the browsers doesn't stutter at all when scrolling. 

This isn't the case on android smartphone. If you never try iOS, android animation will be passable, but try playing with an iPhone for a few minutes and it will totally ruin the experience of your perfectly good android. It is guilty of the greatest sin of animation: low framerates. A few minutes of googling revealed the main issue: Android doesn't use GPU to draw UI to the screen. Instead, all this graphic heavy job is done by the CPU.

This is logged as [issue 6914] in android official issue tracker. Last time I checked, 1732 people starred this issue and based on their feedback, even high end smartphone like Galaxy S2 with dual core processor suffer from "laggy and choppy UI".

A member of android dev team, [Romain Guy] explained on the thread why android can't have GPU accelerated animation in the UI and browser:

> This is something we've investigated a couple of years ago already and that we revisit regularly. Of course we thought of using the GPU, but there are non-trivial issues on many Android devices (a G1-class device for instance supports only one OpenGL context at a time, which would prevent you from using any OpenGL based app like games or augmented reality apps.) In our past experiments we even found many cases in which using the GPU was slower than normal rendering.
>
>New devices might allow us to overcome the past limitations that made GPU support a not-so-good solution.
>
>The "choppiness" and "lagginess" you are mentioning are more often related to heavy garbage collection than drawing performance.

On Jan 26 Romain [closed] the issue and marked it as released for android 3.0. It still doesnt run perfectly smooth but great progress nonetheless. Knowing how adept the devices manufacturer is on releasing android updates, I don't expect my phone to ever run this version. The latest version promised for LG Optimus One is Gingerbread, promised to be released on May 2011. Almost 2 months ago. Still no news.

/endrant

[issue 6914]: http://code.google.com/p/android/issues/detail?id=6914
[Romain Guy]: http://www.curious-creature.org/
[closed]: http://code.google.com/p/android/issues/detail?id=6914#c197

[^lgp500]: An LG Optimus One P500 running Android 2.2.2 Froyo. Obviously a budget, low end android device, but a very capable one. The spec should be comparable to the iPhone 3GS.
