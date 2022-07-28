#!/bin/bash

pacman -Syuu
BASE_DEPS="wayland sway waybar gnome wofi feh kanshi wlsunset alacritty git curl zsh neovim go npm ninja firefox"
yay -S $BASE_DEPS --noconfirm

# Install yay
if ! command -v yay &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

UTILS_DEPS="dunst light pamixer pavucontrol playerctl"
yay -S $UTILS_DEPS --noconfirm

AUX_DEPS="lazygit lazydocker anki-official-binary-bundle"
yay -S $AUX_DEPS --noconfirm


# OhMyZsh
if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# miniconda/python 
INSTALL_SCRIPT_PATH="/tmp/install_minionda.sh"
curl https://repo.anaconda.com/miniconda/Miniconda3-py37_4.12.0-Linux-x86_64.sh > $INSTALL_SCRIPT_PATH
chmod +x $INSTALL_SCRIPT_PATH
zsh $INSTALL_SCRIPT_PATH

# nvim deps
zsh ~/.dotfiles/stow/.config/nvim/scripts/dependencies.sh
# Install nvim lsp
./stow/.config/nvim/scripts/lsp_setup.sh

# Install fonts
echo "Install fonts(takes a long time)"
zsh ./fonts.sh
