#!/bin/bash

if [ -z $(which curl) ]; then
  sudo apt -y install curl
fi

u=$(id -nu 1000)
BOOT_PATH="/tmp/wsl-boot"

if [ ! -f /usr/local/bin/dev ]; then
  sudo usermod -a -G www-data "${u}"
  cp -a "$BOOT_PATH/conf/home/." ~/
  find ~/.bash/ -type f -exec sudo chmod 0750 {} \;
  sudo ln -s ~/.bash/dev.sh /usr/local/bin/dev
else
  echo "Home already configured"
fi

# WWW setup
if [ ! -d /var/www/sites ]; then
  sudo mkdir -p /var/www/sites
  sudo mkdir /var/www/libs
  sudo chown -R 1000:1000 /var/www
fi

# Uninstall
sudo service apache2 stop
sudo systemctl disable apache2
sudo apt -y purge apache2
