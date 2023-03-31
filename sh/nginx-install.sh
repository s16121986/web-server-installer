#!/bin/bash

set -e

cwd=$(pwd)

dnf -y install nginx
systemctl enable nginx

mkdir -p /etc/nginx/conf.d
chown -R dev:dev /etc/nginx/conf.d
#chmod 0755 /etc/nginx/conf.d
find /etc/nginx/conf.d -type f -exec chmod 644 {} \;

mkdir -p /etc/nginx/sites-available
cp ./etc/nginx/sites-available/* /etc/nginx/sites-available
chown -R dev:dev /etc/nginx/sites-available
#chmod 0755 /etc/nginx/sites-available
find /etc/nginx/sites-available -type f -exec chmod 644 {} \;

mkdir -p /etc/nginx/sites-enabled
cd /etc/nginx/sites-enabled
ln -s ../sites-available/* .
cd "$cwd"
chown -R dev:dev /etc/nginx/sites-enabled
#chmod 0755 /etc/nginx/sites-enabled
find /etc/nginx/sites-enabled -type f -exec chmod 644 {} \;

chown -R dev:dev /etc/nginx/nginx.conf
#chmod 0644 /etc/nginx/nginx.conf

usermod -a -G nginx dev
usermod -a -G web nginx
