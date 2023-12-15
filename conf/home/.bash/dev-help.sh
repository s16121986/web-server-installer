#!/bin/bash

echo "Usage:
  chown-dev [dir]           Change all files owner to dev:dev
  chown-www [dir]           Change all files owner to www-data:dev
  laravel-install [dir]     Set default owner & permissions to LaravelApp folders
  clear-logs [dir]          Disable nginx conf (default: ./storage/logs)
  nginxenconf <conf name>   Enable nginx conf
  nginxdisconf <conf name>  Disable nginx conf
  git-tag <version>         Update release version"
  
  
#  chmod:r [dir]             Set readonly files permissions (0640, 0750 to folders)
#  chmod:w [dir]             Set writeable files permissions (0660, 0770 to folders)
