#!/bin/sh

# Check if git is installed
if ! command -v git > /dev/null 2>&1; then
    sudo apt install -y git
fi

# Install powerline fonts
sudo apt install -y fonts-powerline


# Check if zsh is installed
if command -v zsh > /dev/null 2>&1; then
    echo "zsh is already installed."
else
    sudo apt install zsh -y
    chsh -s "$(command -v zsh)" "$USER"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "You should logout"
fi

# Install fzf
if [ ! -d "$HOME/fzf" ]; then
    git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
    cd "$HOME/fzf" && ./install
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

# # Install the latest version of Neovim (for Ubuntu)
# nvim +PlugInstall +qall

# Install tmux
if command -v tmux > /dev/null 2>&1; then
    echo "tmux is already installed."
else
    sudo apt install -y tmux
fi

# Symlink dotfiles
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

[ -e "$HOME/.zshrc" ] || ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
[ -e "$HOME/.config/nvim" ] || ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
[ -e "$HOME/.config/tmux" ] || ln -s "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"

exit 0

