#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

if [ -z $(which memcached) ]; then
  sudo apt -y install memcached

  sudo systemctl enable memcached
else
  skipped "Memcached already installed"
fi
