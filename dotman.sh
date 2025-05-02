#!/usr/bin/bash

export BASE_DIR
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source lib/paths.sh
source lib/links.sh
source lib/execute.sh

##################################################
#                                                #  
#  [dotman.sh] - v0.0.1                          #  
#                                                #  
#        The declarative dotfiles manager        #  
#                                                #  
#                                                #  
#                               Made by KDesp73  #  
#                                                #  
##################################################

##################################################
#                                                #  
#  Structure:                                    #  
#                                                #  
#  dotfiles/                                     #  
#          |--lib/ # The library files           #  
#          |                                     #  
#          |--scripts/ # Your custom scripts     #  
#          |                                     #  
#          |--dotman.sh # The entry point        #  
#          |                                     #  
#          |--<all your dotfiles>                #  
#                                                #  
##################################################

# VVV Edit below VVV

pkgs=(
    zsh
    make
    kitty
    cmake
    swaylock-effects
    swaybg
    swayidle
    emacs
    fuzzel
    waybar
)

scripts=(@) # Run all

links[".emacs"]="$HOME"
links[".emacs.d"]="$HOME"
links[".zshrc"]="$HOME"
links["git"]="$CONFIG"
links[".gdbinit"]="$HOME"
links["gf2_config.ini"]="$CONFIG"
links["nvim"]="$CONFIG"
links[".changelogger.yml"]="$CONFIG"
links["tmux"]="$CONFIG"
links["hypr"]="$CONFIG"
links["rofi"]="$CONFIG"
links["kitty"]="$CONFIG"
links["waybar"]="$CONFIG"
links["dunst"]="$CONFIG"
links["ghostty"]="$CONFIG"
links["sway"]="$CONFIG"
links["fuzzel"]="$CONFIG"

execute pkgs scripts links "$@"
