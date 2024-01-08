#!/bin/bash

function wsi_help() {
  # Common usage
  echo "Web server installer usage:"
  dotted_line "  wsi" "Run default installer"
  dotted_line "  wsi uninstall" "Uninstall this library"
  dotted_line "  wsi [<package>]" "Install specific package"
  echo ""

  # Allowed installers
  title "Allowed installers:"
  #dotted_line "  all" "Install all packages"
  dotted_line "  lnmp" "Nginx + MySQL + PHP"
  #dotted_line "  wsl" "Init wsl"
  echo ""

  # Allowed packages
  title "Allowed packages:"

  for i in ${WSI_PACKAGES[@]}; do
    if wsi_is_package_installed "${i}"; then
      dotted_line "  ${i}" "${GREEN}INSTALLED${NC}"
    else
      dotted_line "  ${i}" "${RED}NOT INSTALLED${NC}"
    fi
  done
}

#help="${help}\n  boot www <site>"
