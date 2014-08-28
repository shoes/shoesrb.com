---
title: "Bundler integration"
slug: "bundler-integration"
date: 2012-03-16 04:52
layout: default
---

<div class='jumbotron'>
  <h1>The Shoes Blog</h1>
</div>

<div class='row'>
<h2><a href="{{ post.url }}">Bundler integration</a></h2>
<h3>2012-03-16 04:52</h3>
<p>
<p>Shoes is an older Ruby project, and it pre-dates a lot of modern Ruby tools. To
use gems with Shoes, you use a <code>Shoes.setup</code> block:</p>

<pre><code>Shoes.setup do
  gem &quot;twitter&quot;
end
</code></pre>

<p>This reminded me of a Gemfile, so why not add Bundler support? So I did! Create
a <code>Gemfile</code>:</p>

<pre><code>source &quot;https://test.rubygems.org&quot;

gem &quot;twitter&quot;
</code></pre>

<p>And in your application use this setup block:</p>

<pre><code>Shoes.setup do
  bundler
end
</code></pre>

<p>That&#39;s it! You&#39;re ready to go. You can specify bundler version with:</p>

<pre><code>bundler :version =&gt; &#39;~&gt; 1.1.1&#39;
</code></pre>

<p>Or the <code>Gemfile</code> name:</p>

<pre><code>bundler :file =&gt; &quot;Gemfile#{ENV[&#39;APP_MODE&#39;]}&quot;
</code></pre>

<p>This feature is available as of <a href="https://github.com/shoes/shoes/commit/9114457d487353a0c16e521284ad164835c64b4e">commit 911445</a>.</p>

<p>It does not include a GUI - but with the new bundler 1.1 it&#39;s fast enough.</p>
</p>
</div>
