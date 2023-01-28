SRC := src
DIST := dist
VERSION := $(shell date +%s)

port := 8080

clean:
	@rm -rf $(DIST)
	@mkdir $(DIST)

setup:
	@npm ci --no-audit --no-fund

build: clean
	@cp -r $(SRC)/* $(DIST)/
	@sed -i '.backup' 's/__VERSION__/$(VERSION)/g' $(DIST)/index.html && rm -f $(DIST)/index.html.backup
	@npx tailwindcss -o $(DIST)/css/app.css --minify
	@rm $(DIST)/css/tailwind.css

run:
	@npx concurrently \
	-n build,server \
	-c red,yellow \
	"npx watch 'make build' $(SRC)" \
	"echo 'Starting server on http://localhost:$(port)' && npx wrangler pages dev --port $(port) --live-reload $(DIST)"

deploy:
	@npx wrangler pages publish --project-name website $(DIST)
