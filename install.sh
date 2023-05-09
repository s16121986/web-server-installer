#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"
v="${1:-help}"

case $v in
*)
  if [ -f "$BOOT_PATH/bin/${v}.sh" ]; then
    "$BOOT_PATH/bin/${v}.sh"
  else
    "$BOOT_PATH/bin/help.sh"
  fi
  ;;
esac
