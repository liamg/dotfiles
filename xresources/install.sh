#!/usr/bin/env bash

set -e
source core.sh

log_info xresources "Merging custom settings..."
touch xresources/Xresources.custom
cp xresources/Xresources xresources/Xresources.built
cat xresources/Xresources.custom >> xresources/Xresources.built

log_info xresources "Overriding configuration..."
[[ -f $XDG_CONFIG_HOME/regolith/Xresources ]] && cp $XDG_CONFIG_HOME/regolith/Xresources $XDG_CONFIG_HOME/Xresources.backup
ln -sf `pwd`/xresources/Xresources.built $XDG_CONFIG_HOME/regolith/Xresources
