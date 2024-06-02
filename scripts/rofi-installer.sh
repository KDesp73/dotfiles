#!/usr/bin/env bash


cd $HOME

git clone https://github.com/davatorium/rofi.git

meson setup build

if [ $? -ne 0 ]; then
    exit 1
fi


ninja -C build install
