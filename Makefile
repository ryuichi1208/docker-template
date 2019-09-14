DOCKER_CMD= $(shell which docker)

BASEDIR = ./docker

all:
	cd $(BASEDIR)/language/elixir && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/fortran && $(DOCKER_CMD) build .
	cd $(BASEDIR)/language/python && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/nginx && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/ansible && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/terraform && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/apache && $(DOCKER_CMD) build .
	cd $(BASEDIR)/middleware/sshd && $(DOCKER_CMD) build .
	cd $(BASEDIR)/application/nvim && $(DOCKER_CMD) build .

