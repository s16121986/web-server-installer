#!/bin/bash
set -e

function version_major {
  local delimiter=.
  local array=($(echo "${1}" | tr $delimiter '\n'))
  echo "${array[0]}.${array[1]}"
}

cwd=$(pwd)
SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VER="${1:-5.2.1}"
THEME_VER="$(version_major "${VER}")"
INSTALL_PATH=${2:-/var/www/libs/phpmyadmin}

cd /tmp

mkdir -p "${INSTALL_PATH}"

wget -q "https://files.phpmyadmin.net/phpMyAdmin/${VER}/phpMyAdmin-${VER}-all-languages.zip"
unzip -q phpMyAdmin-*-all-languages.zip
rm /tmp/phpMyAdmin-*-all-languages.zip
mv /tmp/phpMyAdmin-*-all-languages/* "${INSTALL_PATH}"
rm -rf "/tmp/phpMyAdmin-${VER}-all-languages"

wget -q "https://files.phpmyadmin.net/themes/darkwolf/${THEME_VER}/darkwolf-${THEME_VER}.zip"
unzip -q darkwolf-*.zip
rm /tmp/darkwolf-*.zip
mv /tmp/darkwolf "${INSTALL_PATH}/themes"

if [ -f "./conf/phpmyadmin/config.inc.php" ]; then
  cp "./conf/phpmyadmin/config.inc.php" "${INSTALL_PATH}"
fi

cd "${cwd}"
