---
title: "Shoes 4 preview 11 released!"
slug: "shoes-4-preview-11-released"
date: 2017-08-20 12:00
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">Shoes 4 preview 11 released!</a></h1>
<em>2017/08/20</em>

Happy day for Shoes... [A new pre-release version
(4.0.0.pre11)](https://rubygems.org/gems/shoes/versions/4.0.0.pre11) is up on
Rubygems! Go ahead and grab it with:

    gem install shoes --pre

Another release that's small on changes but big on impact. The new app
packaging from last release has been improved to create archives (.tar.gz for
Mac and Linux, .zip for Windows) instead of the collection of loose files. Not
only is this more convenient for distributing, but it also fixes some issues
we had with Windows packaging up apps for other OSs.

Next up we're looking at a pre-release focused on squashing bugs, then some
tidying before we're ready for the first Shoes 4 release candidate.

Want to know more? Here's the changelog!

v4.0.0.pre11 (30 commits) (Aug 20, 2017)
----------------------------------------------

Improvements (3)
----------------

* Copy and save button for console [6c6142d]
* Packaging outputs archives instead of loose files [0cf010f]
* Warn if no format passed to package commad [3914018]

Bug Fixes (3)
-------------

* Apps packaged on Windows for Mac/Linux can't execute [6c9008b2]
* Properly use Gemfile from shoes app directory, not just current dir [1d13828]
* Properly dispose of ArrowPainter [8ed4455]

Contributors (3)
----------------

Eric Stensland, Jason R. Clark, Tobias Pfeiffer
