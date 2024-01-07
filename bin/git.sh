#!/bin/bash

BOOT_PATH="/tmp/wsl-boot"

if [ ! -f ~/.gitconfig ]; then
  sudo apt -y install git
  
  cp "$BOOT_PATH/conf/git/.gitconfig" ~
  cp "$BOOT_PATH/conf/git/.gitignore" ~

  read -p "Enter your git login: " login
  read -p "Enter your display name: " name
  read -p "Enter your git email: " email
  read -p "Enter your git token: " token

  sed -i "s/:login/$login/g" ~/.gitconfig
  sed -i "s/:name/$name/g" ~/.gitconfig
  sed -i "s/:email/$email/g" ~/.gitconfig
  sed -i "s/:token/$token/g" ~/.gitconfig
else
  echo "SKIPPED: Git already installed"
fi
