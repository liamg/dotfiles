#!/bin/bash

set -e

i3configdir=~/.config/regolith/i3
i3config=$i3configdir/config
mkdir -p $i3configdir

install () {
	echo "Checking $1 is installed..."
	package=${2:-$1}
	(which $1 >/dev/null || (echo "Installing $1..." && sudo apt install -y $package >/dev/null))
}

install curl
install unzip
install git
install nvim neovim
install rg ripgrep
install flameshot

echo "Loading gnome terminal settings..."
dconf load /org/gnome/terminal/ < gnome.term

echo "Checking vim-plug is installed..."
target="${XDG_DATA_HOME:-$HOME/.config}"/nvim/autoload/
mkdir -p $target
chmod +rwx $target
[[ -d $vimplug_target ]] || ( echo "Installing vim-plug..." && curl -sfLo $target/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

install_yarn(){
	echo
	echo "Installing yarn..."
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update && sudo apt install --no-install-recommends -y yarn
}

echo
echo "Checking yarn is installed..."
which yarn >/dev/null || install_yarn

echo "Configuring neovim..."
mkdir -p $HOME/.config/nvim/
ln -sf `pwd`/init.vim $HOME/.config/nvim/init.vim
ln -sf `pwd`/coc-settings.json $HOME/.config/nvim/coc-settings.json
nvim +PlugInstall +qall
nvim +GoInstallBinaries +qall

# ensure directory exists
echo "Checking regolith config location exists..."
mkdir -p ~/.config/regolith

# install bumblebee-status
echo "Checking bumblebee-status is installed..."
[[ -f ~/.config/regolith/bumblebee-status/bumblebee-status ]] || (echo "Installing bumblebee-status" && git clone git://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/regolith/bumblebee-status >/dev/null)

# configure bumblebee theme
echo "Configuring bumblebee-status theme..."
mkdir -p ~/.config/bumblebee-status/themes
ln -sf `pwd`/liamg.json ~/.config/bumblebee-status/themes/liamg.json

# install bumblebee launcher
echo "Configuring bumblebee-status launch script..."
ln -sf `pwd`/bar.sh ~/.config/regolith/bar.sh

# setup Xresources customisation 
echo "Overriding Xresources..."
[[ -f ~/.config/regolith/Xresources ]] && cp ~/.config/regolith/Xresources ~/.config/regolith/Xresources.backup
ln -sf `pwd`/Xresources ~/.config/regolith/Xresources

# add flameshot keybinding
echo "Configuring screenshot keybinding for flameshot..."
(grep "flameshot" $i3config || echo 'bindsym --release Print exec "flameshot gui"' >> $i3config) >/dev/null

# wallpaper
ln -sf `pwd`/grid.png ~/active-wallpaper

# hack font
echo "Checking Hack font is installed..."
FONTDIR=~/.local/share/fonts/
install_hack () {
	echo "Installing Hack..."
	curl -sL https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -o/tmp/hack.zip
	pushd /tmp
	unzip hack.zip
	mkdir -p $FONTDIR
	mv ./ttf/* $FONTDIR
	fc-cache -f >/dev/null
	popd
}
fc-list | grep 'Hack:s' >/dev/null || install_hack

# restart i3 with new settings
echo "Restarting i3 with new configuration..."
i3-msg reload >/dev/null
i3-msg restart >/dev/null

echo "Done!"

