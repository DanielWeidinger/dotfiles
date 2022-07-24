#!/bin/sh

echo NERD font
echo --Downloading...
git clone https://github.com/ryanoasis/nerd-fonts

echo --Installing...
font="SourceCodePro"
cd nerd-fonts
chmod +x install.sh 
./install $font
