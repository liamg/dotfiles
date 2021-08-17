#!/usr/bin/env bash

set -e
source core.sh

# wallpaper
log_info wallpaper "Setting..."
if [[ -f wallpaper/custom.png ]]; then
    ln -sf `pwd`/wallpaper/custom.png $HOME/active-wallpaper
else
    ln -sf `pwd`/wallpaper/grid.png $HOME/active-wallpaper
fi
