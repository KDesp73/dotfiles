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

if ! command -v apt > /dev/null 2>&1; then
    WARN "apt not found. Please install: git, fonts-powerline, zsh, tmux manually"
    exit 1
fi


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
    sudo apt autoremove

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

    # Check if zsh is installed
    if command -v zsh > /dev/null 2>&1; then
        echo_already_installed "zsh"
    else
        sudo apt install zsh -y
        echo_installed "zsh" 
        chsh -s "$(command -v zsh)" "$USER"
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
        # Prerequisites
        sudo apt-get install ninja-build gettext cmake unzip curl

        git clone https://github.com/neovim/neovim "$HOME/neovim"
        cd "$HOME/neovim" || exit 1
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        git checkout stable
        rm -r build/  # clear the CMake cache
        make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
        make install
        export PATH="$HOME/neovim/bin:$PATH"

        echo_installed "neovim"
    fi

    # Install tmux
    if command -v tmux > /dev/null 2>&1; then
        echo_already_installed "tmux"
    else
        sudo apt install -y tmux
        echo_installed "tmux"
    fi

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo_installed "oh-my-zsh"
        rm "$HOME/.zshrc" # Because we will install our own
        rm "$HOME/.zshrc.pre-oh-my-zsh"
        exit
    else 
        echo_already_installed "oh-my-zsh"
    fi

    cd "$SCRIPT_DIR" || exit 1
fi

DEBU "script directory: $SCRIPT_DIR"

# Symlink dotfiles
[ -e "$HOME/.zshrc" ] || ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
[ -e "$HOME/.config/nvim" ] || ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
[ -e "$HOME/.config/tmux" ] || ln -s "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"

# Things to do after installing the dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://git::@github.com/tmux-plugins/tmux-sensible ~/.config/tmux/plugins/tmux-sensible
git clone https://git::@github.com/tmux-plugins/tmux-yank ~/.config/tmux/plugins/tmux-yank
git clone https://git::@github.com/christoomey/vim-tmux-navigator ~/.config/tmux/plugins/vim-tmux-navigator
git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catpuccin-tmux

exit 0
