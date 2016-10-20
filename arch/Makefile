ARCH-TARGETS := .bash_profile bin .local_profile.sh

ARCH-DIR := $(GIT_HOME)/arch

.PHONY: check-arch

home: check-env \
	$(addprefix $(HOME)/, $(ARCH-TARGETS)) \
	$(addprefix $(HOME)/, $(LOCAL-TARGETS))

$(HOME)/%: $(ARCH)/%
	ln -s $(ARCH-DIR)/$< $@

clean:
	rm -rf $(addprefix $(HOME)/, $(ARCH-TARGETS))
	rm -rf $(addprefix $(HOME)/, $(LOCAL-TARGETS))

check-env:
ifndef ARCH
	$(error ARCH is undefined)
endif
ifndef GIT_HOME
  $(error GIT_HOME is undefined)
endif
include $(ARCH-DIR)/$(ARCH)/arch.mk
