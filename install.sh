#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"
v="${1:-help}"

case $v in
full)
  "$BOOT_PATH/bin/git.sh"
  "$BOOT_PATH/bin/nginx.sh"
  "$BOOT_PATH/bin/mysql.sh"
  "$BOOT_PATH/bin/php81.sh"
  "$BOOT_PATH/bin/php74.sh"
  "$BOOT_PATH/bin/composer.sh"
  "$BOOT_PATH/bin/redis.sh"
  "$BOOT_PATH/bin/memcached.sh"
  "$BOOT_PATH/bin/supervisor.sh"
  "$BOOT_PATH/bin/volta.sh"
  ;;
*)
  if [ -f "$BOOT_PATH/bin/${v}.sh" ]; then
    "$BOOT_PATH/bin/${v}.sh"
  else
    "$BOOT_PATH/lib/help.sh"
  fi
  ;;
esac
