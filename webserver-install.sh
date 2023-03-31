#!/bin/bash

set -e

#alias dnf='apt'

cwd=$(pwd)

groupadd web
usermod -a -G web dev

./sh/php-install.sh 81
./sh/php-install.sh 74

./sh/nginx-install.sh 74

./sh/mysql-install.sh 74

dnf -y install supervisor
systemctl enable supervisor

mkdir /var/www/sites
mkdir /var/www/libs

./sh/phpmyadmin-install.sh 5.2.1 /var/www/libs/phpmyadmin

chown -R dev:web /var/www
