include ../../../variables.mk
include ../../../binaries.mk

.PHONY: configure
configure:
	@$(KUSTOMIZE) edit set image workload=$(OCP_IMAGE)
	@make -C common/ configure
