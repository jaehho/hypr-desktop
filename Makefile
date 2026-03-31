PREFIX ?= $(HOME)/.local

install:
	install -Dm755 bin/hypr-desktop $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	install -Dm755 bin/hypr-desktop-menu $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu

.PHONY: install uninstall
