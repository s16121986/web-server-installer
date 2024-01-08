#!/bin/bash

function wsi_install_memcached {
  wsi_ensure_package_installable memcached "Memcached already installed"

  sudo apt -y install memcached

  sudo systemctl enable memcached
}
