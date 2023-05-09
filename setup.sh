#!/bin/bash

if [ -z $(which zip) ]; then
  sudo apt -y install zip
fi

cwd=$(pwd)
BOOT_PATH="/tmp/wsl-boot"

cd /tmp

if [ -d "${BOOT_PATH}" ]; then
  rm -rf "${BOOT_PATH}"
fi

wget -q "https://github.com/s16121986/linux-bootstrap/archive/refs/heads/wsl-debian.zip"
unzip -q wsl-debian.zip
rm /tmp/wsl-debian.zip
mv /tmp/linux-bootstrap-wsl-debian "${BOOT_PATH}"

find "${BOOT_PATH}" -name "*.sh" -exec chmod 0744 {} \;

#export BOOT_PATH
#alias boot="/tmp/wsl-boot/install.sh"

echo -e "=> Append the following lines to the correct file yourself:"
command printf "alias boot=\"/tmp/wsl-boot/install.sh\""
#echo -e "\n"

#cd "${BOOT_PATH}"
