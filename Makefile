build-image:
	docker pull ownport/pelican:latest

run-container:
	docker run -ti --rm --name 'notes' \
		-v $$(pwd)/engine:/data/engine \
		ownport/pelican:latest \
		/bin/run-as.sh notes 1000 /bin/sh

update-gh-pages:
	./scripts/ghp-import engine/output/
	git push origin gh-pages 

	
