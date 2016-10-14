PRESOS := go zmq hflossk open_source_way
all:
	./mkslides.R
	@ $(foreach var,$(PRESOS),\
	sed -i -e 's/="libraries/="..\/libraries/' ./$(var)/index.html;)
	@ $(foreach var,$(PRESOS),\
	sed -i -e 's|http://ajax|//ajax|' ./$(var)/index.html;)
	@ $(foreach var,$(PRESOS),\
	rsync -a ./$(var)/libraries/ ./libraries;)
	@ $(foreach var,$(PRESOS),\
	rm -rf ./$(var)/libraries;)
	sed -i -e 's|http://fonts|//fonts|' libraries/frameworks/io2012/css/slidify.css
