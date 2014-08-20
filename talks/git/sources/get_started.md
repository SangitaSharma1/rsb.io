# getting set up
	!bash
	git config user.name "Your Name"
	git config user.email "you@your.site"

---

# start a project
	!bash
	$ mkdir mynewproject
	$ cd mynewproject
	$ git init
	 Initialized empty Git repository in 
	 /home/ryansb/mynewproject/.git/
	$ vim README
	$ git status
	 # Initial commit
	 #
	 # Untracked files:
	 #   (use "git add <file>..." to include in what will
	 #   be committed)
	 #
	 #       README
	 nothing added to commit but untracked files present
	 (use "git add" to track)
	$ git add README

---

# status report

	!bash
	$ git status
	 # Initial commit
	 #
	 # Changes to be committed:
	 #   (use "git rm --cached <file>..." to unstage)
	 #
	 #       new file:   README
	$ vim README
	$ git status
	 # Initial commit
	 #
	 # Changes to be committed:
	 #   (use "git rm --cached <file>..." to unstage)
	 #
	 #       new file:   README
	 #
	 # Changes not staged for commit:
	 #   (use "git add <file>..." to update what will
	 #   be committed)
	 #   (use "git checkout -- <file>..." to discard
	 #   changes in working directory)
	 #
	 #       modified:   README

---

# making commitments
	!bash
	$ git commit -m "Added README"
	[master (root-commit) 4f3ea33] Added README
	 1 files changed, 1 insertions(+), 0 deletions(-)
	 create mode 100644 README
	 <Do more commits>
	$ git log --oneline
	 773c310 added hello.py
	 7275078 More verbosity for the README
	 4f3ea33 Added README

Protips:

	!bash
	# set commit message without opening an editor
	git commit -m 'commit message'
	# add only parts of what was changed
	git add -p

---

# see what changed #
* use 'git diff'
* by default diffs current working dir with most recent commit
* super useful, check out 'git diff --help'

---
	!bash
	$ vim hello.py
	$ git diff
	 diff --git a/hello.py b/hello.py
	 index 3148dce..33f348b 100644
	 --- a/hello.py
	 +++ b/hello.py
	 @@ -1,3 +1,3 @@
	  #!/usr/bin/env python
	
	 -print "hello world"
	 +print "Hello, world!"
	$ git commit -am "Fixed up grammar in hello.py"
	[master 01ee7f3] Fixed up grammar in hello.py
	 1 files changed, 1 insertions(+), 1 deletions(-)

---

# saving keystrokes
* sometimes add -> commit gets annoying
* the '-a' option stages all modifications
* but make sure you REALLY want to commit everything
