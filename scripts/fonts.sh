#!/bin/bash

FONT_PATH="/tmp"
cd $FONT_PATH

echo NERD font
echo --Downloading...
if [ -d "nerd-fonts" ]; then
	rm -rf nerd-fonts
fi
mkdir nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts nerd-fonts

echo --Installing...
cd nerd-fonts
font="SourceCodePro"
chmod +x install.sh
./install $font
