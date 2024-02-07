#!/bin/sh

if [ ! -d "$HOME/.fonts" ]; then
    mkdir -p "$HOME/.fonts"
fi

cp .fonts/* "$HOME/.fonts"
