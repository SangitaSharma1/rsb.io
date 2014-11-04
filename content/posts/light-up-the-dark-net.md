---
title: Light Up The Dark Net
date: "2013-04-13"
tags: ["privacy"]
slug: light-up-the-dark-net
---

Last night I lit up my connection to [Hyperboria][1] which has been neat. Other
than connecting, I haven't done very much, but setting up [cjdns][2] was
exceptionally straightforward. The hardest part of it was finding other users
to peer with.

It seems to be a lot like what I imagine the early internet was like. There are
a few peers and no real central authority. Names are assigned organically, and
most seem to be on the network for experimentation. There are peers providing
classic services like IRC and project mirrors as well as more modern services
like a URL shortener and a reddit clone (Uppit).

Having a network atop the internet is an interesting concept, though definitely
not new. I like the peer-to-peer aspect of it, and the trust-based peering
ideals behind Hyperboria seem like a good idea. You're only supposed to peer
with others you consider trustworthy, to avoid having a single central
authority. There are some central services, like HypeDNS, that are unavoidably
central for now.

Bandwidth is, of course, less than the best, but I've been able to pull as much
as 60 K/s, averaging more like 50 K/s. It's fine for things like hosting a git
server, or loading the node info page, but it isn't cut out for media
operations.

Meshnet projects like Hyperboria have a lot of potential, and I look forward to
seeing a lot more of them in the future. It's going to become especially
important if anonymity becomes a concern to more people and they look to
projects like cjdns and [Tor][3].


[1]: http://hyperboria.net/
[2]: https://github.com/cjdelisle/cjdns
[3]: https://www.torproject.org/
