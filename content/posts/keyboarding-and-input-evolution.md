---
title: "Keyboards and the State of Typing"
date: "2016-02-20"
tags: ["tools", "keyboards", "hardware"]
slug: keyboards-and-the-state-of-input
---

Back in college, I read a great post on loper-os, [Englebart's Violin][violin]
which I'm unlikely to do justice to here, but is definitely recommended
reading. It focuses on the tools that humans use for potentially billions of
hours each day: the keyboard and the mouse.

If you were to show the keyboard attached to your computer to a typist in the
1950's, the most innovative piece according to them would be the
apparently-magical [light-emitting diode][led] on the caps lock key (invented 1962).
Everything else is the same: the key-per-character usage, the labels, the
layout, even the plastics haven't moved ahead all that much.

I'll skip the whole "bemoaning the fall of computing to the unworthy"
lecture, not just because it reeks of elitism to say that computing
professionals are the ones who deserve better keyboards. Plenty of
professionals do their job almost exclusively with a keyboard; programmers,
writers, paralegals, even nurses spend huge parts of their day typing. To do
so with a tool so bound to computing's prehistory in typewriting, when there
was no such thing as "smart" devices.

Shortly after reading it, I tried my hand at building a chorded keyboard called
[microchord][mc] and built a layout to test on mock buttons. After a few hours
of practice I realized how much slower a chording system would be, even after
practice. Since each keypress requires multiple fingers to work in concert,
it's hard to get as fast as a single-finger button press.

After college, my first foray into "odd keyboards" was the [Kinesis
Advantage][kinesis]. It beat the standard typewriter staggering, but the
"crater" design didn't work for me.

<img class="pure-img" alt="Kinesis Advantage" src="/img/kinesis_advantage.jpg">

The Ergodox was the first real custom keyboard I built, and it wins hands down
(hehe...) for workstation use, but it takes up a ton of desk space and isn't
very portable. Each half takes up about the same amount of space in a bag as a
whole tenkeyless board, which makes it a no-go for travel.

<img class="pure-img" alt="ergodox from massdrop" src="/img/ergodox.jpg">

The big win on the Ergodox is the community and the open-source firmware
options. I chose [tmk_keyboard][tmk] and immediately started adding macros for
common hotkeys, like Gnome3's ctrl-alt-arrow for workspace switching, and the
leader keys for tmux and screen.

I think the input methods I use are going to keep evolving, and having
firmware-level access means I can take my layout and macros with me across
operating systems without extra setup. Most recently, I built a new
[atreus][atr] that I'm just starting to customize. So far, it looks like it
will fill the role of non-desk typing since it fits nicely on top of the
keyboard of my X201.

[atr]: {{< ref "posts/atreus-sunrise-edition.md" >}}
[kinesis]: http://www.kinesis-ergo.com/shop/advantage-for-pc-mac/
[violin]: http://www.loper-os.org/?p=861
[led]: https://en.wikipedia.org/wiki/Light-emitting_diode#Discoveries_and_early_devices
[mc]: {{< ref "posts/microchord-chorded-keyboard.md" >}}
[tmk]: https://github.com/tmk/tmk_keyboard
