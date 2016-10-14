#! /usr/bin/env bash

# exit on error
set -e

#
# Copy dotfiles to your home directory
#

SRC_DIR=$(cd "$(dirname "$0")"; pwd)

if [ -z ${1+x} ]; then
  TARGET_DIR=$HOME
  echo "Copies dotfiles to your home directory ($TARGET_DIR)."
else
  TARGET_DIR=$1
  echo "Copies dotfiles to directory ($TARGET_DIR)."
fi

read -p "Old files will be overwritten. Continue (y/n)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p $TARGET_DIR
  fi
  cp -f $SRC_DIR/home/bash_additions $TARGET_DIR/.bash_additions
  cp -f $SRC_DIR/home/bash_prompt $TARGET_DIR/.bash_prompt
  cp -f $SRC_DIR/home/dircolors $TARGET_DIR/.dircolors
  cp -f $SRC_DIR/home/gitconfig $TARGET_DIR/.gitconfig
  cp -f $SRC_DIR/home/nanorc $TARGET_DIR/.nanorc
  cp -f $SRC_DIR/home/vimrc $TARGET_DIR/.vimrc
  cp -f -R $SRC_DIR/atom/ $TARGET_DIR/.atom
  mkdir -p $TARGET_DIR/.vim/colors

if [ -f "$TARGET_DIR/.bash_profile" ] && grep -Fxq ". .bash_additions" $TARGET_DIR/.bash_profile; then
    echo "Includes already present."
else
    echo "Adding includes to $TARGET_DIR/.bash_profile"
    echo ". .bash_additions" >> $TARGET_DIR/.bash_profile
fi
  
  # cp -f $SRC_DIR/vim/colors/solarized/solarized.vim $TARGET_DIR/.vim/colors/
  # if [[ "$OSTYPE" == "darwin"* ]]; then
  #   echo "You need to install \"$SRC_DIR/terminal-app/Solarized Dark.terminal\ manually."
  #   read -p "Open file manager (y/n)? " -n 1 -r
  #   echo
  #   if [[ $REPLY =~ ^[Yy]$ ]]; then
  #     open "$SRC_DIR/terminal-app/"
  #   fi
  # fi

  echo "Done."
else
  echo "Canceled."
fi
