# Docker tasks

# Docker Hub user/organization
NAMESPACE = dockium
# PHP version
VERSION = 7.1.12
# Docker image revision
REVISION = 1

# Build steps
all: 7-1

7-1:
	# tag: dockium/php:7.1.12_0
	docker build -t $(NAMESPACE)/php:$(VERSION)_$(REVISION) ./7.1
