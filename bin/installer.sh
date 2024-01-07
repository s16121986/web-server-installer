#!/bin/bash

set -e

ROOT_PATH=$(dirname $(dirname "${0}"))

source "${ROOT_PATH}/lib/package-helpers.sh"
source "${ROOT_PATH}/lib/echo.sh"

while :; do

  # find not installed
  array=()
  n=0
  for i in ${packages[@]}; do
    if [ $(is_installed "${i}") ]; then
      array[n]=i
      n=$((n + 1))
    fi
  done

  if [ $n -eq 0 ]; then
    comment "All packages installed"
    break
  fi

  # echo
  title "Allowed packages:"
  n=0
  for i in ${array[@]}; do
    dotted_line "  ${n}" "${i}"
    n=$((n + 1))
  done

  read -p "Type selection number: " i

  if [ -z ${array[$i]} ]; then
    error "Wrong number"
    break
  fi

  "$ROOT_PATH/package/${array[$i]}.sh"

done
