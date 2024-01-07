#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

#u=$(id -nu 1000)

if [ -z $(which nginx) ]; then

  sudo apt -y -q install nginx
  sudo systemctl enable nginx

  sudo mkdir -p /etc/nginx/conf.d
  sudo chown -R 1000:1000 /etc/nginx/conf.d
  find /etc/nginx/conf.d -type f -exec sudo chmod 0644 {} \;

  sudo mkdir -p /etc/nginx/sites-available
  sudo chown 1000:1000 /etc/nginx/sites-available

  sudo mkdir -p /etc/nginx/sites-enabled
  sudo chown 1000:1000 /etc/nginx/sites-enabled

  sudo chown -R 1000:1000 /etc/nginx/nginx.conf
else
  skipped "Nginx already installed"
fi

# WWW setup
if [ ! -d /var/www/sites ]; then
  sudo mkdir -p /var/www/sites
  sudo mkdir /var/www/libs
  sudo chown -R 1000:1000 /var/www
fi
