# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="fwalch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf
)

export FZF_BASE="$HOME/.fzf"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export repos="$HOME/personal/repos"
export dotfiles="$HOME/dotfiles"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools
export PATH=${PATH}:"$HOME/.cargo/bin"
export PATH=${PATH}:"$repos/bash/scripts"
export PATH=${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/build-tools/26.0.0-preview/:$HOME/.var/app/com.google.AndroidStudio/config/.android/avd
export PATH=${PATH}:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=${PATH}:"$HOME/.local/bin"
export PATH=${PATH}:"$HOME/c3-linux"
export PATH=${PATH}:"$HOME/idea-IC-242.23726.103/bin"

export PATH=${PATH}:"$repos/cpp/Stockfish/src"

# aliases
alias iofetch="bash <(curl -s https://raw.githubusercontent.com/KDesp73/IncludeOnly/refs/heads/main/scripts/installer.sh)"
alias pgconnect="psql -U iee2021035 -h dblabs.iee.ihu.gr -W -d iee2021035"
alias code=vscodium

alias cl=changelogger

# -a for file
# -P for target path
alias ytdl="yt-dlp -qx --audio-format mp3 --audio-quality 0 --no-playlist"

alias emulator="~/Android/Sdk/emulator/emulator"
alias astudio="nohup /usr/local/android-studio/bin/studio.sh &"
alias vi=nvim
alias nv=nvim
alias emacs='emacs -nw'
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias python=python3
alias update="pamac update && pamac upgrade"
alias open="xdg-open"
alias fzf="fzf --preview 'cat {1}'"
alias nf="nv \$(fzf)"
alias gitlog="git log --oneline | fzf --preview 'git show --name-only {1}'" 
alias exti=exit
alias ezit=exit
alias ezti=exit
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias show_cursor="echo \"\\e[?25h\""
alias hide_cursor="echo \"\\e[?25l\""
alias attach="tmux attach-session -t"
alias gut=git

alias la=ls -a
alias ll=ls -l
alias lla=ls -la

source $ZSH/oh-my-zsh.sh
# source $HOME/emsdk/emsdk_env.sh &>/dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/home/kdesp73/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/kdesp73/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export LD_LIBRARY_PATH=/usr/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH="$HOME"/.sdkman/candidates/java/23.ea.8-open/lib:${LD_LIBRARY_PATH}

export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
alias ls=lsd

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Load Angular CLI autocompletion.
source <(ng completion script)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

