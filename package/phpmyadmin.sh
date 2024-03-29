#!/bin/bash

function _version_major {
  local delimiter=.
  local array=($(echo "${1}" | tr $delimiter '\n'))
  echo "${array[0]}.${array[1]}"
}

function wsi_install_phpmyadmin {
  #wsi_ensure_package_installable php74 "PHP7.4 already installed"

  VER="${1:-5.2.1}"
  THEME_VER="$(_version_major "${VER}")"
  INSTALL_PATH=${2:-/var/www/libs/phpmyadmin}

  cd /tmp

  if [ -d "${INSTALL_PATH}" ]; then
    rm -rf "${INSTALL_PATH}"
  fi

  sudo mkdir -p "${INSTALL_PATH}"

  wget -q "https://files.phpmyadmin.net/phpMyAdmin/${VER}/phpMyAdmin-${VER}-all-languages.zip"
  unzip -q phpMyAdmin-*-all-languages.zip
  rm /tmp/phpMyAdmin-*-all-languages.zip
  sudo mv /tmp/phpMyAdmin-*-all-languages/* "${INSTALL_PATH}"
  rm -rf "/tmp/phpMyAdmin-${VER}-all-languages"

  wget -q "https://files.phpmyadmin.net/themes/darkwolf/${THEME_VER}/darkwolf-${THEME_VER}.zip"
  unzip -q darkwolf-*.zip
  rm /tmp/darkwolf-*.zip
  sudo mv /tmp/darkwolf "${INSTALL_PATH}/themes"

  sudo cp "$WSI_CONF_PATH/phpmyadmin/config.inc.php" "${INSTALL_PATH}/"

  sudo cp "$WSI_CONF_PATH/phpmyadmin/phpmyadmin.conf" "/etc/nginx/conf.d/"
  sudo chown -R 1000:1000 /etc/nginx/conf.d/phpmyadmin.conf
}
