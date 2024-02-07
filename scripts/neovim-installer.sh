#!/bin/sh



# Prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl

# Install neovim
git clone https://github.com/neovim/neovim "$HOME/neovim"
cd "$HOME/neovim" || exit 1
make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"


# Install packer
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    echo_installed "packer.nvim"
fi

