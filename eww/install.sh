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

ln -sf `pwd`/eww/eww.yuck $XDG_CONFIG_HOME/eww/eww.yuck
ln -sf `pwd`/eww/eww.scss $XDG_CONFIG_HOME/eww/eww.scss
ln -sf `pwd`/eww/bin/workspaces $XDG_CONFIG_HOME/eww/bin/workspaces
ln -sf `pwd`/eww/scripts/player.sh $XDG_CONFIG_HOME/eww/scripts/player.sh
