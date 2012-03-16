---
title: "Bundler integration"
slug: "bundler-integration"
date: 2012-03-16 04:52
---

As the `Shoes.setup` block locked very familiar to a Gemfile I thought of adding support for bundler/Gemfiles

Create a `Gemfile`:

    source "https://test.rubygems.org"
    
    gem "twitter"

And in your application use this setup block:

    Shoes.setup do
      bundler
    end

Ready!

You can specify bundler version with:

    bundler :version => '~> 1.1.1'

Or the `Gemfile` name:

    bundler :file => "Gemfile#{ENV['APP_MODE']}"

Available form this commit https://github.com/shoes/shoes/commit/9114457d487353a0c16e521284ad164835c64b4e

Does not include GUI - but with new bundler it's fast enough.

