#!/bin/bash

FONT_PATH="/tmp/fonts"

echo NERD font
echo --Downloading...
git clone https://github.com/ryanoasis/nerd-fonts $FONT_PATH

echo --Installing...
font="SourceCodePro"
cd $FONT_PATH
chmod +x install.sh 
./install $font
