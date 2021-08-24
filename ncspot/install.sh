#!/usr/bin/env bash

set -e
source ./core.sh

install_ncspot() {
[[ -d /tmp/ncspot ]] && rm -rf /tmp/ncspot
git clone https://github.com/hrkfdn/ncspot.git /tmp/ncspot
pushd /tmp/ncspot
cargo build --release
sudo mv /tmp/ncspot/target/release/ncspot /usr/bin/ncspot
popd
}

which ncspot >/dev/null 2>&1 || install_ncspot

mkdir -p $XDG_CONFIG_HOME/ncspot
ln -sf `pwd`/ncspot/config.toml $XDG_CONFIG_HOME/ncspot/config.toml

