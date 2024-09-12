#!/usr/bin/env bash

source ./utils/system.sh
source ./utils/logging.sh

tmux_installer() {
    install tmux

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    [ -e "$HOME/.config/tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/
    [ -e "$HOME/.config/tmux/plugins/tmux-sensible" ] || git clone https://git::@github.com/tmux-plugins/tmux-sensible ~/.config/tmux/plugins/
    [ -e "$HOME/.config/tmux/plugins/tmux-yank" ] || git clone https://git::@github.com/tmux-plugins/tmux-yank ~/.config/tmux/plugins/
    [ -e "$HOME/.config/tmux/plugins/vim-tmux-navigator" ] || git clone https://git::@github.com/christoomey/vim-tmux-navigator ~/.config/tmux/plugins/
    [ -e "$HOME/.config/tmux/plugins/catpuccin-tmux" ] || git clone https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/
}
