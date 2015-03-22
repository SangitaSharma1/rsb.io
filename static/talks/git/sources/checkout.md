# check it out

	!bash
	$ git log --oneline --decorate
		1c8ce74 (HEAD, origin/newgitseminar, newgitseminar) Added more on branching
		4afbe50 Added slides for branching
		151dd2f Finished converting to vanilla markdown
		5e130da Added git seminar to front page
		d219f44 New Git seminar via Landslide now working
		dfbc19c (origin/master, origin/HEAD, master) Changed length of excerpt

		# specify a branch that is on the remote named 'origin'
	$ git checkout origin/master
		# specify a branch name
	$ git checkout master
		# specify commit ID (or hash)
	$ git dfbc19c
		# specify a commit that is 5 commits prior to where HEAD is
	$ git checkout HEAD~5

All those checkouts go to the same commit

# check out a specific file

	!bash
		# get the older version of file 'filename'
	$ git checkout -- filename
		# throw away all local changes and switch to branch 'master'
	$ git checkout -f master
