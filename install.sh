#! /usr/bin/env bash

#
# Copy dotfiles to your home directory
#

SRC_DIR=$(cd "$(dirname "$0")"; pwd)
TARGET_DIR=$HOME

echo "Copies dotfiles to your home directory ($TARGET_DIR)."
read -p "Old files will be overwritten. Continue (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cp -f $SRC_DIR/gitconfig $TARGET_DIR/.gitconfig
  cp -f $SRC_DIR/vimrc $TARGET_DIR/.vimrc
  cp -f $SRC_DIR/bash_profile $TARGET_DIR/.bash_profile
  cp -f -R $SRC_DIR/atom/ $TARGET_DIR/.atom
  mkdir -p $TARGET_DIR/.vim/colors
  cp -f $SRC_DIR/vim/colors/solarized/solarized.vim $TARGET_DIR/.vim/colors/
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "You need to install \"$SRC_DIR/terminal-app/Solarized Dark.terminal\ manually."
    read -p "Open file manager (y/n)? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      open "$SRC_DIR/terminal-app/"
    fi
  fi
  echo "Done."
else
  echo "Canceled."
fi
