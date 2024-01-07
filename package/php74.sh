#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))
phpKey="php7.4"
priority=10

source "${ROOT_PATH}/lib/echo.sh"

"$ROOT_PATH/bin/php-repository.sh"

if [ ! -f /usr/bin/php7.4 ]; then
  sudo apt -y -q install "${phpKey}-cli"
  sudo apt -y -q install "${phpKey}-common"
  sudo apt -y -q install "${phpKey}-opcache"
  sudo apt -y -q install "${phpKey}-mysqlnd"
  sudo apt -y -q install "${phpKey}-mcrypt"
  sudo apt -y -q install "${phpKey}-zip"
  sudo apt -y -q install "${phpKey}-xml"
  sudo apt -y -q install "${phpKey}-curl"
  sudo apt -y -q install "${phpKey}-mbstring"
  sudo apt -y -q install "${phpKey}-gd"
  sudo apt -y -q install "${phpKey}-soap"
  sudo apt -y -q install "${phpKey}-redis"
  sudo apt -y -q install "${phpKey}-memcached"
  sudo apt -y -q install "${phpKey}-fpm"

  #sudo update-alternatives --install /usr/local/bin/php php "/opt/remi/${phpKey}/root/bin/php" "${priority}"

  #ln -s "/opt/remi/php/${1}/bin/php" "/usr/bin/${phpKey}"

  sudo chown -R 1000:1000 /etc/php/7.4/fpm

  sudo systemctl enable php7.4-fpm
else
  skipped "PHP7.4 already installed"
fi
