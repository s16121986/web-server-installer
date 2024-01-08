#!/bin/bash

function wsi_install_mysql() {
  wsi_ensure_package_installable mysql "Mysql already installed"

  sudo apt -y -q install mariadb-server
  sudo systemctl enable mariadb
  sudo systemctl start mariadb
  sudo mysql -e "CREATE USER 'dev'@'%' IDENTIFIED BY '';"
  sudo mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';"
}
