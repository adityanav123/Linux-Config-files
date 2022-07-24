#!/bin/bash

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
	cp -r ./kitty-config-files/kitty.conf ~/.config/kitty/
fi


# NERD FONTS INSTALL
echo "Install Nerd Fonts? : (y/N) (Monofur Nerd Font family will be installed)"

read install_nerd_font

if [[ "$install_nerd_font" == "Y" || "$install_nerd_font" == "y" ]]
then

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
fi

echo "For Choosing Kitty Themes : Command = {kitty +kitten themes} --> then choose the theme ( req : kitty version >= 25)"


