#!/bin/bash
set -e

phpKey="php${1}"
extPrefix="php${1}"
priority=${2}

if [ ! -d "/opt/remi/${phpKey}" ]; then
  sudo apt -y -q install "${phpKey}"
  sudo apt -y -q install "${extPrefix}-mysqlnd"
  sudo apt -y -q install "${extPrefix}-fpm"
  sudo apt -y -q install "${extPrefix}-mcrypt"
  sudo apt -y -q install "${extPrefix}-zip"
  sudo apt -y -q install "${extPrefix}-xml"
  # dnf -y -q install "${extPrefix}-curl"
  sudo apt -y -q install "${extPrefix}-mbstring"
  sudo apt -y -q install "${extPrefix}-gd"

  #sudo update-alternatives --install /usr/local/bin/php php "/opt/remi/${phpKey}/root/bin/php" "${priority}"

  #ln -s "/opt/remi/php/${1}/bin/php" "/usr/bin/${phpKey}"
else
  echo "${phpKey} already installed"
fi
