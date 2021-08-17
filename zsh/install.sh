#!/usr/bin/env bash

set -e
source core.sh

check_package_installed zsh

CUSTOMDIR="$HOME/.oh-my-zsh/custom"

log_info zsh "Checking default shell is zsh..."
zshpath=$(which zsh)
if [[ ! "$zshpath" = "$SHELL" ]]; then
	log_info zsh "Changing default shell..."
	chsh -s $zshpath
	log_warning zsh "You need to reboot/relog for your new default shell to take effect."
fi
log_success zsh "Default shell is zsh!"

install_ohmyzsh() {
    log_info ohmyzsh "Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended >/dev/null
}

log_info ohmyzsh "Checking installation..."
[[ -d "$HOME/.oh-my-zsh" ]] || install_ohmyzsh
log_success ohmyzsh "Installed!"

install_theme() {
	log_info ohmyzsh "Installing theme '$1'..."
    name=$1
    repo=$2
    git clone "$repo" "$CUSTOMDIR/themes/$name" >/dev/null 2>&1
}

install_plugin() {
	log_info ohmyzsh "Installing plugin '$1'..."
    name=$1
    repo=$2
    git clone "$repo" "$CUSTOMDIR/plugins/$name" >/dev/null 2>&1
}

check_theme_installed() {
	log_info ohmyzsh "Checking theme '$1' is installed..."
    name=$1
    repo=$2
    [[ -d $CUSTOMDIR/themes/$name ]] || install_theme $name $repo
	log_success ohmyzsh "Theme '$1' is installed."
}

check_plugin_installed() {
	log_info ohmyzsh "Checking plugin '$1' is installed..."
    name=$1
    repo=$2
    [[ -d $CUSTOMDIR/plugins/$name ]] || install_plugin $name $repo
	log_success ohmyzsh "Plugin '$1' is installed."
}

check_theme_installed powerlevel10k https://github.com/romkatv/powerlevel10k
check_plugin_installed you-should-use https://github.com/MichaelAquilina/zsh-you-should-use

log_info ohmyzsh "Adding zsh configuration..."
ln -fs `pwd`/zsh/p10k.zsh "$CUSTOMDIR/p10k.zsh"
ln -fs `pwd`/zsh/aliases.zsh "$CUSTOMDIR/aliases.zsh"
ln -fs `pwd`/zsh/zshrc "${HOME}/.zshrc"
ln -fs `pwd`/zsh/zshenv "${HOME}/.zshenv"
