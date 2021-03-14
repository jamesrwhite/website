SRC := src
DIST := dist

port := 8080

clean:
	rm -rf $(DIST)
	mkdir $(DIST)

setup:
	npm ci

build: clean
	cp -r $(SRC)/* $(DIST)/
	npx tailwindcss build $(DIST)/css/tailwind.css -o $(DIST)/css/app.css
	rm $(DIST)/css/tailwind.css

serve: build
	npx http-server $(DIST) -p $(port) -c-1

watch:
	npx watch "make build" $(SRC)
