#!/bin/bash

source ./scripts/utils/system.sh
source ./scripts/neovim-installer.sh
source ./scripts/rofi-installer.sh
source ./scripts/tmux-installer.sh
source ./scripts/zsh-installer.sh

apps() {
    get_package git
    get_package make
    get_package cmake
    get_package fonts-powerline
    get_package go
    get_package vim

    if [ ! -d "$HOME/fzf" ]; then
        git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
        cd "$HOME/fzf" && ./install

        echo_installed "fzf"
        cd "$SCRIPT_DIR" || exit 1
    fi

    if command -v nvim > /dev/null 2>&1; then
        echo_already_installed "neovim"
    else
        neovim_installer
        echo_installed "neovim"
    fi

    if command -v tmux > /dev/null 2>&1; then
        echo_already_installed "tmux"
    else
        tmux_installer
        echo_installed "tmux"
    fi

    if command -v zsh > /dev/null 2>&1; then
        echo_already_installed "zsh"
    else
        zsh_installer
        echo_installed "zsh" 
    fi
}


if [ -x "$0" ]; then
    apps
fi
