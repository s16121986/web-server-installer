#!/bin/bash

u=$(id -nu 1000)

function _cp {
  cp "./conf/home/${1}" "/home/${u}/"
  #chown 1000:1000 "/home/${u}/${1}"
}

_cp .bash_aliases
#_cp .bash_macros
_cp .gitignore

cp "./conf/home/.bash/*" "/home/${u}/.bash/"

find /home/dev/.bash/ -type f -exec sudo chmod 0750 {} \;

sudo ln -s /home/dev/.bash/dev.sh /usr/local/bin/dev

#cp ./conf/PhpStorm.desktop /home/admin/.local/share/applications/PhpStorm.desktop
