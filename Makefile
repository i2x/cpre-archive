all: update-submodules

init-submodules:
	git submodule init

update-submodules: init-submodules
	git submodule update

.PHONY: all init-submodules update-submodules
