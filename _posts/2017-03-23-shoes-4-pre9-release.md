---
title: "Shoes 4 preview 9 released!"
slug: "shoes-4-preview-9-released"
date: 2017-03-23 12:00
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">Shoes 4 preview 9 released!</a></h1>
<em>2017/01/27</em>

Howdy Shoes fans!

[A new pre-release version
(4.0.0.pre9)](https://rubygems.org/gems/shoes/versions/4.0.0.pre9) is up on
Rubygems! Go ahead and grab it with:

    gem install shoes --pre

This release like the last had two main themes: packaging and compatibility.

Thanks to some diligent work by community members, we'd heard about a number
of things that weren't quite the same in Shoes 4 as they were in Shoes 3. In
almost all of these cases this was just a miss on our part, so we've been
putting things back where they belong.

Packaging is the last major frontier before the full 4.0 release, so it also
got attention this time around. Along with some bug triage and fixing, we now
pull in gems appropriate from an app's Gemfile and give some better warnings
in packaged apps when things go wrong. Along those lines too, the beloved Shoes
console (Alt+/) is back in action, which is really useful for packaged apps
which might not write to STDOUT.

You might have also noticed that it hasn't been that long since the last
update. That's on purpose for sure. We're aiming now for something about at the
6 week cadence, and releasing what we have, rather than picking a bug list and
grinding till it's done. In light of that, the next release is aimed for April
23... right before RailsConf. Maybe will see you there!

Want to know more? Here's the changelog!

v4.0.0.pre9 (61 commits) (Mar 19, 2017)
---------------------------------------------

Improvements (5)
-----------------

* Shoes Console (Alt+/) properly gathers logged messages [67a9864]
* Include gems from Gemfile during packaging [c50c457]
* Warn directly when running jar on OS X without -XstartOnFirstThread [2d27bdf]
* Support start block method in app [736702e]
* Support readonly state on appropriate elements [bda1639]

Bug Fixes (6)
-------------

* Reset alpha to avoid transparency leaks on later elements [92935e3]
* Combo default sizes increased to look right on all platforms [4e3be1f]
* Get clipboard working again on OSX [86a584b]
* Keep combo selection through list changes [168c0cf]
* Ensure visibility methods chain properly [f69ab49]
* Allow setting click through styles [d694275]

Contributors (3)
----------------

Jason R. Clark, Tobias Pfeiffer, Ishaan Malhi
