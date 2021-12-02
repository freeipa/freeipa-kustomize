POOL ?= worker master
RPM_PACKAGES ?=
# RPM_RUNC ?= https://ftweedal.fedorapeople.org/runc-1.0.0-990.rhaos4.8.gitcd80260.el8.x86_64.rpm
# RPM_RUNC_PKG_NAME ?= runc-1.0.0-990.rhaos4.8.gitcd80260.el8

.PHONY: configure
configure:
ifneq (,$(RPM_PACKAGES))
	git checkout kustomization.yaml
	for role in $(POOL); do \
		for rpm in $(RPM_PACKAGES); do \
			RPM_PKG_NAME="$${rpm##**/}" ; \
			RPM_PKG_NAME="$${RPM_PKG_NAME%%-[0123456789]*.rpm}" ; \
			export RPM_PKG_NAME ; \
			RPM_PKG="$${rpm##**/}" ; \
			RPM_PKG="$${RPM_PKG%.rpm}" ; \
			export RPM_PKG ; \
			RPM_URL="$${rpm}" \
			ROLE="$${role}" \
			RPM_RUNC="$(RPM_RUNC)" \
			envsubst < install-custom-rpm.yaml.envsubst > install-custom-$${role}-$${RPM_PKG_NAME}.yaml \
			&& echo "- install-custom-$${role}-$${RPM_PKG_NAME}.yaml" >> kustomization.yaml ; \
		done; \
	done 
endif

