# bring it back together

	!bash
	git checkout master
	git merge experiment
	< resolve conflicts >

	Hello
	<<<<<<< HEAD
	there
	=======
	experimental
	>>>>>>> experiment
	world

	git commit -m "Merged in my experimental feature"
