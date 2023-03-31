# DNF
alias up="sudo dnf makecache --refresh && sudo dnf upgrade --refresh -y && flatpak update -y"
alias clean="sudo dnf autoremove -y && dnf clean all && flatpak uninstall --unused -y && sudo journalctl --vacuum-time=2weeks"

# system
alias apt='dnf'
alias ls="ls --color"
alias l="lsd --date '+%d.%m.%Y %H:%M' -lah"
alias myip="ip --brief address show"
alias ports='netstat -tulanp'
alias su='sudo -i'

# dev
alias chown:web='chown -R dev:web ./'
alias chmod:read='find ./ -type f -exec chmod 640 {} \; & find ./ -type d -exec chmod 750 {} \;'
alias chmod:write='find ./ -type f -exec chmod 660 {} \; & find ./ -type d -exec chmod 770 {} \;'

alias gs='git status'
alias gf='git fetch'
alias gr='git reset --hard && git clean -df'
alias gp='git pull'
alias gc='git checkout'

alias art='php artisan'
alias migrate='php artisan release:migrate'

alias cu='composer update'
alias ci='composer install'

alias np='npm run prod'
alias nd='npm run dev watch'
alias nu='npm update && npx browserslist@latest --update-db'
alias ni='npm install && npx browserslist@latest --update-db'

# services
alias nginx:restart='sudo service nginx restart'
alias redis:restart='sudo service redis-server restart'
alias supervisor:restart='sudo service redis-server restart'
alias fpm:restart='sudo service php-fpm restart'
alias fpm74:restart='sudo service php7.4-fpm restart'
alias fpm81:restart='sudo service php8.1-fpm restart'

# nav
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias .etc='cd /etc'
alias .logs='cd /var/log'
alias .conf='cd /etc/nginx/sites-available'
alias .sites='cd /var/www/sites'
alias .oex='cd /var/www/sites/oex_new'
alias .gts='cd /var/www/sites/GTSLaravel'
alias .ust='cd /var/www/sites/ustabor.uz'

# macros
if [ -f ~/.bash_macros ]; then
    . ~/.bash_macros
fi