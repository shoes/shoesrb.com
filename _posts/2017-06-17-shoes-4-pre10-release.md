---
title: "Shoes 4 preview 10 released!"
slug: "shoes-4-preview-10-released"
date: 2017-06-17 12:00
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">Shoes 4 preview 10 released!</a></h1>
<em>2017/06/17</em>

Howdy Shoes fans!

[A new pre-release version
(4.0.0.pre10)](https://rubygems.org/gems/shoes/versions/4.0.0.pre10) is up on
Rubygems! Go ahead and grab it with:

    gem install shoes --pre

This release represents a small changelog but big changes. It's the first time
that Shoes 4 has provided options for packaging up "apps" for all three of the
platforms!

Along with this, the format for executing packaging commands has evolved. In
the new gem you run commands like this to package things up:

    shoes package --jar --mac --windows --linux path/to/app.rb

Packaging is really starting to shape up, with plenty of cross OS testing
catching all those little bugs hiding in the shadows. Give it a spin why don't
you?

Want to know more? Here's the changelog!

v4.0.0.pre10 (40 commits) (Jun 3, 2017)
--------------------------------------------

Improvements (4)
----------------

* Support packaging Linux app [d22b561]
* Support packaging Windows apps [d22b561]
* Move to subcommands instead of CLI flags [370cc1b]
* Faster sample running through `rake samples` [51c6762]

Bug Fixes (3)
-------------

* Fix image loading for packaged apps [dd77724]
* Include script dir in image search paths [1d124b3]
* Include script dir in $LOAD_PATH [d21125b]

Contributors (5)
----------------

Jason R. Clark, Tobias Pfeiffer, Michael Dimmitt, Olle Jonsson, William Hatcher

