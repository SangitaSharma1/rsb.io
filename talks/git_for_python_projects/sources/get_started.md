# getting set up
	!bash
	git config user.name "Your Name"
	git config user.email "you@your.site"

---

# start a project
	!bash
	$ pip install PasteScript
	$ paster mynewproject
	$ cd mynewproject
	$ git init

---

# first commit

	!bash
	$ git status
	$ git add <files>
	$ git commit

Protips:

	!bash
	# set commit message without opening an editor
	git commit -m 'commit message'
	# add only parts of what was changed
	git add -p
	git commit -a # stages all modifications
	# but make sure you REALLY want to commit everything

---

# see what changed #
* use 'git diff'
* by default diffs current working dir against most recent commit
* super useful, check out 'git diff --help'
