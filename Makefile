INDEX := index.html
DIST := dist

clean:
	rm -rf $(DIST)
	mkdir $(DIST)

build: clean
	cp $(INDEX) $(DIST)/

