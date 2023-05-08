#!/bin/bash

set -e

if [ -z $(which supervisor) ]; then
  sudo apt -y install supervisor
  sudo systemctl enable supervisor
else
  echo "Supervisor already installed";
fi
