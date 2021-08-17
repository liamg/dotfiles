#!/usr/bin/env bash

set -e
source core.sh
wallpaper=https://w.wallhaven.cc/full/v9/wallhaven-v9m2r8.png

# wallpaper
log_info wallpaper "Setting..."
if [[ -f wallpaper/custom.png ]]; then
    ln -sf `pwd`/wallpaper/custom.png $HOME/active-wallpaper
elif [[ -f wallpaper/custom.jpg ]]; then
    ln -sf `pwd`/wallpaper/custom.jpg $HOME/active-wallpaper
else
	[[ -f wallpaper/default.jpg ]] || (log_info wallpaper "Downloading..." && curl -sL -o wallpaper/default.jpg $wallpaper)
    ln -sf `pwd`/wallpaper/default.jpg $HOME/active-wallpaper
fi

