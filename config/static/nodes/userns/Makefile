ifneq (,ls -1 ../../../../private.mk 2>/dev/null)
include ../../../../private.mk
endif
POOL ?= worker master

.PHONY: configure
configure:
	@make -C ../userns-subid configure
	@make -C ../rpm-overrides configure
	@make -C ../cgroup-v2 configure
