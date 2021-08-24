BASE_IMAGE := fedora-minimal
IMAGE_NAME := book-build
CONTAINER_FNAME := Containerfile

help:
	@echo "make podman-build - Build and locally tag a new image."
	@echo "make podman-build-force - Use a no-cache build"
	@echo "make podman-run will print an example execution of the container"

podman-build:
	@podman build -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) .

podman-build-force:
	@podman pull $(BASE_IMAGE)
	@podman build  -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) --no-cache .

podman-run:
	@echo podman run --rm -it -v ${PWD}:/data:z $(IMAGE_NAME) --help
