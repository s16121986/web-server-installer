#!/bin/bash

if [ -z $(which memcached) ]; then
  sudo apt -y install memcached

  sudo systemctl enable memcached
else
  echo "SKIPPED: Memcached already installed"
fi
