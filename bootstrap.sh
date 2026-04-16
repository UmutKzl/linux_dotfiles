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
      swayosd brightnessctl fastfetch ghostty neovim sway swaybg \
      zip unzip tar luarocks lua nwg-look

  elif command -v yay >/dev/null; then
    yay -S --needed \
      swayosd brightnessctl fastfetch ghostty-git neovim sway swaybg \
      zip unzip tar luarocks lua nwg-look swayidle

  else
    echo "No supported package manager found"
    if command -v pacman >/dev/null; then
      echo "Install yay and rerun this script."
    fi
    exit 1
  fi
}

theme() {
  if [ ! -d "$HOME/.local/share/themes" ]; then
    mkdir $HOME/.local/share/themes
  fi

  cd ~/.local/share/themes

  # Set the root URL
  export ROOT_URL="https://github.com/catppuccin/gtk/releases/download"

  # Change to the tag you want to download
  export RELEASE="v1.0.3"

  # Change to suite your flavor / accent combination
  export FLAVOR="frappe"
  export ACCENT="blue"
  curl -LsS -o "catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip" \
     "${ROOT_URL}/${RELEASE}/catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip"

  # Extract the catppuccin zip file
  unzip catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip

  # Set the catppuccin theme directory
  export THEME_DIR="$HOME/.local/share/themes/catppuccin-${FLAVOR}-${ACCENT}-standard+default"

  # Optionally, add support for libadwaita
  mkdir -p "${HOME}/.config/gtk-4.0" && 
    ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets" &&
    ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css" &&
    ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"
  cd -
}

lastnotes() {
  echo "TODO: Change theme to Catppuccin by using GTK Settings app."
  echo "TODO: Change your desktop environment/window manager to Sway."

  echo "Good luck!"
}

clonerepo
linkdots
installpackages
theme
lastnotes
