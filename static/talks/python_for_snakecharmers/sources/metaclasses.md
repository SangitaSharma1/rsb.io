# Metaclasses

## Classes writing classes

	!python
	>>> class MyObject(object):
	>>> 	pass
	>>> print MyObject
	<class '__main__.MyObject'>

Remember the type keyword? Well it's not just for discovering the type of an object

In Python, easy ways to do things (using the class keyword to make classes) can be done manually if you want to

	!python
	>>> Foo = type('Foo', (object,), {'myattr':'bar'})
	>>> print Foo
	<class '__main__.Foo'>
	>>> print Foo.myattr()
	bar

That has the same result as using the class keyword

Did you catch that we used a string to name the class?

How about that we created attributes using a dictionary?

---

# So What's a Metaclass Do?

	!python
	# A class is an instantiation of a metaclass (kind of)
	MyClass = MetaClass()
	# An object is an instantiation of a class
	MyObject = MyClass()

Surprise: type is actually a metaclass, which is why we were just able to make classes by calling it

Don't forget, everything is an object in Python, which means it was created from a class. Doesn't that mean primitive like int, as well as other types like str, dict, and friends are all classes?

# Yes.

So what class is type?

	!python
	>>> dict.__class__
	type
	>>> dict.__class__.__class__
	type
	>>> dict.__class__.__class__.__class__
	type

---

# How Do I Use a Metaclass?

The \__metaclass__ attribute

	!python
	class Foo(object):
		__metaclass__ = somemetaclass
		#python will now use somemetaclass to create Foo

What can you put in 'somemetaclass'?

Why, something that creates a class, of course

What creates a class?

type, or anything that subclasses it

## \__metaclass__ does NOT need to be a class

---

# Metaclasses in Action

	!python
	def upper_attr(future_class_name, future_class_parents, future_class_attr):
		"""
		Return a class object, with the list of its attribute turned
		into uppercase.
		"""

		# pick up any attribute that doesn't start with '__'
		attrs = ((name, value) for name, value in future_class_attr.items() if not
					name.startswith('__'))

		# turn them into uppercase
		uppercase_attr = dict((name.upper(), value) for name, value in attrs)

		# let `type` do the class creation
		return type(future_class_name, future_class_parents, uppercase_attr)


	class MyClass(object):
		__metaclass__ = upper_attr  # this will affect all classes in the module
		z = 'hello'

	y = MyClass()
	print y
	print y.Z
	# y.z will give an AttributeError, since y.z was turned into y.Z
	# by our metaclass

---

# But Why?

Metaclasses are deeper magic than 99% of users should ever worry about. If you wonder whether you need them, you don't (the people who actually need them know with certainty that they need them, and don't need an explanation about why). -- Tim Peters, Python Guru

ORM's like Django use metaclasses all the time

# But odds are you don't need them

## 99% of the time, you don't need class alteration

## 99% of the time you DO need class alteration, you can use decorators or monkey patching

# But for that 0.01% of the time, metaclasses are awesome
