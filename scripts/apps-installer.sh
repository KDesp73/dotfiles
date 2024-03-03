#!/bin/bash


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
    sh ./neovim-installer.sh
    echo_installed "neovim"
fi

# Install tmux
if command -v tmux > /dev/null 2>&1; then
    echo_already_installed "tmux"
else
    sh ./tmux-installer.sh
    echo_installed "tmux"
fi

# Install zsh
if command -v zsh > /dev/null 2>&1; then
    echo_already_installed "zsh"
else
    sh ./zsh-installer.zsh
    echo_installed "zsh" 
fi

exit 0
