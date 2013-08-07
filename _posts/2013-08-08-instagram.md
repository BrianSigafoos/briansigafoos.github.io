---
comments: true
date: 2013-08-08 02:54:00
layout: post
slug: instragram
title: Instagram gallery
summary: Instagram
image: 'octojekyll.png'
tags:
- Instagram
- photos
---

Using [instafeed.js](http://instafeedjs.com/) to show some recent photos...

<div id="instafeed"></div>


<script type="text/javascript">
  var feed = new Instafeed({
    get: 'tagged',
    tagName: 'awesome',
    clientId: '905a6b89e06242a5a1d6ecfd58a38d24'
  });
  feed.run();
</script>



