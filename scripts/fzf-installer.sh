#!/usr/bin/env bash

if [ ! -d "$HOME/fzf" ]; then
    git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
    cd "$HOME/fzf" && ./install

    echo "Installed fzf"
    cd "$SCRIPT_DIR" || exit 1
fi

