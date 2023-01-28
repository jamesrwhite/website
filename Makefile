SRC := src
DIST := dist

port := 8080

clean:
	@rm -rf $(DIST)
	@mkdir $(DIST)

setup:
	@npm ci --no-audit --no-fund

build: clean
	@cp -r $(SRC)/* $(DIST)/
	@npx postcss $(DIST)/css/tailwind.css > $(DIST)/css/app.css
	@rm $(DIST)/css/tailwind.css

run:
	@npx concurrently \
	-n build,server \
	-c red,yellow \
	"npx watch 'make build' $(SRC)" \
	"echo 'Starting server on http://localhost:$(port)' && npx wrangler pages dev --port $(port) --live-reload $(DIST)"

deploy:
	@npx wrangler pages publish --project-name website $(DIST)
