#!/bin/bash

packages=(php nginx mysql git redis memcached supervisor volta phpmyadmin composer)

export packages

function _which {
  if [ -z $(which "${1}") ]; then
    return 1
  else
    return 0
  fi
}

function _f {
  if [ -f "${1}" ]; then
    return 0
  else
    return 1
  fi
}

function is_installed {
  case "${1}" in
  "composer")
    return $(_f "/usr/local/bin/composer")
    ;;
  "git")
    return $(_f "$HOME/.gitconfig")
    ;;
  "php")
    return $(_f "/usr/bin/php")
    ;;
  "php74")
    return $(_f "/usr/bin/php7.4")
    ;;
  "php81")
    return $(_f "/usr/bin/php8.1")
    ;;
  "php82")
    return $(_f "/usr/bin/php8.2")
    ;;
  "nginx")
    return $(_which "nginx")
    ;;
  "mysql")
    return $(_which "mariadb")
    ;;
  "memcached")
    return $(_which "memcached")
    ;;
  "redis")
    return $(_which "redis-cli")
    ;;
  "supervisor")
    return $(_which "supervisord")
    ;;
  "volta")
    return $(_f "$HOME/.volta/bin/volta")
    ;;
  "phpmyadmin")
    return $(_f "/etc/nginx/conf.d/phpmyadmin.conf")
    ;;
  *)
    return 1
    ;;
  esac
}
