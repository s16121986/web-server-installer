#!/bin/bash

function wsi_install_git {
  wsi_ensure_package_installable git "Git already installed"

  sudo apt -y install git

  cp "$WSI_CONF_PATH/git/.gitconfig" ~
  cp "$WSI_CONF_PATH/git/.gitignore" ~

  read -p "Enter your git login: " login
  read -p "Enter your display name: " name
  read -p "Enter your git email: " email
  read -p "Enter your git token: " token

  sed -i "s/:login/$login/g" ~/.gitconfig
  sed -i "s/:name/$name/g" ~/.gitconfig
  sed -i "s/:email/$email/g" ~/.gitconfig
  sed -i "s/:token/$token/g" ~/.gitconfig
}
