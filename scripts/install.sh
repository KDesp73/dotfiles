#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

source ./scripts/utils/logging.sh

link(){
    if [ -e "$1/$2" ]; then
        ERRO "$2 already exists"
    else
        ln -s "$SCRIPT_DIR/$2" "$1/$2"
        INFO "Linked $2"
    fi
}

link_home(){
    link "$HOME" "$1"
}

link_config(){
    link "$HOME/.config" "$1"
}

clean (){
    rm -rf "$HOME/fzf"
    rm -rf "$HOME/.oh-my-zsh"
    rm -rf "$HOME/.zshrc"
    rm -rf "$HOME/.gitconfig"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.config/tmux"
    rm -rf "$HOME/.config/hypr"
    rm -rf "$HOME/.config/rofi"
    rm -rf "$HOME/.config/kitty"
    rm -rf "$HOME/.config/waybar"
    rm -rf "$HOME/.config/dunst"

    INFO "Cleaned"
}


# Symlink dotfiles
link_all() {
    link_home ".zshrc"
    link_home ".gitconfig"
    link_home ".gdbinit"
    link_config "nvim"
    link_config "tmux"
    link_config "hypr"
    link_config "rofi"
    link_config "kitty"
    link_config "waybar"
    link_config "dunst"
}


while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        --clean)
            clean
            exit 0
            ;;
        --apps)
            apps
            exit 0
            ;;
        --link)
            link_all
            exit 0
            ;;
        --all|*)
            apps
            link_all
            shift
            ;;
    esac
done

exit 0
