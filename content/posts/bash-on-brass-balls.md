---
title: Bash on Brass Balls
date: "2013-04-07"
tags: ["code", "silliness"]
slug: bash-on-brass-balls
---

As a break from working on [Panstora][1] I wrote a silly app in a web framework
I found. It's called [Bash on Balls][2], and the application I wrote is
called [Brass Balls][3]. It's a stupid web app that lets you mess with the
computer that's running it. Effectively, you make GET requests against it, and
it runs arbitrary shell commands. It does all kinds of neat stuff.

It'll alias vim to emacs, try to fill up your hard drive, and even attempt to
"upgrade" your operating system to [Oracle Linux][4] if that can be said to be
an upgrade.

Unfortunately, Bash on Balls seems to be abandoned. Worse, it's completely
undocumented. I found how to accept GET requests by reading through the source
to figure out what happened after netcat (yeah, netcat) received the bytes.

I might try to write something more involved in the future using Bash on Balls,
if only as an exercise in silly things to do in shell. I kind of sense a
zsh-based web framework to go along with the [web server][5] that's already
been written. Of course, there's the minor issue of missing things in the
language like "data types" and "reasonable syntax," as if that's stopped people
before.

[1]: http://github.com/ryansb/panstora
[2]: http://github.com/jayferd/balls
[3]: http://github.com/ryansb/brassballs
[4]: http://linux.oracle.com/switch/centos/
[5]: http://www.chodorowski.com/projects/zws/
