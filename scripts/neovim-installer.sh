#!/usr/bin/env bash

source "$BASE_DIR"/lib/logging.sh
source "$BASE_DIR"/lib/packages.sh

deps=(
    ninja
    ninja-build 
    gettext
    make
    cmake 
    unzip 
    curl
)
install_packages deps

# Install neovim
git clone https://github.com/neovim/neovim "$HOME/neovim"
cd "$HOME/neovim" || exit 1
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX="$HOME/neovim"
rm -r build/  # clear the CMake cache
sudo make install
export PATH="$HOME/neovim/bin:$PATH"

# Install packer
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    echo_installed "packer.nvim"
fi

echo_installed "nvim"
