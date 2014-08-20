branching
=========

---

# branching

* lightweight (creating a branch requires 40 bytes of space)
* pointers to different commits
* conveneint ways to separate tasks and features

---

# why it's hot

* create a branch to try out an idea, commit a few times, switch back to where you branched from, work there a while, returning to your experiment at your leisure

* have a branch that only ever contains production code, along with separate development and feature branches

* delete feature branches when they are merged into the master branch


---
# starting with branches

![](img/branching_intro.png)

get a branch

	!bash
	$ git checkout branchname

create a new branch with name branchname

	!bash
	$ git checkout -b branchname
	#or
	git branch branchname
	git checkout branchname

---

# develop asynchronously
	*   5a376b1 - Merge branch 'master' of github.com:boto/boto
	|\
	| * 2f03097 - Adding ref/dynamodb to hidden TOC.
	| *   649bad2 - Merging in @rdodev's DynamoDB tutorial and adapting it for Layer2
	| |\
	| | * d5defb8 - Little changes
	| | * 0a5046c - Starting point. We can add more details later on.
	| | * a99fb2e - Grammar fix
	| | * d5d3edb - Minor redaction edits
	| | *   e5a397f - Merge branch 'master' of git@github.com:rdodev/boto.git
	| | |\
	| | | * 8c19b40 - Fixing code example
	| | * | f35a84d - Added subsections

# merge branches whenever

---

# working with branches

push one of your branches up to a remote

	!bash
	$ git push origin testfeature:experimental

it's trivial to pull in the remotes of other collaborators

	!bash
	# checkout the branch "grill" from rick (a remote) and call it "bacon"
	$ git checkout --track -b bacon rick/grill
	# check out the same branch, but just call it grill
	$ git checkout -t rick/grill
	# a common one you'll use is this:
	$ git checkout -t origin/feature

to display all local branches

	!bash
	$ git branch
		  master
		* newgitseminar
		  truncatehtml
		  vanilla_960

