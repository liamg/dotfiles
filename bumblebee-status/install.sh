#!/usr/bin/env bash

set -e
source core.sh

install_bb_status () {
    log_info bumblebee-status "Installing..."
    git clone https://github.com/tobi-wan-kenobi/bumblebee-status $XDG_CONFIG_HOME/regolith/bumblebee-status >/dev/null
}

# install bumblebee-status
log_info bumblebee-status "Checking bumblebee-status is installed..."
[[ -f $XDG_CONFIG_HOME/regolith/bumblebee-status/bumblebee-status ]] || install_bb_status
log_success bumblebee-status "Installed!"

# configure bumblebee theme
log_info bumblebee-status "Configuring theme..."
mkdir -p $XDG_CONFIG_HOME/bumblebee-status/themes
ln -sf `pwd`/bumblebee-status/theme.json $XDG_CONFIG_HOME/bumblebee-status/themes/liamg.json

# install bumblebee launcher
log_info bumblebee-status "Configuring launch script..."
ln -sf `pwd`/bumblebee-status/bar.sh $XDG_CONFIG_HOME/regolith/bar.sh