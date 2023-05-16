#!/bin/bash

BOOT_PATH="/tmp/wsl-boot"

if [ ! -f ~/.gitconfig ]; then
  sudo apt -y install git
  cp "$BOOT_PATH/conf/git/.gitconfig" ~
  cp "$BOOT_PATH/conf/git/.gitignore" ~
else
  echo "SKIPPED: Git already installed"
fi
