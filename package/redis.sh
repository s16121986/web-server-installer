#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

if [ -z $(which redis-cli) ]; then
  sudo apt -y install redis
  sudo systemctl enable redis
else
  skipped "Redis already installed"
fi
