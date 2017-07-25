---
comments: true
date: 2013-07-26 03:21:00
layout: post
slug: building-a-blog-using-jekyll-and-github-pages
title: Setting up Jekyll with Bootstrap, Github pages and a custom domain
summary: Here's how I set up this blog with Jekyll, Bootstrap, GitHub pages. Tip - clone a working Jekyll site!
image: 'octojekyll.png'
---

---

### UPDATE July 2017

I simplified everything. Replaced Bootstrap with [Basscss](http://basscss.com/) and removed everything I wasn't really using: tags, search, and all Javascript.  

---

### After heading down a few different paths, cloning a working site worked best. Now I'm ready to customize a good-looking, working setup.

All initial thanks are due to [Garry Welding](https://github.com/gkwelding) who has an great blog post about [setting up Jekyll on GitHub Pages with Bootstrap](http://in-the-attic.com/2013/01/04/building-a-blog-using-jekyll-bootstrap-and-github-pages-a-beginners-guide/)

Prior to finding Gary's solution I went down a number of promising paths. All of which probably would be great, except that it was **much** faster to copy someone else's working Jekyll Github blog.

### What's worked for me
- cloning [Garry's](https://github.com/gkwelding) blog, removing all content and customizing the style some
- [alias generator for Jekyll][] to have links like [photos][] just work
- [tags generator][] to add tags to blog posts
- [tagbuild.sh by copyninja][] to copy tags so Github shows them correctly, which I also [modified][] to have it do even more
- [instafeed.js][] to add a [photos][] page and sidebar with recent Instagram photos

[alias generator for Jekyll]: https://github.com/tsmango/jekyll_alias_generator
[tags generator]: http://charliepark.org/tags-in-jekyll/
[tagbuild.sh by copyninja]: https://github.com/copyninja/copyninja.github.com/blob/master/tagbuild.sh
[modified]: https://github.com/BrianSigafoos/briansigafoos.github.io/blob/master/tagbuild.sh
[photos]: http://briansigafoos.com/photos
[instafeed.js]: http://instafeedjs.com/

#### What didn't work for me, but could be a good resource for someone starting out

- [Jekyll Bootstrap](http://jekyllbootstrap.com/)
- [Yes We Jekyll](http://yeswejekyll.com/)
- [Foundation](http://foundation.zurb.com/) instead of [Bootstrap](http://twitter.github.io/bootstrap/)
- [Octopress](http://octopress.org/)