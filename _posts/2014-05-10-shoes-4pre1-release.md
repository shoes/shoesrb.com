---
title: "shoes 4 preview released!"
slug: "shoes-4-preview-released"
date: 2014-05-10 16:20
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">shoes 4 preview released!</a></h1>
<em>2014/05/10</em>

Hello shoesers out there! Long time no see! Wondering what we have been up to?

Well we've been hard at work on [shoes 4](https://github
.com/shoes/shoes4)! Today is a happy day because we can announce the
first preview release—just in time for the second birthday of the project
(24th of May 2012)!

## shoes 4?

shoes 4 is a complete rewrite of the shoes DSL. shoes 3 is great but it has its
 problems... e.g. a lot of C-code which made it hard to maintain, inaccessible
 for new contributors, and difficult to install.

shoes 4 is a united effort of the community to make shoes easy and fun again.
 The primary purpose is to re-implement the functionality shoes3 offered,
 improving features and squashing bugs along the way while making it easily
 runnable on every operating system again. The new codebase is modular and
 extensible, so it can support multiple rendering backends
 ([Qt](http://qt-project.org/), [GTK](http://www.gtk.org/), etc). Also
 it's an all ruby rewrite. There's no C or Java code, just ruby. Easy to
 maintain. Easy to contribute!

shoes 4 uses [jruby](http://jruby.org/) to leverage the cross platform power of
[swt](http://www.eclipse.org/swt/) for building GUIs. That means you do need to have a
JVM installed, but don't worry—all your code is ruby.

## Preview Release?

shoes 4 is not quite done yet—this is the first release after almost 2 years
 of work. It's not quite ready for production use and is missing some
 features. However there is already a lot in there! A lot of vintage shoes
  programs run just fine and it's definitely possible to enjoy the power of
  shoes again!

### What's in?

* All shoes elements and DSL methods except for video are implemented
* almost [600 resolved issues](https://github.com/shoes/shoes4/issues?state=closed)
* more than 2000 commits
* many vintage shoes samples [are running](https://github
.com/shoes/shoes4/blob/master/samples/README)
* install shoes as a gem!
* use other gems in your shoes project
* contributions from a lot of amazing people

### What's missing?

* proper handling of some styles/methods for the elements
* installers (right now it's "just" a gem)
* packaging functionality—that's one of the big things missing. A proof of
concept for jar/mac apps exists though
* support for the video element, which was also broken in shoes 3, ([discussed here](https://github.com/shoes/shoes4/issues/113))
* correct disposal of all operating system resources—some apps run into
out of handles errors
* check [our issue tracker](https://github.com/shoes/shoes4/issues) for full
blown list of known issues/feature requests

## How do I get shoes 4 and run it?

Alright, alright—enough talking!

At first you have to install [JRuby](http://jruby.org/)—preferably a
version of the 1.7 series (most current release is 1.7.12). If you use rvm
you can do it like this: `rvm install jruby`

Then while JRuby is selected as your main ruby do:

    gem install shoes --pre

et voila!

After installing the gem successfully you should have a `shoes` command
available to you on the console for running shoes programs. E.g.

    shoes path/to/my/program/my_app.rb

If you want to install shoes 4 straight from the github there are
instructions at our [github repository README](https://github
.com/shoes/shoes4#installing-shoes4-from-github).

If you run into issues we'd appreciate it immensely if you reported them in [our issue tracker](https://github.com/shoes/shoes4/issues). Thank you ♥

Also of course contributions, pull requests and feedback are extremely welcome!

## What does shoes 4 look like?

Take this little sample program for instance:


<pre><code>Shoes. app title: 'Hello Shoes' do
  background gradient limegreen..blue
  stack do
    para 'This is just a very basic app'
    button 'Click me' do alert 'Hello there!' end
    image 'http://shoesrb.com/img/shoes-icon.png'
  end
end</code></pre>

It creates this application (after clicking the button):

![sample app](/img/sample_app.png)

Here are screen shots from some applications running just fine on shoes 4:

![sample tank](/img/sample_tank.png)

Vintage tank game.

![sample manual](/img/sample_manual.png)

The good old shoes manual!

You can check out more samples in the [samples directory](https://github.com/shoes/shoes4/blob/master/samples/).
Not all of them are working yet though, so also make sure to check the [README](https://github.com/shoes/shoes4/blob/master/samples/README)
for information about which samples work.

## The road to a 4.0 release

This pre release is the first step on our way to an official 4.0.0
release.

There will be subsequent pre-releases as we fix outstanding issues. You can have a look at our
[milestone](https://github.com/shoes/shoes4/issues/milestones) to see the overall progress.

The next big milestone is our release candidate. We already have more than 70 issues lined up
 for that release. Please report more though—we want to ship bug free and fun software!

## Thanks

Last but not least heaps of thanks to everyone who ever contributed to shoes
(shoes 4 already has nearly 40 contributors! Wooohoooo!!!), reported an issue,
gave us feedback or just used shoes and had a lot of fun with it.

Special thanks goes to the JRuby organization which always supported us
straight from the start with advice, quick fixes and giving us a total of 3
of their Google Summer of Code slots so we could have students working on
shoes for 3 months. This release wouldn't have happened yet without their help.

 Also thanks to you for reading. Please try installing and running shoes on your
 machine. Let's have fun with shoes!

 Shoes on!

 Team Shoes
