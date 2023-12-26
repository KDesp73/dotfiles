#!/bin/env zsh


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


[[ -e "~/.zshrc" ]] || ln -s "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
[[ -e "~/.config/nvim" ]] || ln -s "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
[[ -e "~/.config/tmux" ]] || ln -s "$SCRIPT_DIR/tmux" "$HOME/.config/tmux"

exit 0
