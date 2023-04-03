#!/bin/bash
set -e

phpKey="php${1}"
extPrefix="php${1}-php"
priority=${2}

if [ ! -d "/opt/remi/${phpKey}" ]; then
  sudo dnf -y -q install "${phpKey}"
  sudo dnf -y -q install "${extPrefix}-mysqlnd"
  sudo dnf -y -q install "${extPrefix}-fpm"
  sudo dnf -y -q install "${extPrefix}-mcrypt"
  sudo dnf -y -q install "${extPrefix}-zip"
  sudo dnf -y -q install "${extPrefix}-xml"
  # dnf -y -q install "${extPrefix}-curl"
  sudo dnf -y -q install "${extPrefix}-mbstring"
  sudo dnf -y -q install "${extPrefix}-gd"

  sudo update-alternatives --install /usr/local/bin/php php "/opt/remi/${phpKey}/root/bin/php" "${priority}"

  #ln -s "/opt/remi/php/${1}/bin/php" "/usr/bin/${phpKey}"
else
  echo "${phpKey} already installed"
fi
