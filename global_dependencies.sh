#!/bin/sh

echo installing zsh...
sudo apt install -y zsh
sudo chsh -s /usr/bin/zsh daniel
echo !!!!!!!!!!!!!!!!! dont forget to restart !!!!!!!!!!!!!!!!!

echo installing oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

