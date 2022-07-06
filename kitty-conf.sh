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
	cp -r ./kitty-conf-files/kitty.conf ~/.config/kitty/
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
echo "For Choosing Kitty Themes : Command = {kitty +kitten themes} --> then choose the theme"


