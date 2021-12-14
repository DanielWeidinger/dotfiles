#!/bin/sh

echo "-- Setup"
sudo apt-get update -y
sudo apt-get upgrade
sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl ripgrep golang-go
sudo apt-get -y install libx11-dev libxext-dev
#TODO: Move golang-go to global dependencies and add to path

echo "-- Setup -- NodeJs"
cd ~ 
curl -sL https://deb.nodesource.com/setup_14.x -o ~/Downloads/nodesource_setup.sh
chmod +x ~/Downloads/nodesource_setup.sh
sudo ~/Downloads/nodesource_setup.sh
rm ~/Downloads/nodesource_setup.sh
sudo apt-get install -y nodejs
sudo npm install -g neovim

echo "-- Setup -- Python"
sudo apt install -y python-is-python3 python3-pip
pip install neovim

echo "-- Setup -- lazygit"
sudo add-apt-repository ppa:lazygit-team/release -y
sudo apt-get update
sudo apt-get install -y lazygit

echo "-- Setup -- datasci utils"
