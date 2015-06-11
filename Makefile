.PHONY: re all clean build dev detach

PORT := $(if $(PORT), $(PORT), 4567)

project_name := arkis-api-docs
image_name   := containerhq/$(project_name)

all: build detach

re: clean all

clean:
	-docker rm -f $(project_name)

build:
	docker build -t $(image_name) .

dev: clean build
	docker run \
	-p $(PORT):4567 \
	-v $(PWD):/app \
	--name $(project_name) \
	-ti $(image_name) /bin/bash

detach:
	docker run -d -p $(PORT):4567 --name $(project_name) $(image_name)
