#!/bin/bash

set -e

cwd=$(pwd)

if [ ! -d /var/www/sites ]; then
  sudo mkdir -p /var/www/sites
  #mkdir /var/www/sites/ustabor.uz
  #mkdir /var/www/sites/gotostans.com
  sudo mkdir /var/www/libs

  sudo chown -R 1000:1000 /var/www
fi

function copy_conf {
  if [ 1 -f "./conf/nginx/sites-available/${1}.conf" ]; then
    cp "./conf/nginx/sites-available/${1}.conf" /etc/nginx/sites-available
    chmod 0644 "/etc/nginx/sites-available/${1}.conf"
    cd /etc/nginx/sites-enabled
    ln -s "../sites-available/${1}.conf" .
    cd "$cwd"
    chmod 0644 "/etc/nginx/sites-enabled/${1}.conf"
  fi
}

# Setup ustabor

# Setup gts

# Setup oex
copy_conf "oex"
mkdir /var/www/sites/online-express.ru
cd /var/www/sites/online-express.ru
git clone https://gitlab.online-express.ru/onexi/oex_new.git .
#sergey.guryanov@online-express.ru
git config user.name "Гурьянов Сергей"
git config user.email "sergey.guryanov@online-express.ru"
cd "${cwd}"
