#!/bin/bash
TPM_HOME="$HOME/.config/tmux/plugins/"

if [ ! -d "$TPM_HOME" ];then
    mkdir -p "$(dirname $TPM_HOME)"
    git clone https://github.com/tmux-plugins/tpm
fi
