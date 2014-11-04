---
title: ZSH+Boto Tab Completion for AWS
date: "2012-02-26"
tags: ["code", "tips"]
slug: zsh-boto-tab-completion-for-aws
---

[zsh](http://zsh.sourceforge.net/) is an awesome shell. It has enhanced [tab
completion](http://www.jukie.net/bart/blog/zsh-tab-completion) features that go
way beyond what you probably expect from a shell. If you don't already use zsh
but would like to start, [this](http://zshwiki.org/home/start) is a great place
to jump in, it has everything you could ever want to know about zsh.

I use zsh as my main shell, especially for the revision control information in
my prompt, appreciatively copied from the [grml
zshrc](https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc), 2700
lines of more than you need in a shell.

I also use S3 and elbadmin on a more or less daily basis, and often find myself
having to run different versions of those commands a bunch of times to drill
down to the options I actually want. There's no built-in way to tab-complete
things like S3 buckets or Elastic Load Balancers, so I started work on one.

Currently, it supports elbadmin completely (except for tab-completing
listeners) and lss3 to the extent that it completes available buckets, but
not keys within those buckets. It's available on
[Github](https://github.com/ryansb/zsh-boto).

There are pre-reqs to get tab-completion working, but they're very minimal.
First, you need to have boto and zsh both installed.

	:::console
	$ which zsh
	/usr/bin/which: no zsh in (your $PATH)
	$ yum install zsh
	$ which zsh
	/bin/zsh
	$ pip install boto

Now you need to pull down my tab-completion scripts from Github and put them
somewhere zsh knows about. In this case, we're putting it in the .zsh directory
and telling zsh to look there for extra tab-completion scripts.

	:::console
	$ cd .zsh
	$ git clone git://github.com/ryansb/zsh-boto.git
	$ echo "fpath=($fpath /home/user/.zsh/zsh-boto)
	autoload -uz compinit
	compinit" >> ~/.zshrc
	source ~/.zshrc


Now that that's done, you can go straight to using it. Try these to start:

	:::console
	$ lss3 <TAB>
	$ elbadmin <TAB>
	$ elbadmin add <TAB>
	$ elbadmin add myloadbalancer <TAB>
	$ elbadmin add myloadbalancer i-12345

The process of writing it was pretty interesting, as I'd never seriously worked
with zsh scripting outside of some basic task automation.
