#!/bin/sh

exists()
{
  command -v "$1" >/dev/null 2>&1
}

# brew
if ! exists brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! exists brew command command-not-found-init; then
  brew tap homebrew/command-not-found
fi

# base
if ! exists git; then
  brew install git
fi
if ! exists curl; then
  brew install curl
fi
if ! exists wget; then
  brew install wget
fi

# oh-my-zsh
rm -f ~/.zshrc
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt ]; then
  # theme spaceship-prompt
  git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k ]; then
  # theme powerlevel9k
  git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
  # plugin zsh-autosuggestions
  git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
  # plugin zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# hard links for zshrc
rm -f ~/.zshrc
ln ~/dotfiles/.zshrc ~/.zshrc

# links for neovim
# https://robots.thoughtbot.com/my-life-with-neovim#installing-and-configuring-neovim
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p $XDG_CONFIG_HOME/nvim
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
rm -f $XDG_CONFIG_HOME/nvim/init.vim
rm -f ~/.vimrc
ln ~/dotfiles/init.vim $XDG_CONFIG_HOME/nvim/init.vim
ln ~/dotfiles/init.vim ~/.vimrc

# node
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
fi

if ! exists fd; then
  brew install fd
fi

# https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
# To install useful key bindings and fuzzy completion:
if ! exists fzf; then
  brew install fzf
  $(brew --prefix)/opt/fzf/install
fi

if ! exists node; then
  brew install node
fi

if ! exists ip; then
  brew install iproute2mac
fi

if ! exists yarn; then
  brew install yarn
fi

if ! exists cloc; then
  brew install cloc
fi

if ! exists autojump; then
  brew install autojump
fi

if ! exists nvim; then
  brew install neovim
fi

if ! exists jenv; then
  brew install jenv
fi

if ! exists http-server; then
  npm i -g http-server
fi

# set registry (taobao) https://registry.npm.taobao.org
# use tnpm instead...
yarn config set -g registry https://registry.npm.taobao.org

sh ./git.sh
sh ./git-personal.sh
