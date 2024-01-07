#!/bin/bash

ROOT_PATH=$(dirname $(dirname "${0}"))

"$ROOT_PATH/bin/nginx.sh"
"$ROOT_PATH/bin/mysql.sh"
"$ROOT_PATH/bin/php.sh"
