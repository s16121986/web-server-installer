#!/bin/bash

set -e

help="Usage: "

cd ./bin

for i in *; do
  help="${help}\n  ./install.sh ${i%.*}"
done

echo -e $help
