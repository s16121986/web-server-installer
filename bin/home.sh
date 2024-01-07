#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

cp -a "$ROOT_PATH/conf/home/." ~/
find ~/.bin/ -type f -exec sudo chmod u+x {} \;
