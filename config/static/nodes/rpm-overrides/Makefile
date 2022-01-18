# Machine pool names which the configuration will be applied on
POOL ?= worker master
# List of rpm packages to be installed; they are a list of URLs separated by spaces
# eg
#   RPM_PACKAGES ?= "https://ftweedal.fedorapeople.org/runc-1.0.0-992.rc95.module+el8.4.0+11650+50a9f308.x86_64.rpm" "https://ftweedal.fedorapeople.org/runc-1.0.0-992.rc95.module+el8.4.0+11650+50a9f308.x86_64.rpm"
RPM_PACKAGES ?=

.PHONY: configure
configure:
ifneq (,$(RPM_PACKAGES))
	@printf "%s\n%s\n%s\n" "apiVersion: kustomize.config.k8s.io/v1beta1" "kind: Kustomization" "resources:" > kustomization.yaml
	@for role in $(POOL); do \
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
