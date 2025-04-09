#!/bin/bash
TPM_HOME="$HOME/.config/tmux/plugins/tpm"

if [ ! -d "$TPM_HOME" ];then
    mkdir -p "$TPM_HOME"
    git clone https://github.com/tmux-plugins/tpm "$TPM_HOME"
fi
