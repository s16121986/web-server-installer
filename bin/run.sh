#!/bin/bash

set -e

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/package-helpers.sh"
source "${ROOT_PATH}/lib/echo.sh"

v="${1}"

case "$v" in
"")
  "$ROOT_PATH/bin/installer.sh"
  ;;
uninstall)
  "$ROOT_PATH/bin/uninstall.sh"
  ;;
*)
  if [ -f "$ROOT_PATH/bin/${v}.sh" ]; then
    "$ROOT_PATH/bin/${v}.sh"
  elif [ -f "$ROOT_PATH/package/${v}.sh" ]; then
    "$ROOT_PATH/bin/${v}.sh"
  else
    echo "Package ${v} not found"
  fi
  ;;
esac
