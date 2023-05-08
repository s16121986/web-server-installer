#!/bin/bash

if [ -z $(which zip) ]; then
  sudo apt -y install zip
fi

cwd=$(pwd)
INSTALL_PATH="/tmp/linux-bootstrap"

cd /tmp

if [ -d "${INSTALL_PATH}" ]; then
  rm -rf "${INSTALL_PATH}"
fi

wget -q "https://github.com/s16121986/linux-bootstrap/archive/refs/heads/wsl-debian.zip"
unzip -q wsl-debian.zip
rm /tmp/wsl-debian.zip
mv /tmp/linux-bootstrap-wsl-debian "${INSTALL_PATH}"

find "${INSTALL_PATH}" -name "*.sh" -exec chmod 0744 {} \;

alias boot="${INSTALL_PATH}/install.sh"

cd "${INSTALL_PATH}"
