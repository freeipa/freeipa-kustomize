include ../../../../variables.mk
include ../../../../binaries.mk

.PHONY: configure
configure:
	@make -C ../../single-pod/common/ configure
	$(KUSTOMIZE) edit set image workload=$(OCP_IMAGE)
