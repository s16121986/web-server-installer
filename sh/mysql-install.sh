#!/bin/bash

set -e

dnf -y install mariadb-server
systemctl enable mariadb
systemctl start mariadb
mysql -e "CREATE USER 'dev'@'%' IDENTIFIED BY '';"
mysql -e "GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';"