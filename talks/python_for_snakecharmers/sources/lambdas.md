# Lambdas

# They won't remember your name in the morning.

	!python
	>>> lambda x: x==4
	<function <lambda> at 0x7f944ed0e938>

Lambdas are great if you just need a quick one-statement function

Pass them to other functions for non-namespace-cluttering Pythonic justice

	!python
	>>> filter(lambda x: x%4==0, [2,4,6,8,10,12])
	[4, 8, 12]
	help(filter)
	filter(...)
		filter(function or None, sequence) -> list, tuple, or string

		Return those items of sequence for which function(item) is true.  If
		function is None, return the items that are true.  If sequence is a tuple
		or string, return the same type, else return a list.

Awesome.
