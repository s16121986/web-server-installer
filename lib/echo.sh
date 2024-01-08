#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
GRAY='\033[0;37m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No Color

export RED
export GREEN
export GRAY
export YELLOW
export NC

function _str_pad_with_dot {
  size=${#1}
  echo -en "${1} ${GRAY}"

  for ((i = size; i < 30; i++)); do
    echo -n "."
  done

  echo -en "${NC}"
}

function dotted_line {
  #echo -n "  ${1}"
  #printf "%-20s" ${1}
  _str_pad_with_dot "${1}"
  echo -e " ${2}"
}

function error {
  echo -e "${RED}${1}${NC}"
}

function info {
  echo -e "${BLUE}${1}${NC}"
}

function success {
  echo -e "${GREEN}${1}${NC}"
}

function title {
  echo -e "${YELLOW}${1}${NC}"
}

function comment {
  echo -e "${GRAY}${1}${NC}"
}
