#!/bin/sh

echo Installing Power font
sudo apt-get install fonts-powerline

echo NERD font
echo --Downloading...
git clone https://github.com/ryanoasis/nerd-fonts

echo --Installing...
# font="SourceCodePro"
font="Ubuntu" #TODO: install
cd nerd-fonts
chmod +x install.sh $font
