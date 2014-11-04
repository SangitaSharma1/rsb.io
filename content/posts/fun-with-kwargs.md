---
title: Fun With **kwargs
date: "2012-03-21"
tags: ["tips"]
slug: fun-with-kwargs
---

Ever want to write functions that flexibly receive arguments? What about
getting defaults from a configuration on the module level, then have those
defaults automatically used by functions in your module?

Well kwargs might be just what you need. "kwarg" is a nickname for "keyword
arguments", which you're likely already familiar with in a format like this:

	:::python
	def func(first='ask questions', second='shoot'):
		print '{0} first'.format(first)
		print '{0} second'.format(second)

	if __name__ == '__main__':
		func()

Let's try it out!

	:::console
	$ python test.py
	ask questions first
	shoot second

Now that's all well and good, of course, but what if you you need to set those
defaults on the fly, say, from a config file that your program reads on
startup. Let's say your config file looks like this.

	:::python
	[Defaults]
	first = shoot
	second = ask_questions

And this is the code that will read the config.

	::python
	from ConfigParser import ConfigParser
	conf = ConfigParser()
	conf.read('test.cfg')
	conf_dict = dict(conf.items('Defaults'))


	def func(**kwargs):
		# the name selected for kwargs is not important, what's special is the **
		# any arguments we need that weren't in kwargs, get them from conf_dict
		kwargs.update(conf_dict)
		print '{0} first'.format(kwargs['first'])
		print '{0} second'.format(kwargs['second'])

	if __name__ == '__main__':
		func()
		print 'maybe something more conservative...'
		func(second='more questions', first='ask questions')

The program now gives different output.

	:::console
	$ python with_kwargs.py
	shoot first
	ask questions second
	maybe something more conservative...
	ask questions first
	more questions second

An alternative to having default arguments from a config file would be
something like this. The values remain hardcoded, unfortunately, but it allows
you to have defaults for kwargs.

	:::python
	def func(**kwargs):
		# the .get() function takes a second argument, which is returned by default
		# if there is no value for that key
		print '{0} first'.format(kwargs.get('first', 'shoot'))
		print '{0} second'.format(kwargs.get('second', 'ask questions'))

So now we have a program that does a similar thing to our original, but none of
the defaults are hardcoded (except the config file, but let's ignore that).

The uses of **kwargs go beyond this, of course, they're great for making
extremely flexible functions that are tolerant to non-consistent use.
