#!/bin/bash

if [ -z $(which curl) ]; then
  sudo apt -y install curl
fi

u=$(id -nu 1000)

if [ ! -f /usr/local/bin/dev ]; then
  sudo usermod -a -G www-data "${u}"

  cp -a ./conf/home/. ~/

  #mkdir "/home/${u}/.bash"
  #cp "./conf/home/.bash/*" "/home/${u}/.bash/"

  find ~/.bash/ -type f -exec sudo chmod 0750 {} \;

  sudo ln -s ~/.bash/dev.sh /usr/local/bin/dev
else
  echo "Home already configured"
fi
