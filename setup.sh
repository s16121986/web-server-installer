#!/bin/bash

BOOT_PATH=/tmp/web-server-installer

sudo apt -y install zip
sudo apt -y install curl

if [ -d "${BOOT_PATH}" ]; then
  rm -rf "${BOOT_PATH}"
fi

cd /tmp

wget -q "https://github.com/s16121986/web-server-installer/archive/refs/heads/wsl-debian.zip"
unzip -q wsl-debian.zip
rm /tmp/wsl-debian.zip
mv /tmp/web-server-installer-wsl-debian "${BOOT_PATH}"

find "${BOOT_PATH}/bin" -name "*.sh" -exec chmod u+x {} \;
find "${BOOT_PATH}/package" -name "*.sh" -exec chmod u+x {} \;

#rm "${BOOT_PATH}/setup.sh"

echo -e "=> Append the following lines to the correct file yourself:"
command printf "alias wsi=\"${BOOT_PATH}/bin/run.sh\""
#echo -e "\n"
