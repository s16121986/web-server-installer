#!/bin/bash

u=$(id -nu 1000)

function _cp {
  cp "./conf/home/${1}" "/home/${u}/"
  #chown 1000:1000 "/home/${u}/${1}"
}

_cp .bash_aliases
_cp .bash_macros
_cp .gitignore

#cp ./conf/PhpStorm.desktop /home/admin/.local/share/applications/PhpStorm.desktop
