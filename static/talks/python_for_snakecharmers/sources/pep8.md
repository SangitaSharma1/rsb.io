# PEP: Python Enhancement Proposals

# [python.org/dev/peps](http://www.python.org/dev/peps/)

---

# PEP8

# A Style Guide for Python

	!python
		# yes -- lined up with opening delimiter
		foo = long_function_name(var_one, var_two,
								var_three, var_four)
		print var_one
		
		# no
		foo = long_function_name(var_one, var_two,
			var_three, var_four)
		print var_one

* Use 4 spaces per indentation level
* Never mix tabs and spaces

---

# PEP8 Continued

## Whitespace
* Separate classes and top-level functions with 2 blank lines
* Separate methods with single blank lines

## Imports
	!python
		# yes
		import os
		import sys
		from subprocess import Popen, PIPE
		
		# no
		import os, sys

---

# More PEP8

# Block Style

	!python
	# yes
	if foo == 'blah':
		one()
		two()
		three()

	# no
	if foo == 'blah': do_blah_thing()
	for x in lst: total += x

	# no...just...no
	if foo == 'blah': one(); two(); three = \
	four()
