#!/bin/bash -e

echo "Kitty Config"

if [[ $(command -v git) ]]; then
	:
else
	echo "Git not installed, Please Install git"
	exit
fi


