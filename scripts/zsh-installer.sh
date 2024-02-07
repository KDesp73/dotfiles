#!/bin/bash



sudo apt install zsh -y
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
