POOL ?= worker master

.PHONY: configure
configure:
	@git checkout kustomization.yaml
	@for role in $(POOL); do ROLE="$${role}" envsubst < machine-config-cgroup-v2.yaml.envsubst > machine-config-cgroup-v2-$${role}.yaml; echo "- machine-config-cgroup-v2-$${role}.yaml" >> kustomization.yaml; done
