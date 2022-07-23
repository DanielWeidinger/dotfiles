#!/bin/bash

pacman -Syuu
BASE_DEPS="git curl zsh neovim"

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

AUX_DEPS="lazygit lazydocker"


# OhMyZsh
if ![ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

