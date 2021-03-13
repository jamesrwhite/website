SRC := src
DIST := dist

port := 8080

clean:
	rm -rf $(DIST)
	mkdir $(DIST)

setup:
	npm ci

build: clean
	npx tailwindcss build src/static/css/tailwind.css -o src/static/css/app.css
	cp -r $(SRC)/* $(DIST)/

serve: build
	npx http-server $(DIST) -p $(port) -o