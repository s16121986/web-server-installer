#!/bin/bash

function wsi_install_supervisor {
  wsi_ensure_package_installable supervisor "Supervisor already installed"

  sudo apt -y install supervisor
  sudo systemctl enable supervisor
}
