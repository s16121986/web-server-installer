#!/bin/bash

cwd=$(pwd)
INSTALL_PATH="/tmp/linux-setup"

cd /tmp

wget -q "https://github.com/s16121986/linux-setup/archive/refs/heads/main.zip"
unzip -q main.zip
rm /tmp/main.zip
rename /tmp/linux-setup-main "${INSTALL_PATH}"

cd "${INSTALL_PATH}"

find ./ -iname "*.sh" -exec chmod 644 {} \;
