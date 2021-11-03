#!/usr/bin/env bash

set -e
source core.sh

if [[ ! -f ~/.local/bin/eww ]]; then
	rm -rf /tmp/eww || true
	mkdir -p /tmp/eww
	pushd /tmp/eww
	git clone https://github.com/elkowar/eww .
	cargo build --release
	mkdir -p ~/.local/bin
	cp ./target/release/eww ~/.local/bin/eww
fi

mkdir -p ~/.config/eww/scripts
mkdir -p ~/.config/eww/bin

pushd ./eww/src/workspaces
go build -o ../../bin/workspaces .
popd
pushd ./eww/src/weather
go build -o ../../bin/weather .
popd

ln -sf `pwd`/eww/eww.yuck $XDG_CONFIG_HOME/eww/eww.yuck
ln -sf `pwd`/eww/eww.scss $XDG_CONFIG_HOME/eww/eww.scss
ln -sf `pwd`/eww/bin/workspaces $XDG_CONFIG_HOME/eww/bin/workspaces
ln -sf `pwd`/eww/bin/weather $XDG_CONFIG_HOME/eww/bin/weather
ln -sf `pwd`/eww/scripts/player.sh $XDG_CONFIG_HOME/eww/scripts/player.sh
ln -sf `pwd`/eww/scripts/progress.sh $XDG_CONFIG_HOME/eww/scripts/progress.sh
ln -sf `pwd`/eww/scripts/interface.sh $XDG_CONFIG_HOME/eww/scripts/interface.sh
