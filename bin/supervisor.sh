#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"

if [ -z $(which supervisor) ]; then
  sudo apt -y install supervisor
  sudo systemctl enable supervisor
else
  echo "SKIPPED: Supervisor already installed"
fi
