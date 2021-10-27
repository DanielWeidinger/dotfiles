#!/bin/zsh
df_dir=$HOME/dotfiles
if ! [ -d "$df_dir" ]; then
    echo creating $df_dir
    mkdir "$df_dir"
fi

git init --bare $df_dir
source $HOME/.zshrc

if ! command -v config &> /dev/null
then
    echo config command not found, adding it...
    echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
fi

source $HOME/.zshrc
config config --local status.showUntrackedFiles no
config remote add origin git@github.com:DanielWeidinger/dotfiles.git
config pull origin master

