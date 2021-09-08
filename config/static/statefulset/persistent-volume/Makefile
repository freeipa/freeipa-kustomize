include ../../../../variables.mk
include ../../../../binaries.mk

.PHONY: configure
configure:
	@$(KUSTOMIZE) edit set namespace $(OCP_NAMESPACE)
	@$(KUSTOMIZE) edit set image workload=$(OCP_IMAGE)
	@make -C ../../single-pod/common/ configure
