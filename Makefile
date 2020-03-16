$(CC)		:= $(shell which gcc)
DOCKER_CMD	:= $(shell which docker)
DOCKER_CMP_CMD	:= $(shell which docker-compose)
BASEDIR 	:= $(shell pwd)/docker
VERSION		:="1.0.0"
BUILD_OPT	:= "--rm=true --progress=plain --rm=true"

.PHONY: build --progress=plain --rm=true
build --progress=plain --rm=true: all

.PHONY: all
all: develop language middleware application

.PHONY: develop
develop:
	# docker run -it lukaszlach/merry-christmas 
	cd $(BASEDIR)/develop/centos && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/develop/ubuntu && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/develop/alpine && $(DOCKER_CMD) build --progress=plain --rm=true .

.PHONY: language
language:
	cd $(BASEDIR)/language/elixir && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/language/fortran && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/language/python && $(DOCKER_CMD) build --progress=plain --rm=true .
	# cd $(BASEDIR)/language/python/pytest && $(DOCKER_CMD) build --progress=plain --rm=true .
	# cd $(BASEDIR)/language/python/jessi && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/language/python/pypy && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/language/go && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/language/php && $(DOCKER_CMD) build --progress=plain --rm=true .
	# cd $(BASEDIR)/language/dart && $(DOCKER_CMD) build --progress=plain --rm=true .

.PHONY: middleware
middleware:
	cd $(BASEDIR)/middleware/nginx && $(DOCKER_CMD) build --progress=plain --rm=true .
	# cd $(BASEDIR)/middleware/ansible && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/middleware/terraform && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/middleware/apache && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/middleware/sshd && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/middleware/ldap&& $(DOCKER_CMD) build --progress=plain --rm=true .

.PHONY: application
application:
	cd $(BASEDIR)/application/nvim && $(DOCKER_CMD) build --progress=plain --rm=true .
	cd $(BASEDIR)/application/swagger && $(DOCKER_CMD) build --progress=plain --rm=true .

.PHONY: clean
clean:
	${DOCKER_CMD} container prune
	${DOCKER_CMD} image prune

.PHONY: $(PROGRAM)
$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $^

ifeq  ($(shell uname),Darwin)
.c.o:
	$(CC) $(CFLAGS) -c $<
else
.txt.html:
	perl ~/Dropbox/Web/GH/mw/makeweb.pl $< $@
	open -a "Google Chrome" $@
endif

.PHONY: version
version:
	$(DOCKER_CMD) version && echo ""
	$(DOCKER_CMP_CMD) version
