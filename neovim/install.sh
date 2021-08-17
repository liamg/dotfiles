#!/usr/bin/env bash

set -e
source core.sh

install_neovim () {
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt-get update >/dev/null 2>&1
	sudo apt-get install -y neovim >/dev/null 2>&1
}

log_info neovim "Checking neovim is installed..."
which nvim || install_neovim

target=$XDG_CONFIG_HOME/nvim/autoload/
mkdir -p $target
chmod +rwx $target

install_vimplug () {
    log_info neovim "Installing vim-plug..."
    curl -sfLo $target/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

log_info neovim "Checking vim-plug is installed..."
[[ -f "${target}/plug.vim" ]] || install_vimplug
log_success neovim "vim-plug is installed!"

install_yarn(){
	log_info neovim  "Installing yarn..."
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update >/dev/null
    sudo apt install --no-install-recommends -y yarn  >/dev/null
}

log_info neovim   "Checking yarn is installed..."
which yarn >/dev/null || install_yarn
log_success neovim "Yarn is installed!"

log_info neovim   "Configuring neovim..."
mkdir -p $HOME/.config/nvim/
ln -sf `pwd`/neovim/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln -sf `pwd`/neovim/coc-settings.json $XDG_CONFIG_HOME/nvim/coc-settings.json

log_info neovim   "Installing plugins..."
nvim +PlugInstall +qall
nvim +GoInstallBinaries +qall
log_success neovim "Plugins installed!"
