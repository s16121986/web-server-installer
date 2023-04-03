#!/bin/bash

set -e

cwd=$(pwd)
u=$(id -nu 1000)

if [ -z $(sudo dnf list installed | grep nginx) ]; then

  sudo dnf -y -q install nginx
  sudo systemctl enable nginx

  sudo mkdir -p /etc/nginx/conf.d
  sudo chown -R 1000:1000 /etc/nginx/conf.d
  #chmod 0755 /etc/nginx/conf.d
  find /etc/nginx/conf.d -type f -exec sudo chmod 0644 {} \;

  sudo mkdir -p /etc/nginx/sites-available
  cp ./conf/nginx/sites-available/* /etc/nginx/sites-available
  sudo chown -R 1000:1000 /etc/nginx/sites-available
  #chmod 0755 /etc/nginx/sites-available
  find /etc/nginx/sites-available -type f -exec sudo chmod 0644 {} \;

  sudo mkdir -p /etc/nginx/sites-enabled
  cd /etc/nginx/sites-enabled
  sudo ln -s ../sites-available/* .
  cd "$cwd"
  sudo chown -R 1000:1000 /etc/nginx/sites-enabled
  #chmod 0755 /etc/nginx/sites-enabled
  find /etc/nginx/sites-enabled -type f -exec sudo chmod 0644 {} \;

  sudo chown -R 1000:1000 /etc/nginx/nginx.conf
  #sudo chmod 0644 /etc/nginx/nginx.conf

  sudo usermod -a -G nginx "${u}"
  sudo usermod -a -G www-data nginx
else
  echo "Nginx already installed"
fi
