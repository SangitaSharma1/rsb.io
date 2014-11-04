---
title: Ripkern Remote IPython Kernels
date: "2012-01-23"
tags: ["tips"]
slug: ripkern-remote-ipython-kernels
---

In lieue of using the standard Python shell, I have been using [IPython](http://ipython.org/) and it's been treating me very well. If you've never tried it, you can now [try it online](http://www.pythonanywhere.com/try-ipython/).

	:::console
	$ ipython
	In [1]: print "hello there"
	hello there

It adds some convienient features like tab completion, integration with your favorite editor, and "magic" functions that make your life easier.

One of the "magic" functions is "%time" for when you need to know how long an operation takes. The short of it is that IPython makes Python shells fun.

With the release of [version 0.12](http://ipython.org/ipython-doc/stable/whatsnew/version0.12.html) the "ipython kernel" became a fully functional feature. The kernel maintains a single IPython session (maintaining state, loaded modules, variables, etc) and allows clients to attach to it. The kernel was originally used by the QT console, but since then @ipython notebook@ has been introduced, which also depends on the kernel.

The kernel is (secretly) an [MQ broker](http://www.zeromq.org/) that can be connected to by many different consoles. For example, @ipython qtconsole --existing@ or a [Vim plugin](https://github.com/ivanov/vim-ipython.)

Starting a kernel used to require jumping through some hoops. To open one, you needed to run @python -c "from IPython.zmq.ipkernel import main; main()" &@.

Of course, this overcomplicates a process that is now simply @ipython kernel &@.

Now let's talk about running a kernel on a remote machine.

	:::console
	user@local$ ssh user@remote
	user@remote$ ipython kernel &

	[IPKernelApp] To connect another client to this kernel, use:
	[IPKernelApp] --existing kernel-5584.json

The kernel-xxxx.json file is located in the IPython config directory for the current profile. This is usually @~/.ipython/profile_default/@, and is in the @security@ subfolder. It's a simple JSON blob, containing the ports the MQ broker listens on along with a security key to prevent unauthorized clients from connecting.

	:::python
	{
	  "stdin_port": 59423,
	  "ip": "127.0.0.1",
	  "hb_port": 40757,
	  "key": "d1444d83-fba5-4acd-99a0-3f1ac90ab090",
	  "shell_port": 65320,
	  "iopub_port": 58995
	}

Now, since the MQ broker is only listening on loopback, connecting from an external computer isn't possible. Enter SSH tunneling.

For this particular case, you could just run:

	:::console
	user@local$ ssh user@remote -f -N -L 59423:127.0.0.1:59423 &
	user@local$ ssh user@remote -f -N -L 40757:127.0.0.1:40757 &
	user@local$ ssh user@remote -f -N -L 65320:127.0.0.1:65320 &
	user@local$ ssh user@remote -f -N -L 58995:127.0.0.1:58995 &

But that requires opening the correct kernel JSON on the remote machine, and then copying/typing pretty much the same command a bunch of times. I built a [script](https://github.com/ryansb/etc/blob/master/ripkern) that is this simple, assuming you've [set up SSH keys](http://www.ece.uci.edu/~chou/ssh-key.html):

	:::console
	user@local$ ripkern user@host
	IPython --existing kernel-5584.json

What just happened was ripkern went to the remote machine, grabbed the kernel info file that was created most recently, then set up the SSH tunnels and returned the connection string, so now it's as easy as @ipython qtconsole --existing kernel-5584.json@.

Next time, tune in for a post on connecting Vim to IPython kernels, for handy testing of Python code.
