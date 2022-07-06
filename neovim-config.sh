#!/bin/bash

echo "neo-vim configuration setup."


if [[ $(command -v nvim) ]]; then
	:
else
	echo "Install NeoVim first"
	exit
fi

if [[ $(command -v git) ]]; then
	:
else
	echo "Git not installed, Please Install git"
	exit
fi


if [[ $(command -v wget) ]]; then
	:
else
	echo "wget not installed, install wget"
	exit
fi

if [[ $(command -v curl) ]]; then
	:
else
	echo "curl not installed, install curl"
	exit
fi


if [ ! -d "~/.config/nvim/" ]
then
	mkdir ~/.config/nvim/

    # Copying the config files.
	cp -r ./Neovim-Config-Files/init.vim ~/.config/nvim/
fi


# vim plug
if [ ! -d "~/.config/nvim/plugged" ]
then
    mkdir ~/.config/nvim/plugged/
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim +PlugInstall
fi

# CoC config
echo "Installing. CoC for NeoVim?. (autocomplete, autocorrect in programs) (Y/N)"
if [[ $(command -v node) && $(command -v npm) ]]
then
    :
else
    echo "Install nodejs and npm first. Rest Configurations, will be saved."
    exit
fi

    sudo npm i -g yarn
    curr=$pwd
    cd ~/.config/nvim/plugged/coc.nvim/
    yarn install
    yarn build
    echo "coc set up ; can install language servers now."
    cd $curr

echo "done.."
echo "neovim config file : @ : ~/.config/nvim/init.vim"
