#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

if [ -z $(which mariadb) ]; then

  sudo apt -y -q install mariadb-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
  sudo mysql -e "CREATE USER 'dev'@'%' IDENTIFIED BY '';"
  sudo mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';"

else
  skipped "Mysql already installed"
fi
