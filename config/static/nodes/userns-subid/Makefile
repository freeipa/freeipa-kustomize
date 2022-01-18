CRIO_USERNS_CONF_BASE64:=$(shell cat files/99-crio-userns.conf | base64 --wrap=0)
SUBUID_BASE64:=$(shell cat files/subuid | base64 --wrap=0)
SUBGID_BASE64:=$(shell cat files/subgid | base64 --wrap=0)
POOL ?= worker master

.PHONY: configure
configure:
	@printf "%s\n%s\n%s\n" "apiVersion: kustomize.config.k8s.io/v1beta1" "kind: Kustomization" "resources:" > kustomization.yaml
	@for role in $(POOL); do \
		echo "Generating config-userns-$${role}.yaml" ; \
		CRIO_USERNS_CONF_BASE64="$(CRIO_USERNS_CONF_BASE64)" \
		SUBUID_BASE64="$(SUBUID_BASE64)" \
		SUBGID_BASE64="$(SUBGID_BASE64)" \
		ROLE="$${role}" \
		envsubst < config-userns.yaml.envsubst > config-userns-$${role}.yaml ; \
		echo "- config-userns-$${role}.yaml" >> kustomization.yaml ; \
	done
