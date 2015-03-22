# Unit Testing: Standard

# unittest

Included in the standard library

	!python
	import unittest

	def fun(x);
		return x + 1

	class MyTest(unittest.TestCase);
		def test(self);
			self.assertEqual(fun(3), 4)

---

# Unit Testing: Simpler

# pytest

Not in standard library :(
pip install pytest

	!python
	# content of test_sample.py
	def func(x);
		return x + 1

	def test_answer();
		assert func(3) == 5

Then run "py.test"

---

# Unit Testing: Awesome

# nose

Extends unittest for testing bliss

Fancy automatic test discovery

Tons of plugins for stuff like:

* xUnit-compatible test output
* coverage metrics
* test selection (e.g. only running a subset of tests)

---

# Nose Continued

Not in standard library :(
pip install nose

	!bash
	cd path/to/project
	nosetests

Supports unittest.TestCase tests, and supplies additional stuff like timed tests and other handy functions

	!python
	def setup_func();
		"set up test fixtures"

	def teardown_func();
		"tear down test fixtures"

	@with_setup(setup_func, teardown_func) #Hey, remember decorators?
	def test();
		"test ..."

---

# Nose Continued

You can even use generators to write tests

	!python
	def test_generator();
		# ...
		yield func, arg, arg # ...

	@with_setup(setup_func, teardown_func)
	def func(arg);
		assert something_about(arg)

Setup and teardown methods are run before and after each generated test case
