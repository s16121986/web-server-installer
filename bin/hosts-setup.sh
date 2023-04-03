#!/bin/bash

# Hosts aliases
sudo cat ./conf/hosts >>/etc/hosts

# Монтирование сетевых дисков
sudo echo -e "\n# Network drives\n" >>/etc/fstab

function mnt {
  if [ ! -d "/mnt/${1}" ]; then
    sudo mkdir "/mnt/${1}"
    #chown 1000:1000 "/mnt/${1}"
    sudo mount.cifs "//server.home/${1}" "/mnt/${1}" -o guest,uid=1000,gid=1000
    sudo echo -e "//server.home/${1} /mnt/${1} cifs guest,uid=1000,gid=1000 0 0\n" >>/etc/fstab
  fi
}

mnt media
mnt downloads
mnt dump
#mnt nas
