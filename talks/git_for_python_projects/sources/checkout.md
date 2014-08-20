# the language of the checkout

These all refer to the same commit

	!bash
		# specify a branch that is on a remote named 'origin'
	$ git checkout origin/master
		# specify a branch name
	$ git checkout master
		# specify commit ID (or hash)
	$ git dfbc19c
		# specify a commit that is 5 commits prior to where HEAD is
	$ git checkout HEAD~5

		# get the older version of file 'filename'
	$ git checkout -- filename
		# throw away all local changes and switch to branch 'master'
	$ git checkout -f master
