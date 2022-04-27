# cd on quit
export NNN_PLUG="p:preview-tui;"


if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

alias nnn "nnn -e"

set --export NNN_FIFO "/tmp/nnn.fifo"

