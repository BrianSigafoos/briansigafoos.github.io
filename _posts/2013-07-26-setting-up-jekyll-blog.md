---
comments: true
date: 2013-07-26 03:21:00
layout: post
slug: building-a-blog-using-jekyll-and-github-pages
title: Setting up Jekyll with Bootstrap, Github pages and a custom domain
summary: Here's how I set up this blog with Jekyll, Bootstrap, GitHub pages. Tip - clone a working Jekyll site!
image: 'octojekyll.png'
tags:
- Jekyll
- Bootstrap
- GitHub
- setup
---

##### After heading down a few different paths, cloning a working site worked best. Now I'm ready to customize a good-looking, working setup.

All initial thanks are due to [Garry Welding](https://github.com/gkwelding) who has an great blog post about [setting up Jekyll on GitHub Pages with Bootstrap](http://in-the-attic.com/2013/01/04/building-a-blog-using-jekyll-bootstrap-and-github-pages-a-beginners-guide/)

Prior to finding Gary's solution I went down a number of promising paths. All of which probably would be great, except that it was **much** faster to copy someone else's working Jekyll Github blog.

#### What's worked for me
- cloning [Garry's](https://github.com/gkwelding) blog, removing all content and customizing the style some
- [alias generator for Jekyll](https://github.com/tsmango/jekyll_alias_generator) to have links like [photos](http://briansigafoos.com/photos) just work
- [tags generator](http://charliepark.org/tags-in-jekyll/) to tag blog posts
- tags weren't working quite right without `tagbuild.sh` thanks to [copyninja](https://github.com/copyninja/copyninja.github.com/blob/master/tagbuild.sh)
- I modified the [tagbuild.sh](https://github.com/BrianSigafoos/briansigafoos.github.io/blob/master/tagbuild.sh) script to do a little more
- [instafeed.js](http://instafeedjs.com/) was perfect to add a [photos](http://briansigafoos.com/photos) page and sidebar with recent Instagram photos


##### What didn't work for me, but could be a good resource for someone starting out

- [Jekyll Bootstrap](http://jekyllbootstrap.com/)
- [Yes We Jekyll](http://yeswejekyll.com/)
- [Foundation](http://foundation.zurb.com/) instead of [Bootstrap](http://twitter.github.io/bootstrap/)
- [Octopress](http://octopress.org/)