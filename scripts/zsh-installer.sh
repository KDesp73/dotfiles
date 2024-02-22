#!/bin/bash



if ! command -v apt > /dev/null 2>&1; then
    sudo apt install -y zsh
fi

if ! command -v pamac > /dev/null 2>&1; then
    sudo pamac install zsh
fi
chsh -s "$(which zsh)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo_installed "oh-my-zsh"
    rm "$HOME/.zshrc" # Because we will install our own
    rm "$HOME/.zshrc.pre-oh-my-zsh"
    exit
else 
    echo_already_installed "oh-my-zsh"
fi
