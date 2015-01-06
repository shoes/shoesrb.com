---
title: "Shoes 4 preview 3 released!"
slug: "shoes-4-preview-3-released"
date: 2015-01-04 09:25
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">Shoes 4 preview 3 released!</a></h1>
<em>2015/01/04</em>

Howdy Shoes fans!

[A new pre-release version
(4.0.0.pre3)](https://rubygems.org/gems/shoes/versions/4.0.0.pre3) is up on
Rubygems! Install with this simple command:

    gem install shoes --pre

Last time around we split the `shoes` gem into a couple different pieces. Well,
that work has continued and we *think* we've got the structure finalized!
There were a few big motivations in doing this.

First off, the name `shoes-dsl` was a bit restrictive to the purpose of the
gem, so we renamed it `shoes-core`.  This gem represents all the primary shared
functionality of shoes--the DSL, the backend selection, anything a new backend
implementation would need to get running.

The Shoes manual has been extracted to `shoes-manual` for use in contexts (like
our website) which don't need all of Shoes. It has all the content and the
Shoes code for optionally running the manual. Along those lines the syntax
highlighter we've inherited from Hackety-Hack is in `shoes-highlighter` now to
ease the way for upgrading or replacing in the future.

A new `shoes-package` gem has been spun up to hold, you guessed it, packaging
logic. This lets us easily exclude unneeded packaging code and dependencies
from packaged apps, keeping them as trim as possible.

Last but certainly not least, the `shoes` gem has had a change in purpose--it
is now a "meta-gem" that has no code of its own. This gem simply represents
the default installation of Shoes and nothing else. Any code that would be
sharable belongs in `shoes-core` instead.

Huge thanks to everyone who helped out with this release. \o/ &lt;3


For the detail-oriented, here's the changelog!

4.0.0.pre3 (199 commits)
------------------------

New features (1)
----------------

* In pre2 we updated our gem layout and found a few things we didn't like.
  pre3 is now shaped how we expect to hold through 4.0!

  * shoes -- Now a meta-gem with the default installation as dependencies. It
    contains no code of its own (any shared code goes in shoes-core).
  * shoes-core -- The DSL and supporting code to share between Shoes backends
  * shoes-swt -- The first Shoes backend, based on SWT + JRuby
  * shoes-package -- Shoes packaging logic, separated to avoid pulling
    unneeded gems along in packaged apps
  * shoes-highlighter -- Extracted syntax highlighting from Hackety-Hack
  * shoes-manual -- Extracted content and display for Shoes manual

Breaking Changes (1)
--------------------

* Star interprets left/top as upper left corner, like all elements [d2fd202]

Improvements (7)
----------------

* Tetris sample game [1ac24ac]
* Implement shape(left, top) [2e8048c]
* Handle relative and missing image paths [9502dd7]
* Better input sizing on ask dialog [3df50d5]
* Capture slot context for timer, download and animation [5f1bdc1]
* TextBlocks have #parent not #parent_text  [52fab93]
* shoes.gemspec at top of project [369f7d3]

Bug Fixes (10)
-------------

* Links with empty text crash [a8fb745]
* Fix copying to/from system clipboard [e965e59]
* Position a slot's elements correctly when the slot has a margin [d72d7ef]
* Fix overlapping text with differing text heights [4db98b0]
* Use app click listener to only send click to one element [2a7fb92]
* Limit parent-dimensioned elements to their parent's bounds [6b9d760]
* Fix for background and border placement [4ddbbda]
* Fix crash when using click on star element [cdf9dc4]
* Do not count scroll bar into app width [7736b2d]
* Fix a typo in the adjusted minesweeper sample [93f5ed3]


Contributors (8)
----------------
Jason R. Clark, Tobias Pfeiffer, Eric Watson, Teemu, Kenneth Pullen, KC Erb,
Jake Gordon, Neil Northrop

Shoes on!
