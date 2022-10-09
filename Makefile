# Default action and options for run
# By default will run an interactive bash prompt
RUN_PARAMS ?= bash

# Bring down any dependencies and build the images
build: docker

docker:
	docker build -t conrad-class-sandbox:latest .