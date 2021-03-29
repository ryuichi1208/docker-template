DOCKER_CMD := $(shell which docker)
LANG_TARGET := $(wildcard tmp/*)

.PHONY:
ALL:
	@$(foreach val, $(LANG_TARGET), cd $(abspath $(val)) && $(DOCKER_CMD) build --progress=plain --rm=true .)
