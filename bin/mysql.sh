#!/bin/bash

set -e

if [ -z $(which mariadb) ]; then

  sudo apt -y -q install mariadb-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
  sudo mysql -e "CREATE USER 'dev'@'%' IDENTIFIED BY '';"
  sudo mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';"

else
  echo "Mysql already installed"
fi
