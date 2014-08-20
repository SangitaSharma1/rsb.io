# Cheat Sheet


	!bash
	# get a repo from github
	$ git clone git://github.com/some1/project cool_thing_i_found
	# unstage a file
	$ git reset HEAD <filename>...
	# undo the changes to a file
	$ git checkout -- <filename>
	# delete a file from your staging area, but not working directory
	$ git rm --cached <filename>
	# view all unstaged changes
	$ git diff
	# view all staged changes
	$ git diff --cached
	# add a file to your last commit
	$ git commit -m "A commit"
	$ git add file_i_forgot.txt
	$ git commit --ammend
	# see the last 5 days of activity on the repository, concisely
	$ git log --since=5.days --oneline
