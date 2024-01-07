#!/bin/bash

set -e

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/package-helpers.sh"
source "${ROOT_PATH}/lib/echo.sh"

# Common usage
echo "Web server installer usage:"
dotted_line "  wsi" "Run default installer"
dotted_line "  wsi uninstall" "Uninstall this library"
dotted_line "  wsi [<package>]" "Install specific package"
echo ""

# Allowed installers
title "Allowed installers:"
dotted_line "  lnmp" "Nginx + MySQL + PHP"
dotted_line "  php" "PHP"
echo ""

# Allowed packages
title "Allowed packages:"

for i in ${packages[@]}; do
  if is_installed "${i}"; then
    dotted_line "  ${i}" "${GREEN}INSTALLED${NC}"
  else
    dotted_line "  ${i}" "${RED}NOT INSTALLED${NC}"
  fi
done

#help="${help}\n  boot www <site>"
