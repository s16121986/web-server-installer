#!/bin/bash

set -e

#ROOT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case $1 in
"all")
#  ./bin/applications-setup.sh
  ./bin/webserver-install.sh
  ./bin/home-setup.sh
  ./bin/hosts-setup.sh
  ;;

"webserver")
  ./bin/webserver-install.sh
  ;;

"hosts")
  ./bin/hosts-setup.sh
  ;;

"home")
  ./bin/home-setup.sh
  ;;

"help")
  ./bin/help.sh
  ;;

*)
  echo "unknown"
  ./bin/help.sh
  ;;
esac
