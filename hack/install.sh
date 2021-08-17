#!/usr/bin/env bash

set -e
source core.sh

# hack font
log_info hack "Checking font is installed..."
FONTDIR=~/.local/share/fonts/
install_hack () {
	log_info hack  "Installing font..."
	cp hack/fonts/* $FONTDIR/
	fc-cache -f >/dev/null
}
fc-list | grep 'Hack Nerd Font Mono:s' >/dev/null || install_hack
log_success hack "Font is installed!"
