---
comments: true
date: 2013-08-08 02:54:00
layout: post
slug: instragram
title: Instagram photo gallery
summary: My 60 latest Instagram photos thanks to Instagram's API and instafeed.js
image: 'inst-photos.png'
alias: /photos/
tags:
- Instagram
- photos
---

Thanks to [instafeed.js](http://instafeedjs.com/) here are my 60 latest [Instagram photos](http://instagram.com/briansigafoos).

<script type="text/javascript">
  var feed = new Instafeed({
    get: 'user',
    clientId: '905a6b89e06242a5a1d6ecfd58a38d24',
    userId: 647166,
    limit: 40,
    resolution: 'standard_resolution',
    accessToken: '647166.467ede5.8835588003db42609ab430461bd84e07'
  });
  feed.run();
</script>

<div id="instafeed" class="large"></div>