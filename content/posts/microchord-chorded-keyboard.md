---
title: Microchord Chorded Keyboard
date: "2013-03-30"
tags: ["code", "practices"]
slug: microchord-chorded-keyboard
---

For some time I've had the idea that keyboards as we know them are terrible.
I've looked at other keyboard layouts like colemak, dvorak, programmers dvorak,
and so on. These are an improvement over qwerty according to some people, but
it's still the same keyboard that puts your hands in an exceptionally poor
ergonomic positions.

So then you start looking to alternatives like a [kinesis][1] that lets you
separate your hands, and save keystrokes by programming in your own macros.
This is great, but you still end up moving your fingers a lot, and have a risk
of adopting a pronating posture because the buttons still require lots of
finger movement and are laid out parallel to your work surface.

I'd tried to solve this by building out a vim environment to minimize my risks
of developing RSI, but the terrible ergonomics of modern laptops are hard to
mitigate. I already hedge against RSI by taking stretch breaks, but a better
solution seems to be to obsolete the traditional keyboard entirely.

I came across [this][2] article titled Engelbart's Violin. It introduced me to
the idea of the [chorded keyboard][3] as well as the idea that there's another
side to user interface design. That user interfaces should maximize
productivity, maximally rewarding learning on the part of the user. This is
what drew me to Vim, even though I didn't know why. I wanted to have headroom,
to let my knowledge limit my interactions, not design decisions informed by
novice expectations.

Novice driven design kills power users. Why should design decisions on the
machine I use for 8 to 14 hours a day be informed by the needs of users that
use it occasionally.

Take this and apply it to the keyboard. The keyboard is perfect for novices
because no matter what, hunt and peck will work. There is no headroom for touch
typists other than moving their fingers faster, and that tops out eventually.
It was also designed without real consideration for people who use the keyboard
full time. They need ergonomic design that doesn't destroy the hands with which
they work.

So I found the [Microwriter][4] and was immediately captivated. It was a
portable chorded keyboard with a builtin word processor. It's an unintentional,
physical expression of the UNIX design philosophy. It did one thing well, text
input, and provided an interface to take the data and send it off to a printer.
Not very impressive to people walking around with a full computer in their
pocket. But think about the last time you typed on a smartphone and the word
"elegant" popped into your mind. For me, that'd be never.

The Microwriter enjoyed a brief commercial lifetime but was never really
adopted. It has a successor that survives, the [CyKey][5] designed by the
creator of the Microwriter's chording system [Cy Endfield][6]. The problem with
the Microwriter is summed up in the title of the article, Engelbart's Violin.

> Engelbart, for better or for worse, was trying to make a violin. Most people
> don’t want to learn the violin.

That is, as far as I can tell, the cause of death for every chorded keyboard
that has hit the market.

Despite being an excellent piece of machinery, the CyKey requires a special
driver to allow it to process macros and to type special symbols. I want a
system that needs no extra software, plug and play.

I've begun designing a chorded keyboard of my own called the [microchord][7]
that is based on the [teensy 2.0][8] that acts just like a standard USB HID
(human input device) so it's portable between operating systems. I'm still in
the process of building the hardware, but I'm pretty happy with the chord map.

Mine isn't as mnemonically friendly as the original Microwriter. I'm targeting
ergonomics over mnemonics. I'm building this first for myself, but I'm making
it as easy as possible for other people to build their own by using open
hardware and publishing my code and my design.

[1]: https://www.kinesis-ergo.com/keyboards.htm
[2]: http://www.loper-os.org/?p=861
[3]: http://en.wikipedia.org/wiki/Chorded_keyboard
[4]: http://en.wikipedia.org/wiki/Microwriter
[5]: https://sites.google.com/site/cykeybellaire/cykey-home-page
[6]: http://en.wikipedia.org/wiki/Cy_Endfield
[7]: http://github.com/ryansb/microchord
[8]: https://www.pjrc.com/store/teensy.html
