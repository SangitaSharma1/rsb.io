---
title: On Coding Standards
date: "2013-04-04"
tags: ["practices"]
slug: on-coding-standards
---

Yesterday I discovered a project under MediaWiki written in Python. The project
is [EventLogging][1] that captures data about users as they interact with
MediaWiki sites. On viewing the code, I noticed a couple of inconsistencies and
out of curiousity asked where the MediaWiki code guidelines were for Python.
They didn't exist but for a single line in the [MW:Code Conventions][2] that
mentions the PEP8 whitespace guidelines.

The folks in #mediawiki-e3 recommended that I be [WP:BOLD][3] and write some
guidelines, so I did. The guidelines are PEP8, but in [the article][4] I pulled out
a few of the more important points and added pieces of PEP257 to make a more
clear docstring standard.

I did learn from the discussion about standards that quite literally everyone
has an opinion about how docstrings should be formatted, and was reminded that
we no longer code on VT100 terminals, making a line width of 79 less a
requirement and more of a "would be nice".

I was surprised an organization as large as MediaWiki wouldn't have code
guidelines for Python, especially since it has such comprehensive ones for
[PHP][5], [JavaScript][6], and even [CSS][7]. I'm especially glad the community
was so welcoming and let me contribute to something so core to the community.


[1]: https://www.mediawiki.org/wiki/EventLogging
[2]: https://www.mediawiki.org/wiki/Manual:Coding_conventions
[3]: http://en.wikipedia.org/wiki/Wikipedia:Be_bold
[4]: https://www.mediawiki.org/wiki/Manual:Coding_conventions/Python
[5]: https://www.mediawiki.org/wiki/Manual:Coding_conventions/PHP
[6]: https://www.mediawiki.org/wiki/Manual:Coding_conventions/JavaScript
[7]: https://www.mediawiki.org/wiki/Manual:Coding_conventions/CSS
