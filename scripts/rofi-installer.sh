#!/usr/bin/env bash

source "$BASE_DIR"/lib/logging.sh
source "$BASE_DIR"/lib/packages.sh

deps=(
    ninja
    meson
    git
)
install_packages deps

cd "$HOME" || exit 1

git clone https://github.com/davatorium/rofi.git

if ! meson setup build; then
    exit 1
fi

ninja -C build install

echo_installed "rofi"
