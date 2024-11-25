# Location for history file
HISTFILE=/home/krsh/.cache/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -v

# prompt customization
PS1='%F{green}%~
%F{blue} ' 

# Load auto completion
autoload -Uz compinit
compinit

# list the file/dir completion with colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# list the completion with hightlighting
zstyle ':completion:*' menu select


# Load zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls='ls --color'
alias cat='bat'
