#!/bin/bash

sudo apt -y install git

BOOT_PATH="/tmp/wsl-boot"

if [ ! -f ~/.gitconfig ]; then
  cp "$BOOT_PATH/conf/git/.gitconfig" ~
  cp "$BOOT_PATH/conf/git/.gitignore" ~
else
  echo "Git already installed"
fi
