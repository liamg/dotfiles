
default: help

.PHONY: help
help:
## help: This helpful list of commands
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/-/'

.PHONY: install
install: go packages docker rust nodejs hack xresources-install i3-install gnome-terminal eww bumblebee-status zsh git neovim wallpaper i3-restart ncspot
## install: Install/configure everything. Should be idempotent.

.PHONY: eww
eww:
## eww: install eww for a custom bar/widgets (see eww/install.sh)
	@./eww/install.sh

.PHONY: nodejs
nodejs:
## nodejs: install latest LTS version of nodejs (see nodejs/install.sh)
	@./nodejs/install.sh

.PHONY: docker
docker:
	## docker: install latest stable docker (see docker/install.sh)
	@./docker/install.sh

.PHONY: rust
rust:
	## rust: install rust via rustup (see rust/install.sh)
	@./rust/install.sh

.PHONY: go
go:
## go: install a specific version of Go (see go/install.sh)
	@./go/install.sh

.PHONY: i3-install
i3-install:
## i3-install: Installs i3 configuration
	@./i3/install.sh

.PHONY: i3-restart
i3-restart:
## i3-restart: Restart i3 with new config/Xresources
	@./i3/restart.sh

.PHONY: i3
i3: i3-install i3-restart
## i3: Installs i3 config and restarts i3

.PHONY: hack
hack:
## hack: Installs patched Hack font
	@./hack/install.sh

.PHONY: neovim
neovim:
## neovim: Installs neovim, plugins, theme and settigns
	@./neovim/install.sh

.PHONY: packages
packages:
## packages: Install OS packages
	@./packages/install.sh

.PHONY: xresources-install
xresources-install:
## xresources-install: Install Xresources config. Add custom overrides using xresources/Xresources.custom
	@./xresources/install.sh

.PHONY: xresources
xresources: xresources-install i3-restart
## xresources: Install Xresources config and restarts i3. Add custom overrides using xresources/Xresources.custom

.PHONY: gnome-terminal
gnome-terminal:
## gnome-terminal: Installs configuration for gnome-terminal, mainly the theme.
	@./gnome-terminal/install.sh

.PHONY: bumblebee-status
bumblebee-status:
## bumblebee-status: Install bumblebee-status, config, theme and launcher script.
	@./bumblebee-status/install.sh

.PHONY: zsh
zsh:
## zsh: Install zsh, oh-my-zsh, p10k and configuration.
	@./zsh/install.sh

.PHONY: git
git:
## git: Installs global git configuration and git ignore.
	@./git/install.sh

.PHONY: wallpaper
wallpaper: install-wallpaper i3-restart

.PHONY: install-wallpaper
install-wallpaper:
## wallpaper: Sets wallpaper. Override default with wallpaper/custom.png
	@./wallpaper/install.sh

.PHONY: ncspot
ncspot:
## ncspot
	@./ncspot/install.sh
