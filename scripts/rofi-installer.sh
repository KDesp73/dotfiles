#!/usr/bin/env bash

cd "$HOME" || exit 1

git clone https://github.com/davatorium/rofi.git

if ! meson setup build; then
    exit 1
fi

ninja -C build install

echo_installed "rofi"
