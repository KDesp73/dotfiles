#!/bin/bash

source ./utils/system.sh
source ./neovim-installer.sh
source ./rofi-installer.sh
source ./tmux-installer.sh
source ./zsh-installer.sh

deps() {
    install git
    install make
    install cmake
    install fonts-powerline
    install go
}

apps() {
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


while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --deps)
            deps
            exit 0
            ;;
        --apps)
            apps
            exit 0
            ;;
        --all|*)
            deps
            apps
            shift
            ;;
    esac
done

exit 0
