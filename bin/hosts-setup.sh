#!/bin/bash

# Hosts aliases
cat ./conf/hosts >>/etc/hosts

# Монтирование сетевых дисков
echo -e "\n# Network drives\n" >>/etc/fstab

function mnt {
  #mkdir "/mnt/${1}"
  #chown dev:dev "/mnt/${1}"
  mount.cifs "//server.home/${1}" "/mnt/${1}" -o guest,uid=1000,gid=1000
  echo -e "//server.home/${1} /mnt/${1} cifs guest,uid=1000,gid=1000 0 0\n" >>/etc/fstab
}

mnt media
mnt downloads
mnt dump
#mnt nas
