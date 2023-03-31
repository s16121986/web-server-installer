#!/bin/bash

set -e

#alias dnf='apt'

cwd=$(pwd)

groupadd web
usermod -a -G web dev

dnf -y install https://rpms.remirepo.net/fedora/remi-release-37.rpm
dnf config-manager --set-enabled remi
dnf config-manager --set-enabled remi-php74
dnf config-manager --set-enabled remi-php81
dnf config-manager --set-enabled remi-php82
dnf module reset php

./packages/php.sh 81 30
./packages/php.sh 74 10

./packages/nginx.sh

./packages/mysql.sh

dnf -y install supervisor
systemctl enable supervisor

mkdir /var/www/sites
mkdir /var/www/libs

./packages/phpmyadmin.sh 5.2.1 /var/www/libs/phpmyadmin

./packages/composer.sh

./packages/docker.sh

chown -R dev:web /var/www
