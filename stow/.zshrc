if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
setopt globdots # include hidden files

### User configuration
## aliases
alias luamake=$HOME/.vim/lua-language-server/3rd/luamake/luamake
alias rrm='rm'
alias rm='trash'
alias gcal='gcalcli --default-calendar=daniw2801@gmail.com'

## PATH
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/.cargo/bin

## Plugins

# nnn config
source ~/.config/nnn/nnnrc.sh

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Android SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# Flutter executeables
export PATH="$PATH":"$HOME/.pub-cache/bin"   


export EDITOR=nvim # to be able use sudoedit for write-protected files

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Standard pip binaries
export PATH="$PATH:$HOME/.local/bin/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# SSH-Agent with systemd
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

