#!/bin/bash

set -e

if [ -z $(which nginx) ]; then
  echo "Nginx not installed. Use boot nginx"
  exit
fi

if [ ! -f /usr/bin/php7.4 ]; then
  echo "Php7.4 not installed. Use boot php74"
  exit
fi

if [ ! -f /usr/local/bin/composer ]; then
  echo "Composer not installed. Use boot composer"
  exit
fi

BOOT_PATH="/tmp/wsl-boot"

# Setup folders
if [ ! -d /var/www/sites ]; then
  sudo mkdir -p /var/www/sites
  sudo mkdir /var/www/libs
  sudo chown -R 1000:1000 /var/www
fi

sudo update-alternatives --set php /usr/bin/php7.4

# Clone git
if [ ! -d /var/www/sites/online-express.ru ]; then
  mkdir "/var/www/sites/online-express.ru"
  cd /var/www/sites/online-express.ru

  if [ -z "$GIT_PRIVATE_TOKEN" ]; then
    read -p "Enter your git private token: " GIT_PRIVATE_TOKEN
  fi
  git clone "https://oauth2:${GIT_PRIVATE_TOKEN}@gitlab.online-express.ru/onexi/oex_new.git" .
  read -p "Enter your git username: " USERNAME
  read -p "Enter your git email: " EMAIL
  git config user.name "$USERNAME"
  git config user.email "$EMAIL"

  # Install env
  cp .env.example .env
  composer install --ignore-platform-reqs
  php7.4 artisan key:generate

  # Setup folder permissions
  find ./storage -type d -exec chmod g+w {} \;
  find ./storage -type d -exec sudo chown www-data:www-data {} \;
  find ./app/runtime -type d -exec chmod g+w {} \;
  find ./app/runtime -type d -exec sudo chown www-data:www-data {} \;
  chmod g+w ./bootstrap/cache
  sudo chown www-data:www-data ./bootstrap/cache

else
  echo "SKIPPED: online-express.ru site folder already exists, skip git clone"
fi

# Add nginx conf
if [ ! -f /etc/nginx/sites-available/oex.conf ]; then
  cp "$BOOT_PATH/conf/nginx.conf" /etc/nginx/sites-available/oex.conf
  cd /etc/nginx/sites-enabled
  ln -s "../sites-available/oex.conf" .
  sudo service nginx restart
else
  echo "SKIPPED: Nginx oex.conf already exists"
fi
