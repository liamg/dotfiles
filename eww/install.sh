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

mkdir -p $HOME/.local/bin
pushd ./eww/widgets/workspaces/src
go build -o $HOME/.local/bin/eww-workspaces .
popd
pushd ./eww/widgets/weather/src
go build -o $HOME/.local/bin/eww-weather .
popd
pushd ./eww/widgets/github/src
go build -o $HOME/.local/bin/eww-github .
popd


rm -rf $XDG_CONFIG_HOME/eww
ln -s `pwd`/eww $XDG_CONFIG_HOME/eww


