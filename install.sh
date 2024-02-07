#!/bin/sh

if ! command -v apt > /dev/null 2>&1; then
    printf "[WARN] apt not found. Please install:\n- git\n- fonts-powerline\n- zsh\n- tmux\n\n manually\n"
    exit 1
fi


if [ "$1" = "clean" ]; then
    
fi

if [ "$1" = "apps" ]; then
    # Check if git is installed
    if ! command -v git > /dev/null 2>&1; then
        sudo apt install -y git
        echo "[INFO] git is installed successfully"
    fi

    if ! command -v make > /dev/null 2>&1; then
        sudo apt install -y make
        echo "[INFO] make is installed successfully"
    fi

    # Install powerline fonts
    sudo apt install -y fonts-powerline
    if [ $? -ne 1 ]; then
        echo "[INFO] fonts-powerline installed successfully"
    else
        echo "[ERRO] Failed to install fonts-powerline"
    fi

    # Check if zsh is installed
    if command -v zsh > /dev/null 2>&1; then
        echo "zsh is already installed"
    else
        sudo apt install zsh -y
        chsh -s "$(command -v zsh)" "$USER"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "[INFO] zsh installed successfully"
    fi


    # Install go for fzf
    sudo apt install golang-go 

    # Install fzf
    if [ ! -d "$HOME/fzf" ]; then
        git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
        cd "$HOME/fzf" && ./install

        echo "[INFO] fzf installed successfully"
    fi

    # Install packer
    if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
        git clone --depth 1 https://github.com/wbthomason/packer.nvim \
            "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    fi

    # Install Neovim
    if command -v nvim > /dev/null 2>&1; then
        echo "Neovim is already installed."
    else
        git clone https://github.com/neovim/neovim "$HOME/neovim"
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
        git checkout stable
        sudo make install
    fi

    # Install tmux
    if command -v tmux > /dev/null 2>&1; then
        echo "tmux is already installed."
    else
        sudo apt install -y tmux
    fi
fi

# Symlink dotfiles
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

[ -e "$HOME/.zshrc" ] || ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
[ -e "$HOME/.config/nvim" ] || ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
[ -e "$HOME/.config/tmux" ] || ln -s "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"

exit 0

