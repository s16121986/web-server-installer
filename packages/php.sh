#!/bin/bash
set -e

phpKey="php${1}"
extPrefix="php${1}-php"
priority=${2}

dnf -y install "${phpKey}"
dnf -y install "${extPrefix}-mysqlnd"
dnf -y install "${extPrefix}-fpm"
dnf -y install "${extPrefix}-mcrypt"
dnf -y install "${extPrefix}-zip"
dnf -y install "${extPrefix}-xml"
# dnf -y install "${extPrefix}-curl"
dnf -y install "${extPrefix}-mbstring"
dnf -y install "${extPrefix}-gd"

update-alternatives --install /usr/local/bin/php php "/opt/remi/php/${1}/bin/php" "${priority}"
