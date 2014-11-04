---
title: Let My Email Go
date: "2013-08-05"
tags: ["privacy"]
slug: let-my-email-go
---

For a while, I've been looking to switch away from Gmail to maintain more
control over my own data, especially something as critical as email. When
looking for somewhere to switch, I had a few requirements.

1. Ability to transfer existing email to the new system (more on this later)
2. High reliability
3. SSL/TLS for IMAP and SMTP (read "security")
4. Clear business relationsip. I had to be the customer, not the product.
5. Support for custom domains
6. Web interface (optional)

With all of these in mind, off I went on my search. Early on, [Fastmail][1]
seemed like a clear winner. They had a mighty shiny web interface, custom
domain support, and a good track record.

Out of nowhere, came [Lavabit][2] with something I hadn't even considered. Now,
their site may not have the whole "lickable" or "flat" or "hip-design-buzzword"
thing going on, but their product is top-notch. It has all of the above, but
brings [something extra][3] to the security showdown. Asymmetric encryption.
Effectively, they're unable to read my email without my password. With [all][4]
[the][5] [NSA][6] [stuff][7] going on I felt like this put Lavabit ahead of the
competition.

So now the part that took me the longest, and was the most nerve-wracking. The
Great Migration. How do I migrate all that old email? First iteration was
[offlineimap][8] which I already use for both backing up mail and for local
clients like mutt. It has support for syncing two IMAP servers.

Turned out that was not the best idea. There were duplicate messages all over
the place and I ended up completely cleaning out my Lavabit account and
starting over.

Then I discovered [imapsync][9], a utility for -- you guessed it -- syncing IMAP
servers so you can migrate your mail. It was incredibly easy, and after reading
the man page for a couple minutes I typed out this command and it worked almost
entirely on the first attempt.

	:::console
	$ imapsync \
		--host1 imap.gmail.com \
		--port1 993 \
		--ssl1 \
		--user1 user@gmail.com \
		--password2 mahsecret2 \
		--host2 imap.lavabit.com \
		--port2 993 \
		--ssl2 \
		--user2 user@lavabit.com \
		--password2 mahsecret2 \
		--sep2 . \
		--prefix2 ""

The only nonintuitive thing is the '--prefix2 ""' which I added after the first
run failed before copying any mail. The problem was that the Lavabit IMAP
server didn't support the [NAMESPACE][10] extension to IMAP4 so I needed to
specify a prefix myself.

Getting my custom domain configured on Lavabit was a breeze. It's not
self-service (yet) but Lavabit support was responsive and I had my domain set
up in just a couple hours. You can even set up [DKIM][11] and [SPF][12] records
which, if you've come this far, you might as well do.

My next step is likely going to be setting up CalDAV and CardDAV servers so I
can liberate my calendar and contacts as well. Haven't looked at many options
other than [Owncloud][13] for that, but that's a project for another weekend.

On my journey I also discovered a great free-as-in-freedom IMAP client for
Android called [K-9][14]. The name being a Dr. Who reference merely sealed the
deal. *Bonus Points*: It's on Github so I can contribute bugfixes if I find
problems.

[1]: https://www.fastmail.fm/
[2]: https://www.lavabit.com/
[3]: https://lavabit.com/secure.html
[4]: https://prism-break.org/
[5]: http://www.theguardian.com/world/2013/jun/06/us-tech-giants-nsa-data
[6]: http://www.forbes.com/pictures/mhl45eeelj/prism-slide-1-6/
[7]: https://en.wikipedia.org/wiki/PRISM_(surveillance_program)
[8]: http://offlineimap.org/
[9]: http://imapsync.lamiral.info/
[10]: http://www.apps.ietf.org/rfc/rfc2342.html
[11]: http://www.dkim.org/info/dkim-faq.html
[12]: https://en.wikipedia.org/wiki/Sender_Policy_Framework
[13]: https://owncloud.com/
[14]: https://github.com/k9mail/k-9
