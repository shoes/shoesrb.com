---
title: "Bundler integration"
slug: "bundler-integration"
date: 2012-03-16 04:52
---

Shoes is an older Ruby project, and it pre-dates a lot of modern Ruby tools. To
use gems with Shoes, you use a `Shoes.setup` block:

    Shoes.setup do
      gem "twitter"
    end

This reminded me of a Gemfile, so why not add Bundler support? So I did! Create
a `Gemfile`:

    source "https://test.rubygems.org"

    gem "twitter"

And in your application use this setup block:

    Shoes.setup do
      bundler
    end

That's it! You're ready to go. You can specify bundler version with:

    bundler :version => '~> 1.1.1'

Or the `Gemfile` name:

    bundler :file => "Gemfile#{ENV['APP_MODE']}"

This feature is available as of [commit 911445](https://github.com/shoes/shoes/commit/9114457d487353a0c16e521284ad164835c64b4e).

It does not include a GUI - but with the new bundler 1.1 it's fast enough.

