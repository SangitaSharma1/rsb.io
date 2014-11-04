---
title: Editing Remote Files With Vim
date: "2012-08-21"
tags: ["tips"]
slug: editing-remote-files-with-vim
---

As you already know, Vim is a fine tool for editing files locally. Now, you can
edit files on other machines. This is great for editing files on your
webserver, or any other machine you have shell access to but don't really want
to SSH into.

	:::console
	vim scp://www.ryansb.com/var/www/html/index.html

This opens up a buffer on my local machine with the file from the remote
machine, and I can save it and the new copy will be saved on the remote
machine. Netrw supports FTP (ftp://host/name/of/file), SCP
(scp://host/name/of/file), rsync (rsync://host/i/think/you/get/it/now), and
many other common (and uncommon) protocols.

You can also edit directories (scp://host/name/of/directory) and browse files
on the remote machine, if you just want to look around.

It's a handy tool, and can be even handier if you've set up SSH keys between
your machines.
