TARGETS := 

.PHONY: check-arch

home: check-env $(addprefix $(HOME)/, $(TARGETS)) 
	$(MAKE) -C arch

$(HOME)/%: common/%
	cp -r $< $@

clean:
	rm -rf $(TARGETS)
	$(MAKE) -C arch clean

check-env:
ifndef ARCH
	$(error ARCH is undefined)
endif

