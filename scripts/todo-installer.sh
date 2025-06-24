#!/usr/bin/env bash

git clone --depth=1 https://github.com/KDesp73/terminal-todo "$HOME/todo"

cd "$HOME/todo" || exit 1

./install.sh
