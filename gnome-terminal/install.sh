#!/usr/bin/env bash

set -e
source core.sh

log_info gnome-terminal "Importing settings..."
dconf load /org/gnome/terminal/ < gnome-terminal/regolith.theme
