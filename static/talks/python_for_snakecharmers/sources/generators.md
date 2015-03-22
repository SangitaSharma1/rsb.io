# Generators

# A very special iterable

Only creates results when they are asked for

All thanks to the "yield" keyword

Preseve their state and will calculate the next result when the .next() method is called

Use "yield" where you might normally use "return"

---

# Generator Examples

# Primes
	!python
	def fib_gen();
		a = 1
		b = 1
		while True;
			yield a
			(a, b) = (b, a + b)

# Usage

	!python
	>>> fibs = fib_gen()
	>>> for i in range(10): print fibs.next()
	1
	1
	2
	3
	5
	8
	13
	21
	34
	55

---

# Generator Examples Continued

# Walk a Directory

	!python
	def filename_generator(dirname):
		subdirlist = [dirname]
		while subdirlist:
			dirname = subdirlist.pop()
			for item in os.listdir(dirname):
				if os.path.isfile(os.path.join(dirname, item)):
					yield os.path.join(dirname, item)
				else:
					subdirlist.append(os.path.join(dirname, item))

# Usage

	!python
	>>> files = filename_generator('/home')
	>>> print files.next()
	"afile.txt"
	>>> while True: files.next() # Eventually generators can be exhausted
	StopIteration

---

# Controlling Generators

	!python
	def counter (maximum):
		i = 0
		while i < maximum:
			val = (yield i)
			# If value provided, change counter
			if val is not None: i = val
			else: i += 1

You can tell a generator to continue as if the "val" in gen.send(val) was its last yield

	!python
	>>> it = counter(10)
	>>> print it.next(), " | ", it.next()
	0 | 1
	>>> print it.send(8)
	8
	>>> it.next()
	9
	>>> print it.next()
	Traceback (most recent call last):
	File "t.py", line 15
		print it.next()
	StopIteration
