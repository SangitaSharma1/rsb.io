---
title: "Git as a Presentation Tool"
date: "2015-05-16"
tags: ["code", "tips"]
slug: git-as-powerpoint
---

This past week I gave a talk on [Flask][flask] at [Python Buffalo][pybuf] with
no slides. Not only did I skip slides; I made the whole presentation one big
live demo application. Yes, I said to myself, tempt gods that would mock the
hubris of the live demo.

Watching people type is *booooring*. Typos are about as interesting as a
text-wall Powerpoint slide -- which is to say not. To avoid exposing how poor
a typist I am, I built the demo ahead of time and made a commit for each step.
The repo looked something like this.

```
$ git log --oneline
4d4e1ac Add requirements.txt to document dependencies
b5d164d Add display of the existing lunches
77ecb81 Add model for lunch storage
8111913 Add endpoint to receive form submission
307b40f Add lunch form, but it fails! why?
9904143 Demonstrate template inheritance index.html < base.html
05446fd Add a conditional (if statement)
194ed86 Use a real template
9f31419 Serve real HTML!
6517faa use flask's magic jsonify
e06dcab Initial "lunch" app
9ec9cdf Add gitignore
74c5e86 initial commit
```

Now, I needed a way to hop to the next commit easily. I could have made
branches on each commit (eww, manual), or checked the next commit out by hash
every time (the point was *less* error-prone typing). Instead, I added a simple
alas to my `.zshrc` to advance to the next child commit.

```
alias gchild='git checkout $(git log --ancestry-path --format=%H ${commit}..master | tail -1)'
```

With that in place, I started Flask with `debug=True` to reload changes and
used vim to show changes and explain as each feature was added to the
application.

I'd absolutely recommend git as a presentation tool for any code-heavy
presentations; it lets you track your own changes, share your source material
with anyone, and avoids copying code into slides.

[flask]: http://flask.pocoo.org/
[pybuf]: http://www.meetup.com/Python-Buffalo/
