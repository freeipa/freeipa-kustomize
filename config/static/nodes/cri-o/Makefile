POOL ?= worker master
RPM_CRI_O ?= https://...

.PHONY: configure
configure:
	git checkout kustomization.yaml
	for role in $(POOL); do \
		ROLE="$${role}" \
		RPM_CRI_O="$(RPM_CRI_O)" \
		envsubst < install-custom-cri-o.yaml.envsubst > install-custom-cri-o-$${role}.yaml ; \
		echo "- install-custom-cri-o-$${role}.yaml" >> kustomization.yaml ; \
	done
