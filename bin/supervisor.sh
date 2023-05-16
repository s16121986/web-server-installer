#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"

if [ -z $(which supervisor) ]; then
  sudo apt -y install supervisor
  sudo systemctl enable supervisor
  sudo cp "$BOOT_PATH/conf/supervisor.conf" /etc/supervisor/conf.d/oex-horison.conf
else
  echo "SKIPPED: Supervisor already installed"
fi
