#!/bin/bash

cwd=$(pwd)
INSTALL_PATH="/tmp/linux-bootstrap"

cd /tmp

if [ -d "${INSTALL_PATH}" ]; then
  rm -rf "${INSTALL_PATH}"
fi

wget -q "https://github.com/s16121986/linux-bootstrap/archive/refs/heads/fedora-37.zip"
unzip -q fedora-37.zip
rm /tmp/fedora-37.zip
mv /tmp/linux-bootstrap-fedora-37 "${INSTALL_PATH}"

find "${INSTALL_PATH}" -name "*.sh" -exec chmod 0744 {} \;

alias boot="${INSTALL_PATH}/install.sh"

cd "${INSTALL_PATH}"
