#!/usr/bin/env bash

set -e
source core.sh

check_package_installed zsh

CUSTOMDIR="$HOME/.oh-my-zsh/custom"

install_ohmyzsh() {
    log_info ohmyzsh "Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
}

log_info ohmyzsh "Checking installation..."
[[ -d "$HOME/.oh-my-zsh" ]] || install_ohmyzsh
log_success ohmyzsh "Installed!"

install_theme() {
    name=$1
    repo=$2
    git clone "$repo" "$CUSTOMDIR/themes/$name"
}

install_plugin() {
    name=$1
    repo=$2
    git clone "$repo" "$CUSTOMDIR/plugins/$name"
}

check_theme_installed() {
    name=$1
    repo=$2
    [[ -d $CUSTOMDIR/themes/$name ]] || install_theme $name $repo
}

check_plugin_installed() {
    name=$1
    repo=$2
    [[ -d $CUSTOMDIR/plugins/$name ]] || install_plugin $name $repo
}

check_theme_installed powerlevel10k https://github.com/romkatv/powerlevel10k

ln -fs `pwd`/zsh/p10k.zsh "$CUSTOMDIR/p10k.zsh"
ln -fs `pwd`/zsh/aliases.zsh "$CUSTOMDIR/aliases.zsh"
ln -fs `pwd`/zsh/zshrc "${HOME}/.zshrc"
ln -fs `pwd`/zsh/zshenv "${HOME}/.zshenv"
