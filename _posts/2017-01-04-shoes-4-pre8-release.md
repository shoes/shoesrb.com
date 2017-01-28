---
title: "Shoes 4 preview 8 released!"
slug: "shoes-4-preview-8-released"
date: 2017-01-28 12:00
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>
<h1><a href="{{ post.url }}">Shoes 4 preview 8 released!</a></h1>
<em>2017/01/27</em>

Howdy Shoes fans!

[A new pre-release version
(4.0.0.pre8)](https://rubygems.org/gems/shoes/versions/4.0.0.pre8) is up on
Rubygems! Install with this simple command:

    gem install shoes --pre

This release had two big focuses--getting packaging back into a working state,
and Shoes 3 compatibility for art elements.

On packaging, movement to JRuby 9000 along with the passage of time had left
the system no longer quite working. With a few bug fixes (and some help from
the `swt` gem and the JRuby team!) you should be able to package jars and OS X
apps again. The upcoming pre-release will look to burn down the other reported
bugs against packaging, now that we have something working to duplicate
against.

On Shoes 3 compatibility, Eli Sadoff (@snood1205) brought to our attention a
few cases where you couldn't pass the same parameters to art elements in Shoes
4 that you could in Shoes 3. Oops! This led to a long crusade to update all the
elements for maximum compatibility, instituted better testing for said-compat,
and unearthed some other differences which have since been addressed.

All in all, a satisfying, bug-fixing-ful release.

For the detail-oriented, here's the changelog!

v4.0.0.pre8 (99 commits) (Jan 28, 2017)
---------------------------------------------

Improvements (7)
-----------------

* Update to latest SWT version 4.6.1 [9b239e6]
* New download supporting all options from Shoes 3 [5f51959]
* Make art element parameters compatible with Shoes 3 [4f0d57f]
* Apply rotate consistently to all art elements [07cbfba]
* Better native app appearance on Mac OS X [7af177c][429c363]
* Warn on second Shoes.app invocation [fb8f44c]
* Allow chaining click and release methods [33c6695]

Bug Fixes (5)
-------------

* Make rotate direction compatible with Shoes 3 [2781622]
* Fix installation from source when missing git command [d12616a]
* Properly detect when running from packaged app [f08c5c1]
* Executable related changes to make packaging happy [d446963]

Contributors (2)
----------------

Jason R. Clark, Tobias Pfeiffer

Shoes on!
