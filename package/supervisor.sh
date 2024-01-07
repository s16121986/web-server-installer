#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/echo.sh"

if [ -z $(which supervisor) ]; then
  sudo apt -y install supervisor
  sudo systemctl enable supervisor
else
  skipped "Supervisor already installed"
fi
