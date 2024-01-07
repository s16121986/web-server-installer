#!/bin/bash

N="${1}"

if [ -f "/etc/nginx/sites-enabled/${N}.conf" ]; then
  echo "${N}.conf already enabled"
elif [ -f "/etc/nginx/sites-available/${N}.conf" ]; then
  cwd=$(pwd)
  cd /etc/nginx/sites-enabled
  ln -s "../sites-available/${N}.conf" .
  cd "$cwd"
  echo "${N}.conf enabled"
  sudo service nginx restart
else
  echo "${N}.conf not found"
 fi