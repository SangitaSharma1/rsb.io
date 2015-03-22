# File I/O &mdash; Simple

	!python
	>>> fh = file("myfile.txt")
		<open file 'seminars.txt', mode 'r' at 0x15938a0>
	>>> print fh.read()
		Sometimes it is best
		To forget sysadmins
		Who write all in Perl
	>>> fh.seek(0)
	>>> print fh.readline()
		Sometimes it is best
	>>> print fh.readline()
		To forget sysadmins
	>>> fh.close()

---

# File I/O &mdash; Advanced

	!python
	>>> fh = file("myfile", 'w')
	>>> fh.read()
		IOError: File not open for reading
	>>> fh.close()
	>>> import tempfile
	>>> temp = tempfile.TemporaryFile(mode='wb')
	>>> temp
		<open file '<fdopen>', mode 'wb' at 0x1593930>
	>>> temp.close()

tempfile.TemporaryFile is destroyed after being closed

Files can be opened in several modes (or combinations thereof)

* r &mdash; read
* w &mdash; write
* a &mdash; append
* b &mdash; binary
* \+ &mdash; simultaneous read and write


---

# Other Handy Stuff

# Only need a file for a little bit?

	!python
	from tempfile import TemporaryFile
	from subprocess import Popen
	out = TemporaryFile(mode="r+w")
	p = Popen('ls', stdout=out)
	# displays where you are in a file
	out.tell()
		"4L"
	# go to a specific point
	out.seek(0)
	print out.read()
		Documents
		Pictures
		Music
		Desktop

# Need to ensure a file opened?

	!python
	with file('myfile', 'r+w') as fh:
		data = fh.read()
		#do stuff
