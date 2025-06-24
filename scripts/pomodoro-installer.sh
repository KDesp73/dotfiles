#!/usr/bin/env bash

git clone --depth=1 https://github.com/KDesp73/Cli-Pomodoro "$HOME/pomodoro"

cd "$HOME/pomodoro" || exit 1

./install.sh
