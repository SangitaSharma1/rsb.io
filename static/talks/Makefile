PRESOS := go zmq hflossk open_source_way
all:
	./mkslides.R
	@ $(foreach var,$(PRESOS),\
	sed -i -e 's/="libraries/="..\/libraries/' ./$(var)/index.html;)
	@ $(foreach var,$(PRESOS),\
	rsync -a ./$(var)/libraries/ ./libraries;)
	@ $(foreach var,$(PRESOS),\
	rm -rf ./$(var)/libraries;)
