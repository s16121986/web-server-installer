#!/bin/bash

N="${1}"

if [ -f "/etc/nginx/sites-enabled/${N}.conf" ]; then
  rm "/etc/nginx/sites-enabled/${N}.conf"
  echo "${N}.conf disabled"
  sudo service nginx restart
else
  echo "${N}.conf already disabled"
fi