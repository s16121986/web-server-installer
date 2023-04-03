#!/bin/bash

set -e

#alias dnf='apt'

cwd=$(pwd)
u=$(id -nu 1000)

sudo usermod -a -G www-data "${u}"

sudo dnf -y install https://rpms.remirepo.net/fedora/remi-release-37.rpm
sudo dnf config-manager --set-enabled remi
#dnf module enable php:remi-7.4 -y
#dnf module reset php

./packages/php.sh 81 30
./packages/php.sh 74 10
sudo ln -s /usr/bin/php81 /usr/bin/php

./packages/nginx.sh

./packages/mysql.sh

sudo dnf -y install supervisor
sudo systemctl enable supervisor

sudo mkdir /var/www/sites
#mkdir /var/www/sites/ustabor.uz
#mkdir /var/www/sites/gotostans.com
#mkdir /var/www/sites/online-express.ru
sudo mkdir /var/www/libs

./packages/phpmyadmin.sh 5.2.1 /var/www/libs/phpmyadmin

./packages/composer.sh

./packages/docker.sh

sudo chown -R 1000:www-data /var/www
