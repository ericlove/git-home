ARCH-TARGETS := .bash_profile bin .Xmodmap .Xresources .xinitrc .config/awesome

ARCH-DIR := $(GIT_HOME)/arch

.PHONY: check-arch

home: check-env $(addprefix $(HOME)/, $(ARCH-TARGETS))

$(HOME)/%: $(ARCH)/%
	ln -s $(ARCH-DIR)/$< $@

clean:
	rm -rf $(addprefix $(HOME)/, $(ARCH-TARGETS))

check-env:
ifndef ARCH
	$(error ARCH is undefined)
endif
ifndef GIT_HOME
  $(error GIT_HOME is undefined)
endif

