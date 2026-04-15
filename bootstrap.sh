#!/usr/bin/env bash

GITREPO="https://github.com/UmutKzl/linux_dotfiles"
DOTDIR="$HOME/.dots"

if [ ! -d "$DOTDIR" ]; then
  git clone $GITREPO $DOTDIR
fi

ln -s $DOTDIR/files/.config/* ~/.config
