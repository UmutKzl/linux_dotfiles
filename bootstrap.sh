#!/usr/bin/env bash

GITREPO="https://github.com/UmutKzl/linux_dotfiles"
DOTDIR="$HOME/.dots"

clonerepo() {
  if [ ! -d "$DOTDIR" ]; then
    git clone $GITREPO $DOTDIR
  fi
}

linkdots() {
  ln -si $DOTDIR/files/.config/* ~/.config
  ln -si $DOTDIR/files/.vimrc ~/.vimrc
  ln -si $DOTDIR/files/.vim ~/.vim
}

installpackages() {
  if ! command -v dnf >/dev/null; then
    echo "This script will install dependencies only in Fedora. You should install them manually."
  fi

  sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

  sudo dnf install -y swayosd brightnessctl fastfetch ghostty neovim sway swaybg zip unzip tar luarocks lua
}

clonerepo
linkdots
installpackages
