INDEX := index.html
STATIC := static
DIST := dist

clean:
	rm -rf $(DIST)
	mkdir $(DIST)

build: clean
	cp $(INDEX) $(DIST)/
	cp -r $(STATIC) $(DIST)/
