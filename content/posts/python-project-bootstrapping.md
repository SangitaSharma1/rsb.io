---
title: Python Project Bootstrapping
date: "2013-03-12"
tags: ["code"]
slug: python-project-bootstrapping
---

This is the introduction post for [pythong] [1] a minimal, yet comfortable
project bootstrapping tool. It's intended to replace the now-unmaintained
"paster create". It will walk you through creating the project directory
structure and prompt you for the information you need to build a good setup.py
using the most recent packaging idioms.

![Ministry of Packaging](/img/lenin_packaging.png)

This means distutils, first of all, and we built prompts to help walk you
through the process of creating a distribute-based setup script.

The directory structure is simple and has as few opinions as it can. It looks
like this.

<pre>
$ tree libshiny
libshiny
├── bin
├── docs
├── libshiny
│   └── __init__.py
├── setup.py
├── distribute_setup.py
└── tests
    ├── __init__.py
    └── libshiny_tests.py
</pre>

There's a lot more work to be done on it, like giving people the option to use
a full editor instead of having to use the CLI for all input.

It works, and if you do use it and find issues, file an issue on
[Github] [2] and we'll do what we can.

[1]: http://github.com/oddshocks/pythong
[2]: http://github.com/oddshocks/pythong/issues
