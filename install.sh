#!/bin/env zsh


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


ln -s "$SCRIPT_DIR/.zshrc" ~/.zshrc
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim
ln -s "$SCRIPT_DIR/tmux" ~/.config/tmux

echo "Configs installed successfully" 
exit 0
