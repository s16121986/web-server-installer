#!/bin/bash

set -e

BOOT_PATH="/tmp/wsl-boot"
help="Usage:"

cd "$BOOT_PATH/bin"

for i in *; do
  help="${help}\n  boot ${i%.*}"
done

#help="${help}\n  boot www <site>"

echo -e $help
