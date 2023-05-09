#!/bin/bash

set -e

phpKey="php8.1"
extPrefix="php8.1"
priority=20

# Setup php repository
if [ ! -f /etc/apt/sources.list.d/php.list ]; then
  sudo apt install apt-transport-https lsb-release ca-certificates wget -y
  sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
  sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  sudo apt update
fi

if [ ! -f /usr/bin/php81 ]; then
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

  sudo chown -R 1000:1000 /etc/php/8.1/fpm

#  if [ ! -f /usr/bin/php ]; then
#    sudo ln -s /usr/bin/php81 /usr/bin/php
#  fi
fi
