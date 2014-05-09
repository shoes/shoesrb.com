---
title: "Shoes 4 pre release!"
slug: "shoes-4-pre1-release"
date: 2014-05-10 16:00
layout: default
---


# shoes 4.pre1 released!

Hello shoesers out there! Long time no see! Wondering what we have been up to?

Well we've been hard at work working on [shoes4](https://github
.com/shoes/shoes4) - and today is a happy day because we can announce the
first preview release!

## shoes4?

shoes4 is a complete rewrite of the shoes DSL, shoes3 is great but it has its
 problems... e.g. a lot of C-code which made it hard to maintain plus
 installation problems that were hard to fix.

shoes4 is a united effort of the community to make shoes easy and fun again.
Also it's an all ruby rewrite - no C or Java code - just ruby. Easy to
maintain. Easy to contribute! It has been in the making for almost 2 years now.

shoes4 uses [jruby](http://jruby.org/) to leverage the cross platform power of
[swt](http://www.eclipse.org/swt/) to build GUIs. That means you need to have
JVM installed but don't worry - all you need to ever write and worry about
is ruby, not Java.

## Preview Release?

shoes4 is not quite done yet - this is the first release after almost 2 years
 of work - it's not quite ready for production use yet and is missing some
 features.

### What's in?

* All shoes elements and DSL methods except for video are implemented
* almost 600 resolved issues
* over 2000 commits
* contributions from a lot of amazing people
* many vintage shoes samples [are running](https://github
.com/shoes/shoes4/blob/master/samples/README)
* ability to install as a gem!

### What's missing?

* support for the video element, which has also been dropped for now even for
 a full release ([see this issue](https://github.com/shoes/shoes4/issues/113))
* proper handling of quite some styles/methods for the elements
* installers (right now it's just a gem)
* packaging functionality - that's one of the big things missing a proof of
concept for jar/mac apps exists though

## How do I get this?

At first you have to install [JRuby](http://jruby.org/) - preferably a
version of the 1.7 series (most current release is 1.7.12). If you use rvm
you can do it like this: `rvm install jruby`

Then while JRuby is selected as your main ruby do:

    gem instal shoes --pre

et voila!

If you want to install straight from the github resources there are
instructions at our [github repository](https://github.com/shoes/shoes4/).

If you run into issues we'd appreciate it immensely if you reported them in
[our issue tracker](https://github.com/shoes/shoes4/issues). Thank you <3

Also of course contributions, pull requests and feedback are extremely welcome!

## Thanks

Last but not least heaps of thanks to everyone who ever contributed to shoes
(shoes4 already has nearly 40 contributors! Wooohoooo!!!), reported an issue,
gave us feedback or just used shoes and had a lot of fun with it.

Special thanks goes to the JRuby organization which always supported us
straight from the start with advice, quick fixes and giving us a total of 3
of their Google Summer of Code slots so we could have students working on
shoes for 3 months. This release wouldn't have happened yet without their help.

 Also thanks to you for reading this far and hopefully trying to install
 shoes and running it.