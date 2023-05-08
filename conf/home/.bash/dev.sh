#!/bin/bash

case $1 in
"chown:dev")
  sudo chown -R 1000:1000 "${2-.}"
  ;;

"chown:www")
  sudo chown -R www-data:www-data "${2-.}"
  ;;

"chmod:r")
  d="${2:-.}"
  find "${d}" -type f -exec sudo chmod 0640 {} \;
  find "${d}" -type d -exec sudo chmod 0750 {} \;
  ;;

"chmod:w")
  d="${2:-.}"
  find "${d}" -type f -exec sudo chmod 0660 {} \;
  find "${d}" -type d -exec sudo chmod 0770 {} \;
  ;;

"laravel:boot")
  d="${2:-.}"
  dev laravel:mk:storage "${d}"
#  dev chown:dev "${d}"
  dev chmod:r "${d}"
  dev chown:www "${d}/storage"
  dev chmod:w "${d}/storage"
  ;;

"laravel:mk:storage")
  d="${2:-.}"
  mkdir -p "${d}/storage/logs"
  mkdir -p "${d}/storage/app"
  mkdir -p "${d}/storage/framework/cache/data"
  mkdir -p "${d}/storage/framework/sessions"
  mkdir -p "${d}/storage/framework/testing"
  mkdir -p "${d}/storage/framework/views"
  dev chown:www "${d}/storage"
  dev chmod:w "${d}/storage"
  ;;

"clear-logs")
  d="${2:-.}"
  find "${d}" -type f -name *.log -exec sh -c ">{}" \;
  #for file in "${d}/*.log"; do > "$file"; done
  #truncate -s 0 "${d}/*.log"
  ;;

"nginxenconf")
  if [ -f "/etc/nginx/sites-enabled/${1}.conf" ]; then
    echo "${1}.conf already enabled"
  elif [ -f "/etc/nginx/sites-available/${1}.conf" ]; then
    cwd=$(pwd)
    cd /etc/nginx/sites-enabled
    ln -s "../sites-available/${1}.conf" .
    cd "$cwd"
    echo "${1}.conf enabled"
    sudo service nginx restart
  else
    echo "${1}.conf not found"
  fi
  ;;

"nginxdisconf")
  if [ -f "/etc/nginx/sites-enabled/${1}.conf" ]; then
    rm "/etc/nginx/sites-enabled/${1}.conf"
    echo "${1}.conf disabled"
    sudo service nginx restart
  else
    echo "${1}.conf already disabled"
  fi
  ;;

*)
  echo "Usage:
  dev chown:dev [dir]           Change all files owner to dev:dev
  dev chown:www [dir]           Change all files owner to www-data:dev
  dev chmod:r [dir]             Set readonly files permissions (0640, 0750 to folders)
  dev chmod:w [dir]             Set writeable files permissions (0660, 0770 to folders)
  dev laravel:boot [dir]        Set default owner & permissions to LaravelApp folders
  dev laravel:mk:storage [dir]  Create storage folders
  dev clear-logs [dir]          Disable nginx conf
  dev nginxenconf <conf name>   Enable nginx conf
  dev nginxdisconf <conf name>  Disable nginx conf"
  ;;
esac
