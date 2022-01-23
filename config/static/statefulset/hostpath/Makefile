include ../../../../variables.mk
include ../../../../binaries.mk

.PHONY: configure
configure:
	@make -C ../config-base
	$(KUSTOMIZE) edit set image workload=$(OCP_IMAGE)
