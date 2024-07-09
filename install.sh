#!/bin/sh

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)


LOG () {
    echo "[$1] $2"
}
INFO () {
    LOG "INFO" "$1"
}
ERRO () {
    LOG "ERRO" "$1"
}
WARN () {
    LOG "WARN" "$1"
}
DEBU () {
    LOG "DEBU" "$1"
}

echo_installed() {
    INFO "$1 installed successfully"
}

echo_failed() {
    ERRO "Failed to install $1"
}

echo_already_installed() {
    INFO "$1 is already installed"
}

link(){
    if [ -e "$1/$2" ]; then
        ERRO "$2 already exists"
    else
        ln -s "$SCRIPT_DIR/$2" "$1/$2"
        INFO "Linked $2"
    fi
}

link_home(){
    link "$HOME" $1
}

link_config(){
    link "$HOME/.config" $1
}

if [ "$1" = "clean" ]; then
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
    exit 0
fi

if [ "$1" = "apps" ]; then
    ./scripts/apps-installer.sh
    exit 0
fi

# Symlink dotfiles
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

exit 0
