# Docker tasks

# Docker Hub user/organization
NAMESPACE = dockium
# PHP version
VERSION = 7.1.13
# Docker image revision
REVISION = 2

# Build steps
all: debian

debian:
	# tag: dockium/php:7.1.13_0
	docker build -t $(NAMESPACE)/php:$(VERSION)_$(REVISION) .
