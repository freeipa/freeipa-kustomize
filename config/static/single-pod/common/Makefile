include ../../../../variables.mk
include ../../../../binaries.mk

SINGLEPOD_INGRESSDOMAIN := $(shell oc get ingresses.config/cluster -o jsonpath='{.spec.domain}' )
SINGLEPOD_REALM := $(shell tr '[:lower:]' '[:upper:]' <<< "$(SINGLEPOD_INGRESSDOMAIN)" )
SINGLEPOD_HOSTNAME := $(OCP_NAMESPACE).$(SINGLEPOD_INGRESSDOMAIN)
SINGLEPOD_CA_SUBJECT := CN=freeipa-$(shell date +%Y%m%d%H%M%S ), O=$(SINGLEPOD_REALM)
SINGLEPOD_ENV_FILE := env.properties

SINGLEPOD_SECRETS_FILE := secrets.properties

ifeq (,$(IPA_ADMIN_PASSWORD))
$(error "IPA_ADMIN_PASSWORD is required for generating the secret with the password; you can set it before call 'make'")
endif

ifeq (,$(IPA_DM_PASSWORD))
$(error "IPA_DM_PASSWORD is required for generating the secret with the password; you can set it before call 'make'")
endif

.PHONY: configure
configure:
	@true > $(SINGLEPOD_ENV_FILE)
	@echo "IPA_SERVER_NAMESPACE=$(OCP_NAMESPACE)" >> $(SINGLEPOD_ENV_FILE)
	@echo "IPA_SERVER_REALM=$(SINGLEPOD_REALM)" >> $(SINGLEPOD_ENV_FILE)
	@echo "IPA_SERVER_CA_SUBJECT=$(SINGLEPOD_CA_SUBJECT)" >> $(SINGLEPOD_ENV_FILE)
	@echo "IPA_SERVER_HOSTNAME=$(SINGLEPOD_HOSTNAME)" >> $(SINGLEPOD_ENV_FILE)
	@true > $(SINGLEPOD_SECRETS_FILE)
	@echo "IPA_ADMIN_PASSWORD=$(IPA_ADMIN_PASSWORD)" >> $(SINGLEPOD_SECRETS_FILE)
	@echo "IPA_DM_PASSWORD=$(IPA_DM_PASSWORD)" >> $(SINGLEPOD_SECRETS_FILE)
