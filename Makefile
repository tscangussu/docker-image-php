# Docker tasks

# Build steps
all: 7-1

# Version 7.1
7-1: 7-1-alpine-3-7 7-1-debian-9

# recursive use of make
7-1-alpine-3-7:
		$(MAKE) -C ./7.1/alpine/3.7
7-1-debian-9:
		$(MAKE) -C ./7.1/debian/9
