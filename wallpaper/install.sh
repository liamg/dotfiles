#!/usr/bin/env bash

set -e
source core.sh


[[ -f wallpaper/wallpaper.jpg ]] || [[ -f wallpaper/wallpaper.png ]] || cp wallpaper/default.jpg wallpaper/wallpaper.jpg

log_info wallpaper "Setting..."
if [[ -f wallpaper/wallpaper.png ]]; then
    ln -sf `pwd`/wallpaper/wallpaper.png $HOME/active-wallpaper
elif [[ -f wallpaper/wallpaper.jpg ]]; then
    ln -sf `pwd`/wallpaper/wallpaper.jpg $HOME/active-wallpaper
fi

