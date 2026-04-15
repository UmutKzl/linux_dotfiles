#!/usr/bin/env bash

GITREPO="https://github.com/UmutKzl/linux_dotfiles"
DOTDIR="$HOME/.dots"

clonerepo() {
  if [ ! -d "$DOTDIR" ]; then
    git clone "$GITREPO" "$DOTDIR"
  fi
}

linkdots() {
  ln -si "$DOTDIR"/files/.config/* ~/.config
}

installpackages() {
  if ! command -v dnf >/dev/null; then
    echo "This script will install dependencies only in Fedora. You should install them manually."
  fi

  sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
  sudo dnf copr enable -y solopasha/hyprland
  sudo dnf copr enable -y mradityaalok/satori

  sudo dnf install -y swayosd brightnessctl fastfetch ghostty neovim swayfx swaybg zip unzip tar luarocks lua nwg-look
}

clonerepo
linkdots
installpackages
