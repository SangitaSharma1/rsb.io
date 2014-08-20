# Type Coercion

## Coercion vs. Casting

	!python
	2.0 + float(1) #cast
	1.0 + 2  #coerce

Python tries to do what you mean

Uses functions like object.__str__(), or object.__int__() depending on operator

	!python
	#str + int
	>>> "hello" + 8
	TypeError: cannot concatenate 'str' and 'int' objects
	#str + str
	>>> "hi" + " " + "there"
	'hi there'
	#str + int
	>>> "hi" * 2
	"hi"
	#float + int
	>>> 9.9 + 9
	18.9
	#tuple + tuple
	(9,10,11) + (12, )
	(9, 10, 11, 12)
