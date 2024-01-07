#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

#u=$(id -nu 1000)

if [ -z $(which nginx) ]; then

  sudo apt -y -q install nginx
  sudo systemctl enable nginx

  sudo chgrp 1000 /etc/nginx/nginx.conf
  sudo chmod g+rw /etc/nginx/nginx.conf

  folders=(conf.d sites-available presets snippets)
  for i in ${folders[@]}; do
    sudo mkdir -p "/etc/nginx/${i}"

    if [ -d "$ROOT_PATH/conf/nginx/${1}" ]; then
      sudo cp "$ROOT_PATH/conf/nginx/${1}"/* "/etc/nginx/${1}"
    fi
  done

  for i in ${folders[@]}; do
    sudo chgrp -R 1000 "/etc/nginx/${i}"
    sudo chmod -R g+rw "/etc/nginx/${i}"
  done

  #find /etc/nginx/conf.d -type f -exec sudo chmod 0644 {} \;
else
  skipped "Nginx already installed"
fi

# WWW setup
if [ ! -d /var/www/sites ]; then
  sudo mkdir -p /var/www/sites
  sudo mkdir /var/www/libs
  sudo chown -R 1000:1000 /var/www
fi
