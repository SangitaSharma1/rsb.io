# New-Style Classes

# New-style classes are intended to unify classes and types
(also enable metaclasses, but let's not go there, yet)

	!python
	class OldStyleClass():
		pass
	class NewStyleClass(object):
		# new-style classes all inherit from object, directly...
		pass
	class ChildNewStyleClass(NewStyleClass):
		# ...or indirectly
		pass

# Method resolution order
* multiple inheritance
* methods are resolved in order of inheritance declaration

		!python
		class A(object): pass
		class B(object): pass
		class C(A, B): pass

---

# New-Style Classes Continued

# the super() method
* less unnecessary verbosity
* pretty standard OOP concept

		!python
		# assume that A, B, and Call have a method "m"
		# and inherit like this: A -> B -> C
		class D(C):
			def m(self): self._dothings; A.m(), B.m(), C.m()
			#but what if the heirarchy changes?

		#if we used super
		class D(C):
			def m(self): self._dothings; super(C, self)

---

# New-Style Classes Continued

# the __new__ initialization step
* runs before __init__
* used by a lot of the builtin types like str and int
* needed if you want to override the constructor of an immutable type
* first argument must be a class
