PREFIX  ?= $(HOME)/.local
AUR_DIR ?= $(HOME)/aur/hypr-desktop-git

install:
	install -Dm755 bin/hypr-desktop $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	install -Dm755 bin/hypr-desktop-menu $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop
	rm -f $(DESTDIR)$(PREFIX)/bin/hypr-desktop-menu

release: ## Tag, push, and publish to AUR (make release V=x.y.z)
	@test -n "$(V)" || { echo "Usage: make release V=1.1.0"; exit 1; }
	@test -z "$$(git status --porcelain)" || { echo "Error: working tree not clean — commit first"; exit 1; }
	@test -d "$(AUR_DIR)/.git" || { echo "Error: AUR repo not found at $(AUR_DIR)"; exit 1; }
	@echo "==> Tagging v$(V)..."
	git tag v$(V)
	git push && git push --tags
	@echo "==> Updating AUR..."
	cp PKGBUILD $(AUR_DIR)/PKGBUILD
	cd $(AUR_DIR) && makepkg --printsrcinfo > .SRCINFO && \
		git add PKGBUILD .SRCINFO && \
		git commit -m "Update to $(V)" && \
		git push origin HEAD:master
	@echo "==> Released v$(V)"

.PHONY: install uninstall release
