TARGETS := .vimrc .vim .tmux.conf

.PHONY: check-arch

home: check-env $(addprefix $(HOME)/, $(TARGETS)) 
	$(MAKE) -C arch

$(HOME)/%: common/%
	ln -Fs $(PWD)/$< $@

clean:
	rm -rf $(addprefix $(HOME)/, $(TARGETS))
	$(MAKE) -C arch clean

check-env:
ifndef ARCH
	$(error ARCH is undefined)
endif

