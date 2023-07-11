#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"
help="Usage:"

cd "$BOOT_PATH/bin"

help="$help\n  boot full      Complete installation"

for i in *; do
  help="${help}\n  boot ${i%.*}"
done

#help="${help}\n  boot www <site>"

echo -e $help
