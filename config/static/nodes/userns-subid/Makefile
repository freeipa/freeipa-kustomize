CRIO_USERNS_CONF_BASE64:=$(shell cat files/99-crio-userns.conf | base64 --wrap=0)
SUBUID_BASE64:=$(shell cat files/subuid | base64 --wrap=0)
SUBGID_BASE64:=$(shell cat files/subgid | base64 --wrap=0)
POOL ?= worker master

.PHONY: configure
configure:
	@for role in $(POOL); do \
		echo "Generating config-userns-$${role}.yaml" ; \
		CRIO_USERNS_CONF_BASE64="$(CRIO_USERNS_CONF_BASE64)" \
		SUBUID_BASE64="$(SUBUID_BASE64)" \
		SUBGID_BASE64="$(SUBGID_BASE64)" \
		ROLE="$${role}" \
		envsubst < config-userns.yaml.envsubst > config-userns-$${role}.yaml ; \
	done
