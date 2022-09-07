#!/bin/sh

echo "-- packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "-- npm"
sudo npm install -g neovim
sudo npm install -g commitizen
echo "-- pip"
pip install neovim

