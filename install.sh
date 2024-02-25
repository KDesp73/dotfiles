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


# if ! command -v apt > /dev/null 2>&1; then
#     WARN "apt not found. Please install: git, fonts-powerline, zsh, tmux manually"
#     exit 1
# fi


if [ "$1" = "clean" ]; then
    rm -rf "$HOME/fzf"
    rm -rf "$HOME/.zshrc"
    rm -rf "$HOME/.oh-my-zsh"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.config/tmux"
    rm -rf "$HOME/neovim"
    sudo apt remove nvim -y
    sudo apt remove tmux -y
    sudo apt remove -y fonts-powerline
    sudo apt autoremove -y

    INFO "Cleaned"
    exit 0
fi

if [ "$1" = "apps" ]; then
    # Check if git is installed
    if ! command -v git > /dev/null 2>&1; then
        sudo apt install -y git
        echo_installed "git"
    fi

    if ! command -v make > /dev/null 2>&1; then
        sudo apt install -y make
        echo_installed "make"
    fi

    if ! command -v cmake > /dev/null 2>&1; then
        sudo apt install -y cmake
        echo_installed "cmake"
    fi

    # Install powerline fonts
    sudo apt install -y fonts-powerline
    if [ $? -ne 1 ]; then
        echo_installed "fonts-powerline"
    else
        echo_failed "fonts-powerline"
    fi


    # Install go for fzf
    sudo apt install -y golang-go 
    if [ $? -ne 1 ]; then
        echo_installed "go"
    else
        echo_failed "go"
    fi

    # Install fzf
    if [ ! -d "$HOME/fzf" ]; then
        git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
        cd "$HOME/fzf" && ./install

        echo_installed "fzf"
        cd "$SCRIPT_DIR" || exit 1
    fi

    # Install Neovim
    if command -v nvim > /dev/null 2>&1; then
        echo_already_installed "neovim"
    else
        sh ./scripts/neovim-installer.sh
        echo_installed "neovim"
    fi

    # Install tmux
    if command -v tmux > /dev/null 2>&1; then
        echo_already_installed "tmux"
    else
        sh ./scripts/tmux-installer.sh
        echo_installed "tmux"
    fi

    # Install zsh
    if command -v zsh > /dev/null 2>&1; then
        echo_already_installed "zsh"
    else
        sh ./scripts/zsh-installer.zsh
        echo_installed "zsh" 
    fi

    cd "$SCRIPT_DIR" || exit 1
fi

# Symlink dotfiles
link_home ".zshrc"
link_home ".gitconfig"
link_config "nvim"
link_config "tmux"
link_config "hypr"
link_config "rofi"
link_config "kitty"
link_config "waybar"
link_config "dunst"

exit 0
