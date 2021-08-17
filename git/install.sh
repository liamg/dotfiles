#!/usr/bin/env bash

set -e
source core.sh

log_info git "Installing config..."
cp git/config $HOME/.gitconfig
log_info git "Installing ignore rules..."
ln -sf `pwd`/git/ignore $HOME/.gitignore

[[ -f git/custom.sh ]] && log_info git "Adding custom config..." && source git/custom.sh
