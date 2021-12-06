# https://www.redhat.com/sysadmin/replace-docker-podman-mac-revisit
# https://www.redhat.com/sysadmin/replace-docker-podman-mac-revisited
# If podman ps fails, try:
# $ eval "$(ssh-agent -s)"
# $ ssh-add /Users/$USER/.ssh/podman-machine-default
#
# If kind fails, review this link:
# https://kind.sigs.k8s.io/docs/user/rootless/
ARCH := $(shell uname -m)
ifeq (,$(IMG_BASE))
$(error IMG_BASE need to be set to your container registry and namespace, such as quay.io/USER)
endif
IMG=$(IMG_BASE)/demos:signals-$(ARCH)
ifneq (,$(shell command -v docker 2>/dev/null))
DOCKER ?= docker
else
ifneq (,$(shell command -v podman 2>/dev/null))
DOCKER ?= podman
endif
endif

ifeq (,$(DOCKER))
$(error ERROR podman or docker is required)
endif
DEPENDENCIES := kind kustomize kubectl $(DOCKER)

KUBECONFIG := kubeconfig
export KUBECONFIG

.PHONY: default
default: help

.PHONY: check-deps
check-deps:: ## Check dependencies
	@for item in $(DEPENDENCIES); do printf "Checking %s ... " "$${item}"; if command -v "$$item" &>/dev/null; then printf "OK\n"; else printf "FAILURE\n"; exit 0; fi; done

.PHONY: kind-create
kind-create:: ## Create a cluster with 'kind'; If this fails visit: https://kind.sigs.k8s.io/docs/user/rootless/
	@! test -e "$(KUBECONFIG)" || { echo "ERROR:$(KUBECONFIG) exists from a previous execution"; exit 1; }
	kind create cluster
	kind get kubeconfig > "$(KUBECONFIG)"

.PHONY: kind-delete
kind-delete:: ## Delete the 'kind' cluster
	kind delete cluster
	@rm -f "$(KUBECONFIG)"

.PHONY: create
create:: ## Create the configuration by using the kind cluster
	kustomize edit set image workload=$(IMG)
	kustomize build . | KUBECONFIG=$(KUBECONFIG) kubectl create -f -

.PHONY: delete
delete:: ## Delete the configuration created into the kind cluster
	kustomize build . | KUBECONFIG=$(KUBECONFIG) kubectl delete -f -

.PHONY: container-build
container-build:: ## Build container image
	podman build -t $(IMG) -f Dockerfile .

.PHONY: container-push
container-push:: ## Push the container image to the registry
	podman push $(IMG)

# https://github.com/operator-framework/operator-sdk/blob/master/Makefile
.PHONY: help
help:: ## Show help about the commands
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

