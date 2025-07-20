export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME="fwalch"

DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"

plugins=(
    git
    fzf
)

export FZF_BASE="$HOME/fzf"

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias astudio="nohup /usr/local/android-studio/bin/studio.sh &"
alias attach="tmux attach-session -t"
alias cl=changelogger
alias code=vscodium
alias emacs='emacs -nw'
alias emulator="~/Android/Sdk/emulator/emulator"
alias exti=exit
alias ezit=exit
alias ezti=exit
alias fzf="fzf --preview 'cat {1}'"
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias gitlog="git log --oneline | fzf --preview 'git show --name-only {1}'" 
alias gut=git
alias hide_cursor="echo \"\\e[?25l\""
alias iofetch="bash <(curl -s https://raw.githubusercontent.com/KDesp73/IncludeOnly/refs/heads/main/scripts/installer.sh)"
alias la=ls -a
alias ll=ls -l
alias lla=ls -la
alias nf="nv \$(fzf)"
alias nv=nvim
alias open="xdg-open"
alias pgconnect="psql -U iee2021035 -h dblabs.iee.ihu.gr -W -d iee2021035"
alias python=python3
alias show_cursor="echo \"\\e[?25h\""
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias update="pamac update && pamac upgrade"
alias vi=nvim

export ANDROID_HOME=$HOME/Android/Sdk
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export LD_LIBRARY_PATH="$HOME"/.sdkman/candidates/java/23.ea.8-open/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/opt/gcc-14.1.0/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
export PATH=${PATH}"$HOME/.config/herd-lite/bin"
export PATH=${PATH}:$HOME/.dotnet:$HOME/.dotnet/tools
export PATH=${PATH}:"$HOME/.cargo/bin"
export PATH=${PATH}:"$HOME/.local/bin"
export PATH=${PATH}:"$HOME/c3-linux"
export PATH=${PATH}:"$HOME/idea-IC-242.23726.103/bin"
export PATH=${PATH}:"$repos/bash/scripts"
export PATH=${PATH}:"$repos/cpp/Stockfish/src"
export PATH=${PATH}:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/26.0.0-preview/:$HOME/.var/app/com.google.AndroidStudio/config/.android/avd
export PATH=/opt/gcc-14.1.0/bin:$PATH
export PATH=${PATH}:$HOME/Applications/Discord
export PATH=${PATH}:$HOME/Applications
export PHP_INI_SCAN_DIR="/home/kdesp73/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export dotfiles="$HOME/dotfiles"
export repos="$HOME/personal/repos"

source $HOME/.secrets
wcli --location Thessaloniki

export $(/usr/bin/dbus-launch)

source $ZSH/oh-my-zsh.sh
# source $HOME/emsdk/emsdk_env.sh &>/dev/null
alias ls=lsd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

