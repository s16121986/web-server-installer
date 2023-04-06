#!/bin/bash

set -e

if [ -z $(sudo dnf list installed | grep mariadb) ]; then

  sudo apt -y -q install mariadb-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
  sudo apt -e "CREATE USER 'dev'@'%' IDENTIFIED BY '';"
  sudo apt -e "GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';"

else
  echo "Mysql already installed"
fi
