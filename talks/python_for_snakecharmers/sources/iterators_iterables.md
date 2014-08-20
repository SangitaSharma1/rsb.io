# Iterators and Iterables

Tons of things are iterable!

	!python
	>>> for word in ["hello", "there", "snakecharmer"]:
	>>> 	#iterate over words in a list
	>>> 	print word
	hello
	there
	snakecharmer

Iterables must:

* Make it possible to traverse a list
* Guarantee (eventual) reachability of all values
* Allow the use the object.next() operator to reach the next value

---

# Itertools

	!python
	a = [1, 2, 3, 4]
	b = ['a', 'b', 'c', 'd']
	# roughly equivalent to a.extend(b), but does not store the result in a
	itertoolsmodule.chain(a, b) 
	# all combinations of length 3 of all items in a list.
	itertoolsmodule.combinations(a, 3)
	# return elements from a until b is exhausted, then repeat infinitely
	itertoolsmodule.cycle(b)
	# just like the builtin "filter" function
	# there's also ifilterfalse which is the inverse, obviously
	itertoolsmodule.ifilter(lambda x: x % 2 == 0)
	# returns (key, subset) grouped by the value of second_arg(first arg)
	itertoolsmodule.groupby(a, lambda x: x % 2 == 0)
	# returns three independent iterables of the contents of a
	itertools.tee(a, 3)
