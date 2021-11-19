POOL ?= worker master
RPM_RUNC ?= https://ftweedal.fedorapeople.org/runc-1.0.0-990.rhaos4.8.gitcd80260.el8.x86_64.rpm

.PHONY: configure
configure:
	git checkout kustomization.yaml
	for role in $(POOL); do \
		ROLE="$${role}" \
		RPM_RUNC="$(RPM_RUNC)" \
		envsubst < install-custom-runc.yaml.envsubst > install-custom-runc-$${role}.yaml \
		&& echo "- install-custom-runc-$${role}.yaml" >> kustomization.yaml ; \
	done 

