#!/bin/sh

echo Installing Power font
sudo apt-get install fonts-powerline

echo NERD font
font="SourceCodePro"
echo --Downloading...
git clone https://github.com/ryanoasis/nerd-fonts

echo --Installing...
cd nerd-fonts
chmod +x install.sh $font
