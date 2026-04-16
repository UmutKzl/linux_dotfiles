#!/usr/bin/env bash
set -e

GITREPO="https://github.com/UmutKzl/linux_dotfiles"
DOTDIR="$HOME/.dots"

clonerepo() {
  [ -d "$DOTDIR" ] || git clone "$GITREPO" "$DOTDIR"
}

linkdots() {
  mkdir -p ~/.config
  ln -sin "$DOTDIR/files/.config/"* ~/.config/
}

installpackages() {
  if command -v dnf >/dev/null; then
    sudo dnf install -y --nogpgcheck \
      --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

    sudo dnf copr enable -y solopasha/hyprland
    sudo dnf copr enable -y mradityaalok/satori

    sudo dnf install -y \
      swayosd brightnessctl fastfetch ghostty neovim swayfx swaybg \
      zip unzip tar luarocks lua nwg-look

  elif command -v yay >/dev/null; then
    yay -S --needed \
      swayosd brightnessctl fastfetch ghostty-git neovim sway swaybg \
      zip unzip tar luarocks lua nwg-look

  else
    echo "No supported package manager found"
    exit 1
  fi
}

clonerepo
linkdots
installpackages
