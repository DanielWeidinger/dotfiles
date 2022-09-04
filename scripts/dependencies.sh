#!/bin/bash

if ! [ "$EUID" -ne 0 ]
  then echo "Do not run as root"
  exit
fi

sudo pacman -S reflector --noconfirm
reflector -c Austria -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syuu --noconfirm
sudo pacman -Syyu --noconfirm


GRAPHICAL_INTERFACE="wayland kanshi sway waybar xorg-xlsclients swaybg swaylock"
sudo pacman -S $GRAPHICAL_INTERFACE --noconfirm

DRIVERS="pipewire pipewire-alsa pipewire-jack pipewire-pulse bluez-utils alsa-firmware"
sudo pacman -S $DRIVERS --noconfirm

BASE_DEPS="networkmanager zsh git curl go npm ninja stow jq ripgrep docker"
sudo pacman -S $BASE_DEPS --noconfirm

GUI_DEPS="wofi feh alacritty firefox chromium"
sudo pacman -S $GUI_DEPS --noconfirm

# Start services
sudo systemctl enable --now NetworkManager.service

# Install yay
if ! command -v yay &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

MISC_UTIL_DEPS="dunst light pamixer pavucontrol playerctl grim slurp trash-cli brightnessctl"
yay -S $MISC_UTIL_DEPS --noconfirm

AUX_DEPS="lazygit lazydocker anki-official-binary-bundle wlsunset"
yay -S $AUX_DEPS --noconfirm

rm $HOME/.bashrc
mkdir $HOME/.config
mkdir $HOME/.local
mkdir $HOME/.local/.bin
stow stow

# OhMyZsh
if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

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

# Install grimshot for screenshoting
curl https://raw.githubusercontent.com/swaywm/sway/master/contrib/grimshot > /tmp/grimshot
sudo mv /tmp/grimshot /usr/bin
sudo chmod +x /usr/bin/grimshot

# Install fonts
echo "Install fonts(takes a long time)"
zsh ./fonts.sh
