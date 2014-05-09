---
title: "shoes 4 pre release!"
slug: "shoes-4-pre1-release"
date: 2014-05-10 16:00
layout: default
---

<div class='hero-unit'>
  <h1>The Shoes Blog</h1>
</div>
<h2><a href="{{ post.url }}">shoes 4.pre1 released!</a></h2>
<h3>2014-05-10 16:00</h3>

Hello shoesers out there! Long time no see! Wondering what we have been up to?

Well we've been hard at work working on [shoes 4](https://github
.com/shoes/shoes4) - and today is a happy day because we can announce the
first preview release!

## shoes 4?

shoes 4 is a complete rewrite of the shoes DSL, shoes 3 is great but it has its
 problems... e.g. a lot of C-code which made it hard to maintain plus
 installation problems that were hard to fix.

shoes 4 is a united effort of the community to make shoes easy and fun again.
 The primary purpose is to re-implement the functionality shoes3 offered,
 improving features and squashing bugs along the way while making it easily
 runnable on every operating system again.
Also it's an all ruby rewrite - no C or Java code - just ruby. Easy to
maintain. Easy to contribute! It has been in the making for almost 2 years now.

shoes 4 uses [jruby](http://jruby.org/) to leverage the cross platform power of
[swt](http://www.eclipse.org/swt/) to build GUIs. That means you need to have a
JVM installed but don't worry - all you need to ever write and worry about
is ruby, not Java.

## Preview Release?

shoes 4 is not quite done yet - this is the first release after almost 2 years
 of work - it's not quite ready for production use and is missing some
 features. However there is already a lot in there and a lot of vintage shoes
  programs run just fine and it's definitely possible to enjoy the power of
  shoes again!

### What's in?

* All shoes elements and DSL methods except for video are implemented
* almost [600 resolved issues](https://github.com/shoes/shoes4/issues?state=closed)
* over 2000 commits
* many vintage shoes samples [are running](https://github
.com/shoes/shoes4/blob/master/samples/README)
* ability to install as a gem!
* contributions from a lot of amazing people

### What's missing?

* proper handling of quite some styles/methods for the elements
* installers (right now it's "just" a gem)
* packaging functionality - that's one of the big things missing a proof of
concept for jar/mac apps exists though
* support for the video element, which has also been dropped for now ([see this issue](https://github.com/shoes/shoes4/issues/113))
* correct disposal of all operating system resources - e.g. might run into
out of handles errors
* check [our issue tracker](https://github.com/shoes/shoes4/issues) for full
blown list of known issues/feature requests

## How do I get this and run this?

Alright, alright - enough talking!

At first you have to install [JRuby](http://jruby.org/) - preferably a
version of the 1.7 series (most current release is 1.7.12). If you use rvm
you can do it like this: `rvm install jruby`

Then while JRuby is selected as your main ruby do:

    gem instal shoes --pre

et voila!

After installing the gem successfully you should have a `shoes` command
available to you on the console for running shoes programs. E.g.

    shoes path/to/my/program/my_app.rb

If you want to install shoes 4 straight from the github resources there are
instructions at our [github repository README](https://github
.com/shoes/shoes4#installing-shoes4-from-github).

If you run into issues we'd appreciate it immensely if you reported them in
[our issue tracker](https://github.com/shoes/shoes4/issues). Thank you <3

Also of course contributions, pull requests and feedback are extremely welcome!

## The road to a 4.0 release

This pre release is the first step on our way to a full blown of 4.0
release.

There will be subsequent pre-releases when we feel that a large enough set of
issues has been fixed. You can have a look at our [milestone](https://github.com/shoes/shoes4/issues/milestones) to see the overall progress.

The next big step is releasing a release candidate, that might as well take a
 while. We already have over 70 issues lined up that we want to fix. Please
 report more though - we want to ship a bug free and fun software!

## Thanks

Last but not least heaps of thanks to everyone who ever contributed to shoes
(shoes 4 already has nearly 40 contributors! Wooohoooo!!!), reported an issue,
gave us feedback or just used shoes and had a lot of fun with it.

Special thanks goes to the JRuby organization which always supported us
straight from the start with advice, quick fixes and giving us a total of 3
of their Google Summer of Code slots so we could have students working on
shoes for 3 months. This release wouldn't have happened yet without their help.

 Also thanks to you for reading this far and hopefully trying to install
 shoes and running it.