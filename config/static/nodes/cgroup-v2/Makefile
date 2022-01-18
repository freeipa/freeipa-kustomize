POOL ?= worker master

.PHONY: configure
configure:
	@printf "%s\n%s\n%s\n" "apiVersion: kustomize.config.k8s.io/v1beta1" "kind: Kustomization" "resources:" > kustomization.yaml
	@for role in $(POOL); do ROLE="$${role}" envsubst < machine-config-cgroup-v2.yaml.envsubst > machine-config-cgroup-v2-$${role}.yaml; echo "- machine-config-cgroup-v2-$${role}.yaml" >> kustomization.yaml; done
