PREFIX ?= $(HOME)/.local

AUR_PKG  := hypr-desktop-git
AUR_REPO := ssh://aur@aur.archlinux.org/$(AUR_PKG).git

-include hypr-tui/release.mk

install:
	install -Dm755 bin/hypr-desktop $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	install -Dm755 bin/hypr-desktop-menu $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu
	install -dm755 $(DESTDIR)$(PREFIX)/lib/hypr-desktop/hypr_tui
	install -m644 hypr-tui/hypr_tui/__init__.py $(DESTDIR)$(PREFIX)/lib/hypr-desktop/hypr_tui/__init__.py

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu
	rm -rf $(DESTDIR)$(PREFIX)/lib/hypr-desktop

.PHONY: install uninstall
