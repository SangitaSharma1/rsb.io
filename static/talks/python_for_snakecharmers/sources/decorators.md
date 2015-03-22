# Decorators

## Decorators wrap a function to add functionality

Think like you are wrapping a function up in another function

Did I mention that functions act like classes? They can be decorated too!

Python comes with some default decorators

	!python
	@staticmethod
	@classmethod
	@property

## @staticmethod
* Has no access to the class it is a part of
* Used for dependency injection and not much else
* Unlike Java, in Python modules are the preferred method of code organization

---

# Default Decorators Continued

## @classmethod
* Is passed the class it is called on
* Can be called on the class itself, not just on an instance of it
* Handy for writing ORMs, for example

## @property
* Is a function that can be called like a normal attribute
* can have @<propertyname\>.setter and .getter if you like
* Or just getter, if the property shouldn't be changed by the user

# Now it's time to roll our own!

---

# Decorator Enforced Singletons

	!python
	def singleton(cls):
		"""
		A decorator to make a class into a singleton.

		When a class is wrapped in this decorator, this decorator will always make
		any calls on that class (or an instance of it) goes to the same instance of
		a given class.

		See PEP 318 for clarification.
		http://www.python.org/dev/peps/pep-0318/#examples
		"""
		instances = {}
		def getinstance():
			if cls not in instances:
				instances[cls] = cls()
			return instances[cls]
		return getinstance


	@singleton
	class SingletonDict(dict):
		pass

---

# Decorator for Memoizing Functions
	!python
	class memoized(object):
		"""Decorator that caches a function's return value each time it is called.
		If called later with the same arguments, the cached value is returned, and
		not re-evaluated.
		"""
		def __init__(self, func):
			self.func = func
			self.cache = {}
		def __call__(self, *args):
			try:
				return self.cache[args]
			except KeyError:
				value = self.func(*args)
				print "caching new value"
				self.cache[args] = value
				return value
			except TypeError:
				# uncachable -- for instance, passing a list as an argument.
				# Better to not cache than to blow up entirely.
				return self.func(*args)
		def __repr__(self):
			"""Return the function's docstring."""
			return self.func.__doc__
		def __get__(self, obj, objtype):
			"""Support instance methods."""
			return functools.partial(self.__call__, obj)

---

#Memoized Functions Continued
	!python
		@memoized
		def fibonacci(n):
			"Return the nth fibonacci number."
			if n in (0, 1):
				return n
			return fibonacci(n-1) + fibonacci(n-2)

		print fibonacci(12)
