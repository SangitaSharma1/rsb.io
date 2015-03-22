# Builtins

Imported anytime you run Python, has tons of handy stuff

* errors ( ImportError, AttributeError, ZeroDivisionError )
* types we love ( dict, set, int, str )
* handy constants ( True, False, None )

Also some handy functions

	!python
	>>> __builtin__.globals()
	# returns a dict of all global variables
	>>> y = "whoami"
	>>> __builtin__.id(y) # id function returns an object's memory address
	14637984
	>>> __builtin__.coerce(9.4, 0x023) # coerces any two numbers to same notation
	# if coercion is not possible, raise TypeError
	(9.4, 35.0)
	>>> __builtin__.coerce(9.4, 'eleventy-one')
	TypeError: number coercion failed

---

#Builtins Continued

Other builtin stuff

* next
* filter
* map
* reduce
* pow
* ord
* hasattr
* cmp
