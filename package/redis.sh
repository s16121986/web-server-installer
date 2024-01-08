#!/bin/bash

function wsi_install_redis {
  wsi_ensure_package_installable redis "Redis already installed"

  sudo apt -y install redis
  sudo systemctl enable redis
}
