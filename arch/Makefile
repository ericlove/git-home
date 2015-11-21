ARCH-TARGETS := .bash_profile bin

.PHONY: check-arch

home: check-env $(addprefix $(HOME)/, $(ARCH-TARGETS))

$(HOME)/%: $(ARCH)/%
	cp -r $< $@

clean:
	rm -rf $(addprefix $(HOME)/, $(ARCH-TARGETS))

check-env:
ifndef ARCH
	$(error ARCH is undefined)
endif

