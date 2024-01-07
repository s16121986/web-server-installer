#!/bin/bash

set -e

phpKey="php8.1"
ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

"${ROOT_PATH}/bin/php-repository.sh"

if [ ! -f /usr/bin/php8.1 ]; then
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

  sudo chown -R 1000:1000 /etc/php/8.1/fpm

  sudo systemctl enable php8.1-fpm
else
  skipped "PHP8.1 already installed"
fi
