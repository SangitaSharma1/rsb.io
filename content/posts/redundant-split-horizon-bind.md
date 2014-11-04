---
title: Redundant Split-Horizon BIND
date: "2013-05-01"
slug: redundant-split-horizon-bind
---

There are certain topics in BIND9 that are well documented, like running a
slave DNS server, or delegating a subzone. One of the least documented setups
I've seen also happens to be one I had to implement.

I found myself in need of redundant split-horizon name servers behind a static
NAT. I went through several iterations building this topology, and I learned
something new at every step.

The topology would have three zones:
- myco.com
- internal reverse
- external reverse

The tricky bit was something I didn't know about some versions of Cisco IOS:
that it tries to "help" people who are running DNS servers inside a NAT. It
goes ahead and _rewrites_ DNS responses. This is nice if you're setting up a
simple topology with forward lookups only. When you begin doing reverse
lookups, the automatic rewriting can become a non-trivial problem. It is
inconsistent in _which_ query types it will rewrite.

For example, a request for a PTR record from a reverse zone such as `PTR
72.0.10.9` will get rewritten as `PTR 10.100.100.9` by the router. This causes
a problem when queries against your external address can resolve as
internal-only names, reverse records can leak outside via both the primary and
secondary name servers.

I posted the named.conf and associated zone files on [Github][1] for reference.
On their own they don't make for good reading, but I'll be referring to them
throughout this post.

The concept of split-horizon is well documented, and the `internal-view` and
`external-view` in [etc/named.conf][2] are relatively straightforward.
Generally, you'd only do this if you had a 1:1 NAT for some of your devices. In
my case, the mail server (among other machines) had to be available inside and
outside the NAT.


[1]: https://github.com/ryansb/double-split-named
[2]: https://github.com/ryansb/double-split-named/blob/master/etc/named.conf
