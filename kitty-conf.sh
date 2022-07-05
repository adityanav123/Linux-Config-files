#!/bin/bash -e

echo "Kitty Config"

if [[ $(command -v kitty) ]]; then
	:
else
	echo "Install Kitty first"
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

### CREATING KITTY CONFIGURATION FOLDER
if [ ! -d "~/.config/kitty/" ]
then
	mkdir ~/.config/kitty/
	if [ ! -d "~/.config/kitty/kitty-themes" ]
	then
		cp -r ./kitty-conf-files/kitty.conf ~/.config/kitty/
	fi
	# DOWNLOADING KITTY THEMES
	git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
fi

echo "KITTY_THEME : Earth Song"
if [ ! -f "~/.config/kitty/earthsong.conf" ]
then
	ln -s ~/.config/kitty/kitty-themes/Earthsong.conf ~/.config/kitty/earthsong-config.conf
	echo "include ./earthsong-config.conf" >> ~/.config/kitty/kitty.conf
fi

if [ ! -d "/usr/share/fonts/Monofur" ]
then
	echo "Installing Monofur Nerd font"
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip
	sudo mkdir /usr/share/fonts/Monofur
	sudo unzip ./Monofur.zip -d /usr/share/fonts/Monofur
fi

echo "UPDATING FONT CACHE"
fc-cache -f -v

rm -rf ./Monofur.zip

echo "DONE.."


