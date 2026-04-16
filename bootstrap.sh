#!/usr/bin/env bash
set -e

GITREPO="https://github.com/UmutKzl/linux_dotfiles"
DOTDIR="$HOME/.dots"

clonerepo() {
  echo "Cloning repo..."
  [ -d "$DOTDIR" ] || git clone "$GITREPO" "$DOTDIR"
}

linkdots() {
  echo "Linking dotfiles..."
  mkdir -p ~/.config
  for dir in "$DOTDIR/files/.config/"*; do
    target="$HOME/.config/$(basename "$dir")"
    ln -sfn "$dir" "$target"
  done
}

installpackages() {
  echo "Installing packages..."
  if command -v dnf >/dev/null; then
    sudo dnf install -y --nogpgcheck \
      --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
    sudo dnf copr enable -y solopasha/hyprland
    sudo dnf copr enable -y mradityaalok/satori
    sudo dnf install -y \
      swayosd brightnessctl fastfetch ghostty neovim sway swaybg \
      zip unzip tar luarocks lua nwg-look papirus-icon-theme
  elif command -v yay >/dev/null; then
    yay -S --needed \
      swayosd brightnessctl fastfetch ghostty-git neovim sway swaybg \
      zip unzip tar luarocks lua nwg-look swayidle papirus-icon-theme
  else
    echo "No supported package manager found. Install yay and rerun."
    exit 1
  fi
}

theme() {
  echo "Setting up themes..."
  current_dir=$PWD
  mkdir -p "$HOME/.local/share/themes"
  cd "$HOME/.local/share/themes"

  export ROOT_URL="https://github.com/catppuccin/gtk/releases/download"
  export RELEASE="v1.0.3"
  export FLAVOR="frappe"
  export ACCENT="blue"
  
  zip_file="catppuccin-${FLAVOR}-${ACCENT}-standard+default.zip"
  curl -LsS -o "$zip_file" "${ROOT_URL}/${RELEASE}/${zip_file}"
  unzip -o "$zip_file"
  rm "$zip_file"

  export THEME_DIR="$HOME/.local/share/themes/catppuccin-${FLAVOR}-${ACCENT}-standard+default"

  mkdir -p "${HOME}/.config/gtk-4.0"
  ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/"
  ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/"
  ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/"

  cd /tmp
  git clone https://github.com/catppuccin/papirus-folders.git || true
  cd papirus-folders
  sudo cp -r src/* /usr/share/icons/Papirus
  curl -LO https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/papirus-folders && chmod +x ./papirus-folders
  sudo ./papirus-folders -C cat-mocha-blue --theme Papirus-Dark
  
  cd "$current_dir"
}

lastnotes() {
  echo "--------------------------------------"
  echo "TODO: Change theme to Catppuccin using nwg-look or GTK settings."
  echo "TODO: Log out and select Sway from your display manager."
  echo "Good luck!"
}

clonerepo
linkdots
installpackages
theme
lastnotes
