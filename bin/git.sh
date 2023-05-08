#!/bin/bash

if [ -z $(which git) ]; then
  sudo apt -y install git

  cp ./conf/git/.gitconfig /home/dev
  cp ./conf/git/.gitignore /home/dev
else
  echo "Git already installed"
fi
