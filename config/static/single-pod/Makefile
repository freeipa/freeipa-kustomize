include ../../../variables.mk
include ../../../binaries.mk

.PHONY: configure
configure:
    @$(KUSTOMIZE) edit set namespace $(SINGLEPOD_NAMESPACE)
	@make -C common/ configure

