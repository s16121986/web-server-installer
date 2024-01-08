#!/bin/bash

set -e

WSI_PACKAGES=(php nginx mysql git composer redis memcached supervisor docker volta phpmyadmin)
WSI_ROOT_PATH=$(dirname "${0}")
WSI_LIB_PATH="${WSI_ROOT_PATH}/lib"
WSI_CONF_PATH="${WSI_ROOT_PATH}/conf"
WSI_SCRIPT_PATH="${WSI_ROOT_PATH}/scripts"
WSI_PACKAGE_PATH="${WSI_ROOT_PATH}/package"

source "${WSI_LIB_PATH}/package.sh"
source "${WSI_LIB_PATH}/echo.sh"

v="${1}"

case "$v" in
"")
  source "${WSI_SCRIPT_PATH}/installer.sh"
  wsi_run_installer
  ;;
uninstall)
  source "${WSI_SCRIPT_PATH}/uninstaller.sh"
  wsi_run_uninstaller
  ;;
help)
  source "${WSI_SCRIPT_PATH}/help.sh"
  wsi_help
  ;;
*)
  wsi_install_package "$v"
  ;;
esac
