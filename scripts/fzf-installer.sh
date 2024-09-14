#!/usr/bin/env bash

source "$BASE_DIR"/lib/logging.sh

if [ ! -d "$HOME/fzf" ]; then
    git clone https://github.com/junegunn/fzf.git "$HOME/fzf"
    cd "$HOME/fzf" && ./install

    echo_installed "fzf"
    cd "$SCRIPT_DIR" || exit 1
fi

