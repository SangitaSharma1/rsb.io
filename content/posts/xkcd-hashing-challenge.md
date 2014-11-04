---
title: xkcd Hashing Challenge
date: "2013-04-03"
tags: ["code"]
slug: xkcd-hashing-challenge
---

On the 1st, the popular webcomic xkcd issued a hash-breaking challenge to
universities. I didn't find out about this until around noon yesterday (the
second) meaning I was very, very late to the game. Especially in comparison to
other competitors like CMU. When I began, RIT was below even the least of
competitors. Even the laughable "fuckgoogle.com" was defeating us.

Fortunately, several hackathons this year have been giving out free Amazon Web
Services credits. I decided to put mine to use for my alma mater. I spun up a
total of 16 cc2.8xlarge instances, for a total of 512 cores. In the 12 hours I
ran them, RIT was catapulted to 69th place with a hash distance of 386.

I don't know who calculated the 386 hash, but I did see one of my instances
compute a hash with a distance of 389, which nobody computing for RIT had done
at that time. RIT's final place at 69th put us above some venerable
competitors, including piratebay.se, bitcoin.org, and reddit.com.
Unfortunately, we were beaten by both bing.com and 4chan.com, and CMU left us
in the dust with a hash distance of 384. I'm curious how we would have done if
I'd made my efforts sooner, because my cluster was computing at 15 gigahashes/second.

Overall it was a fun challenge, and a great way to spend an afternoon.
