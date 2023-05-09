#!/bin/bash

set -e

phpKey="php7.4"
extPrefix="php7.4"
priority=10

if [ ! -f /usr/bin/php74 ]; then
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

  sudo chown -R 1000:1000 /etc/php/7.4/fpm
fi
