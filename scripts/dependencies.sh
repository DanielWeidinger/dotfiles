#!/bin/bash

if ! [ "$EUID" -ne 0 ]
  then echo "Do not run as root"
  exit
fi

sudo pacman -Syuu
BASE_DEPS="wayland sway waybar gnome wofi feh kanshi wlsunset alacritty git curl zsh neovim go npm ninja firefox pipewire pipewire-alsa pipewire-jack"
sudo pacman -S $BASE_DEPS --noconfirm

# Install yay
if ! command -v yay &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

UTILS_DEPS="dunst light pamixer pavucontrol playerctl grim slurp"
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
conda config --set auto_activate_base false

# nvim deps
zsh ~/.dotfiles/stow/.config/nvim/scripts/dependencies.sh
# Install nvim lsp
./stow/.config/nvim/scripts/lsp_setup.sh

# Install fonts
echo "Install fonts(takes a long time)"
zsh ./fonts.sh

# Install grimshot for screenshoting
curl https://raw.githubusercontent.com/swaywm/sway/master/contrib/grimshot > /tmp/grimshot
sudo mv /tmp/grimshot /usr/bin
sudo chmod +x /usr/bin/grimshot

