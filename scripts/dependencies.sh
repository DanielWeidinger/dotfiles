#!/bin/bash

if ! [ "$EUID" -ne 0 ]
  then echo "Do not run as root"
  exit
fi

sudo pacman -S reflector --noconfirm
reflector -c Austria -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syuu
sudo pacman -Syyu
GRAPHICAL_INTERFACE="wayland sway waybar xorg-xlsclients"
sudo pacman -S $GRAPHICAL_INTERFACE --noconfirm
DRIVERS="pipewire pipewire-alsa pipewire-jack bluez-utils alsa-firmware"
sudo pacman -S $DRIVERS --noconfirm
BASE_DEPS="zsh gdm wofi feh kanshi alacritty git curl neovim go npm ninja firefox stow"
sudo pacman -S $BASE_DEPS --noconfirm

# Start services
sudo systemctl enable gdm

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

AUX_DEPS="lazygit lazydocker anki-official-binary-bundle wlsunset"
yay -S $AUX_DEPS --noconfirm

rm $HOME/.bashrc
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

# Install fonts
echo "Install fonts(takes a long time)"
zsh ./fonts.sh

# Install grimshot for screenshoting
curl https://raw.githubusercontent.com/swaywm/sway/master/contrib/grimshot > /tmp/grimshot
sudo mv /tmp/grimshot /usr/bin
sudo chmod +x /usr/bin/grimshot

