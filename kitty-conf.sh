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

mkdir ~/.config/kitty/
cp -r ./kitty-config-files/* ~/.config/kitty/
current_path=$(pwd)

cd .config/kitty/

echo "Choosing Earth Song theme."
ln -s ./kitty-themes/Earthsong.conf ~/.config/kitty/earthsong.conf"

cd $current_path
echo "Installing Monofur Nerd font"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip

sudo mkdir /usr/share/fonts/Monofur
sudo unzip ./Monofur.zip -d /usr/share/fonts/Monofur
fc-cache -f -v

rm -rf ./Monofur.zip

echo "DONE.."


