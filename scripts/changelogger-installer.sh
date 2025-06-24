#!/usr/bin/env bash

git clone https://github.com/KDesp73/changelogger --depth=1 "$HOME/changelogger"

cd "$HOME/changelogger" || exit 1

./install.sh
