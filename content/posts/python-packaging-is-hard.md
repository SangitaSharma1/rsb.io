---
title: Python Packaging is Hard
date: "2013-03-16"
tags: ["packaging"]
slug: python-packaging-is-hard
---

Conveniently after last week's post on [pythong] [1] I attended [PyCon] [2] and
was privileged to attend both the Python Packaging Mini-Summit and the Python
Packaging Panel.  This taught me a lot about the past and future of packaging
in Python.

What I took away from the whole experience was "packaging is hard, lots of
people want things, holy crap." There's the scientific community that needs to
compile things like [blas] [3] which is written in fortran.  There are
sysadmins that hate having to compile [lxml] [4] on every machine they deploy
on, web developers that need things to work on their Macs, and developers that
want to deploy from version control seamlessly.

There will (theoretically during the sprints) be a series of documents created
on the [PSF Bitbucket] [5] account.  This is not going to be a [user guide] [6]
but will be for developers that want to see how packaging is shaping up and
possibly advocate for their needs if they aren't already being taken into
account.

The way packaging seems to be moving is toward metadata version 2.0 which is
laid out in the proposed [PEP 426.] [7] It outlines the new way to describe
package data. For reference, the old metadata
formats are specified in [PEP 241] [8], [PEP 314] [9], and [PEP 345] [10]. One
of the things I like most about the new format is the addition of the
"Private-Version: " field, so you can have a secondary version that might be
the commit hash, a date of release, or whatever else makes sense for your
project.

The metadata format just specifies a new way to describe packages, which isn't
totally groundbreaking but is a nice piece to the puzzle. The next piece is the
[wheel] [11] format, which is a binary format for distribution. This solves the
problem of the sysadmin that never wants to compile lxml again. It's a
replacement for the woefully complex sdist format that exists currently. The
full spec is in [PEP 427] [12] but to summarize quickly, wheel is a ZIP archive
with a specific filename format ending in ".whl". Of course it is a cheese joke
(cheese comes in wheels, get it?) but it actually does a good job of covering
the use cases I can see for it. It lets your installer remain blissfully
unaware of the build process by requiring that the packager do any of the
required compilation.

The wheel format is a simpler interface than sdist, which requires running
arbitrary code on your machine. Wheel can even be unzipped straight into
site-packages and work without any external installation tools. The mixing of
build-and-install is slow, as anyone who's compiled a lxml for a new virtualenv
when lxml is already installed on the machine. It's a waste of time that wheel
is able to solve while also making it easier to create new installation
systems.

There is also a reunification of distribute and setuptools in the works. There
is work going on to merge the distribute changes back into the setuptools
mainline including (long overdue) Python 3 support among other things.

What 9 out of 9 packagers DO agree on is that ./setup.py install must die. So
much so, in fact, that it was the only slide shown during the packaging panel.

The verdict for right now seems to be "keep using distribute until we build the
new stuff." So until then pythong will continue creating distribute-based
projects. Upcoming is a huge post on packaging once I wrap my head around the
PEPs and can read the relevant threads on the mailing lists (catalog-sig and
distutils-sig).


[1]: http://github.com/oddshocks/pythong
[2]: http://us.pycon.org
[3]: http://www.netlib.org/blas/
[4]: http://lxml.de/
[5]: https://bitbucket.org/PSF/python-meta-packaging/issue/1/set-up-sphinx-readthedocs
[6]: http://guide.python-distribute.org/
[7]: http://www.python.org/dev/peps/pep-0426/
[8]: http://www.python.org/dev/peps/pep-0241/
[9]: http://www.python.org/dev/peps/pep-0314/
[10]: http://www.python.org/dev/peps/pep-0345/
[11]: http://www.python.org/dev/peps/pep-0427/
[12]: http://www.python.org/dev/peps/pep-0427/
