#! /bin/sh

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
  echo "Done."
else
  echo "Canceled."
fi

