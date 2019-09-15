VERSION="1.0.0"
DOCKER_CMD= $(shell which docker)
BASEDIR = ./docker

.PHONY: all
all: develop language middleware application

.PHONY: develop
develop:
	cd $(BASEDIR)/develop/centos && $(DOCKER_CMD) build .
	cd $(BASEDIR)/develop/ubuntu && $(DOCKER_CMD) build .

.PHONY: language
language:
	cd $(BASEDIR)/language/elixir && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/fortran && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/python && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/python/pytest && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/go && $(DOCKER_CMD) build .

.PHONY: middleware
middleware:
	cd $(BASEDIR)/middleware/nginx && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/ansible && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/terraform && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/apache && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/sshd && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/ldap&& $(DOCKER_CMD) build .

.PHONY: application
application:
	cd $(BASEDIR)/application/nvim && $(DOCKER_CMD) build .
	cd $(BASEDIR)/application/swagger && $(DOCKER_CMD) build .
