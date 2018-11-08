# https://github.com/robbyrussell/oh-my-zsh/issues/5327#issuecomment-241226195
# debug mode, run the following line
# zsh -xv

# https://github.com/robbyrussell/oh-my-zsh/issues/5327#issuecomment-241226195
# profile, uncomment the first following line and run the second following line
# zmodload zsh/zprof
# zsh -ic zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="spaceship-prompt/spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras git-flow git-prompt zsh-autosuggestions zsh-syntax-highlighting autojump cp emoji)
# command-not-found is slow

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# powerlevel9k
DEFAULT_USER='zyy'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs node_version ip)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=3

# spaceship
# icons: https://fontawesome.com/cheatsheet
# colors: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# Prompt
SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_PROMPT_SEPARATE_LINE="true"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
# Char
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="\uf0e7"
SPACESHIP_CHAR_COLOR_SUCCESS="028"
# Username
SPACESHIP_USER_SHOW="true"
SPACESHIP_USER_PREFIX=""
# Hostname
SPACESHIP_HOST_COLOR="018"
SPACESHIP_HOST_COLOR_SSH="028"
# Dir
SPACESHIP_DIR_COLOR="044"
# Git
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_BRANCH_COLOR="100"
SPACESHIP_GIT_STATUS_COLOR="100"
# Package Version
SPACESHIP_PACKAGE_PREFIX=""
SPACESHIP_PACKAGE_COLOR="094"
# Node
SPACESHIP_NODE_PREFIX=""
SPACESHIP_NODE_COLOR="028"
# Execution time
SPACESHIP_EXEC_TIME_COLOR="226"

# set tab title
# deselect all the options for window and tab titles in the iterm->preferences->appearance section
# https://webcache.googleusercontent.com/search?q=cache:ZA9fOk_5_isJ:https://gist.github.com/phette23/5270658+&cd=1&hl=en&ct=clnk&gl=us
# https://superuser.com/questions/292652/change-iterm2-window-and-tab-titles-in-zsh
# precmd is called just before the prompt is printed
DISABLE_AUTO_TITLE="true"
function precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# history size
# HISTSIZE=100
# SAVEHIST=100

# java
export PATH=$HOME/.jenv/bin:$PATH
eval "$(jenv init -)"
jenv enable-plugin export >/dev/null 2>&1
export PATH=$PATH:$JAVA_HOME/bin

# android
export ANDROID_HOME="/Users/zyy/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# https://medium.com/js-features/launch-android-emulator-from-console-failure-eb43a1115cb5
alias emulator="${ANDROID_SDK_ROOT}/tools/emulator"

# go
# export GOPATH=$(go env GOPATH)
# export PATH=$PATH:$(go env GOPATH)/bin
# export PATH=$PATH:/usr/local/opt/go/libexec/bin

# util
alias cppwd="pwd | tr -d '\n' | pbcopy"
# https://stackoverflow.com/questions/13322485/how-to-get-the-primary-ip-address-of-the-local-machine-on-linux-and-os-x/25851186#25851186
alias echoip="ip route get 8.8.8.8 | head -1 | cut -d' ' -f8"
alias cpip="echoip | tr -d '\n' | pbcopy"
alias debugios="remotedebug_ios_webkit_adapter --port 7259"
alias term-rec="terminalizer record demo -c ~/dotfiles/terminalizer-config.yml"
alias zminit="zm init --npmClient yarn"

# npm
NPM_BIN_FOLDER=$(npm bin -g)
export PATH=$NPM_BIN_FOLDER:$PATH
# alias for cnpm https://registry.npm.taobao.org
# use tnpm instead...
alias cnpm="npm --registry=https://registry.npm.taobao.org"
alias anpm="npm --registry=http://registry.npm.alibaba-inc.com"
# yarn config set registry http://registry.npm.alibaba-inc.com -g

# flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=~/work/flutter/bin:$PATH

# npx SHELL AUTO FALLBACK (is not working)
# source <(npx --shell-auto-fallback zsh)

# nvm, please load when you need it
loadnvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
alias loadnvm="loadnvm"

# chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

# sublime
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# vim
if type nvim > /dev/null 2>&1; then
  # alias vim='nvim'
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# https://github.com/junegunn/fzf#respecting-gitignore
# Setting fd as the default source for fzf
# You can use fd, ripgrep, or the silver searcher instead of the default find command to traverse the file system while respecting .gitignore.
export FZF_DEFAULT_COMMAND='fd --type f'
