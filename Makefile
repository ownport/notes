build-image:
	docker build -t 'ownport.github.notes:latest' .

run-container:
	docker run -ti --rm --name 'notes' -v $$(pwd)/engine:/data/engine ownport.github.notes

update-gh-pages:
	./scripts/ghp-import engine/output/
	git push origin gh-pages 

	
