#!/bin/sh


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

if ! command -v apt > /dev/null 2>&1; then
    WARN "apt not found. Please install: git, fonts-powerline, zsh, tmux manually"
    exit 1
fi


if [ "$1" = "clean" ]; then
    rm -rf "$HOME/.zshrc"
    rm -rf "$HOME/.oh-my-zsh"
    rm -rf "$HOME/.config/nvim"
    rm -rf "$HOME/.config/tmux"
    rm -rf "$HOME/neovim"
    sudo apt remove tmux -y
    sudo apt remove -y fonts-powerline

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

    # Install powerline fonts
    sudo apt install -y fonts-powerline
    if [ $? -ne 1 ]; then
        echo_installed "fonts-powerline"
    else
        echo_failed "fonts-powerline"
    fi

    # Check if zsh is installed
    if command -v zsh > /dev/null 2>&1; then
        echo_already_installed "zsh"
    else
        sudo apt install zsh -y
        echo_installed "zsh" 
        chsh -s "$(command -v zsh)" "$USER"
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo_installed "oh-my-zsh"
    else 
        echo_already_installed "oh-my-zsh"
    fi

    # Install go for fzf
    sudo apt install -y golang-go 
    echo_installed "go"

    # Install fzf
    if [ ! -d "$HOME/fzf" ]; then
        git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
        cd "$HOME/fzf" && ./install

        echo_installed "fzf"
    fi

    # Install packer
    if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
        git clone --depth 1 https://github.com/wbthomason/packer.nvim \
            "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
        echo_installed "packer.nvim"
    fi

    # Install Neovim
    if command -v nvim > /dev/null 2>&1; then
        echo_already_installed "neovim"
    else
        git clone https://github.com/neovim/neovim "$HOME/neovim"
        cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo
        git checkout stable
        sudo make -y install
        echo_installed "neovim"
    fi

    # Install tmux
    if command -v tmux > /dev/null 2>&1; then
        echo_already_installed "tmux"
    else
        sudo apt install -y tmux
        echo_installed "tmux"
    fi

    exit 0
fi

# Symlink dotfiles
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
DEBU "script directory: $SCRIPT_DIR"

[ -e "$HOME/.zshrc" ] || ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
[ -e "$HOME/.config/nvim" ] || ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
[ -e "$HOME/.config/tmux" ] || ln -s "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"

exit 0

