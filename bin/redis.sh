#!/bin/bash

if [ -z $(which redis-cli) ]; then
  sudo apt -y install redis
  sudo systemctl enable redis
else
  echo "SKIPPED: Redis already installed"
fi
