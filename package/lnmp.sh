#!/bin/bash

function wsi_install_lnmp {
  #wsi_ensure_package_installable git "Git already installed"
  wsi_install_package nginx
  wsi_install_package mysql
  wsi_install_package php
}
