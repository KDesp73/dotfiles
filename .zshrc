########################################
# Oh-My-Zsh
########################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"

plugins=(
    git
    fzf
)

########################################
# Editor (local vs SSH)
########################################
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

########################################
# FZF
########################################
export FZF_BASE="$HOME/fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

########################################
# Android SDK
########################################
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/build-tools/26.0.0-preview"
export PATH="$PATH:$HOME/.var/app/com.google.AndroidStudio/config/.android/avd"

########################################
# General Environment
########################################
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export dotfiles="$HOME/dotfiles"
export repos="$HOME/personal/repos"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

########################################
# SDKs / Java / GCC / Libraries
########################################
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# LD paths (ordered once)
export LD_LIBRARY_PATH="$HOME/.sdkman/candidates/java/23.ea.8-open/lib"
export LD_LIBRARY_PATH="/opt/gcc-14.1.0/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/lib:$LD_LIBRARY_PATH"

########################################
# PATH
########################################
# Add custom paths (clean and non-duplicate)
export PATH="$PATH:$HOME/.config/herd-lite/bin"
export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/c3-linux"
export PATH="$PATH:$HOME/idea-IC-242.23726.103/bin"
export PATH="$PATH:/opt/gcc-14.1.0/bin"
export PATH="$PATH:$HOME/Applications/Discord"
export PATH="$PATH:$HOME/Applications"
export PATH="$PATH:$repos/bash/scripts"
export PATH="$PATH:$repos/cpp/Stockfish/src"
export PATH="$PATH:$repos/cpp/others/Stockfish/src"

########################################
# Aliases
########################################
alias copy="xclip -sel clip"
alias astudio="nohup /usr/local/android-studio/bin/studio.sh &"
alias attach="tmux attach-session -t"
alias cl="changelogger"
alias emacs="emacs -nw"
alias emulator="$ANDROID_HOME/emulator/emulator"
alias exti=exit
alias ezit=exit
alias ezti=exit
alias fzf="fzf --preview 'cat {1}'"
alias get_idf=". $HOME/esp/esp-idf/export.sh"
alias gitlog="git log --oneline | fzf --preview 'git show --name-only {1}'"
alias gut=git
alias hide_cursor="echo \"\e[?25l\""
alias iofetch="bash <(curl -s https://raw.githubusercontent.com/KDesp73/IncludeOnly/refs/heads/main/scripts/installer.sh)"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias nf='nv $(fzf)'
alias nv=nvim
alias open="xdg-open"
alias pgconnect="psql -U iee2021035 -h dblabs.iee.ihu.gr -W -d iee2021035"
alias python=python3
alias show_cursor="echo \"\e[?25h\""
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias todo="rlwrap todo"
alias musicsync="rsync -avz --delete --exclude='*.lrc' $HOME/Music void@192.168.1.25:/home/void/"

########################################
# Custom Tools / Scripts
########################################
export dotfiles="$HOME/dotfiles"
export repos="$HOME/personal/repos"

########################################
# Secrets / Profiles
########################################
source "$HOME/.secrets"
. "$HOME/.turso/env"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

########################################
# Misc
########################################
export $(/usr/bin/dbus-launch)
wcli --location Thessaloniki

########################################
# Load Oh-My-Zsh
########################################
source $ZSH/oh-my-zsh.sh

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"

alias ls=lsd

# opencode
export PATH=/home/kdesp73/.opencode/bin:$PATH
