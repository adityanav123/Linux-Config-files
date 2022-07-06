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
    if [ ! -f "~/.config/nvim/init.vim" ]
    then
	    cp -r ./Neovim-Config-Files/init.vim ~/.config/nvim/
    else
        echo "Config Files Exist!, Override? (y/N)"
        read override_choice
        if [[ "$override_choice" -eq "y" || "$override_choice" -eq "Y" ]]
        then
            echo "Overriding.."
            cp -r ./Neovim-Config-Files/init.vim ~/.config/nvim/
        fi
    fi
fi


# vim plug
if [ ! -d "~/.config/nvim/plugged" ]
then
    mkdir ~/.config/nvim/plugged/
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim +PlugInstall
fi

# CoC config
echo "Install CoC for NeoVim?. (autocomplete, autocorrect in programs) (Y/N)"
read choice

if [[ "$choice" -eq "Y" || "$choice" -eq "y" ]]
then
    if [[ $(command -v node) && $(command -v npm) ]]
    then
        :
    else
        echo "Install nodejs and npm first. Rest Configurations, will be saved."
        exit
    fi

    npm i -g yarn
    curr=$pwd
    cd ~/.config/nvim/plugged/coc.nvim/
    yarn install
    yarn build
    echo "coc set up ; can install language servers now."
fi
echo "done.."

