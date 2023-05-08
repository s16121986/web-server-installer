#!/bin/bash

set -e

v="${1:-help}"

if [ -f "./bin/${v}.sh" ]; then
  "./bin/${v}.sh"
else
  ./bin/help.sh
fi
