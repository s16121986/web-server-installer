# APT
alias clean="sudo apt autoremove -y && sudo apt clean all && sudo journalctl --vacuum-time=2weeks"
alias au="sudo apt update -y"
alias ai="sudo apt install -y"
alias ar="sudo apt remove"
alias as="sudo apt search"

# system
alias ls="ls --color"
alias l="lsd --date '+%d.%m.%Y %H:%M' -lah"
alias myip="ip --brief address show"
alias ports="netstat -tulanp"
alias su="sudo -i"

alias switch-php="sudo update-alternatives --config php"

alias gs="git status"
alias gf="git fetch"
alias gr="git reset --hard && git clean -df"
alias gp="git pull"
alias gc="git checkout"

alias art="php artisan"
alias migrate="php artisan release:migrate"

alias cu="composer update"
alias ci="composer install"
alias composer74="/usr/bin/php7.4 /usr/local/bin/composer"

alias np="npm run prod"
alias nd="npm run dev"
alias ndw="npm run dev watch"
alias nb="npm run build"
alias nu="npm update && npx browserslist@latest --update-db"
alias ni="npm install && npx browserslist@latest --update-db"

# services
alias ss="sudo systemctl start"
alias sr="sudo systemctl restart"
alias st="sudo systemctl stop"

# nav
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias .etc="cd /etc"
alias .logs="cd /var/log"
alias .conf="cd /etc/nginx/sites-available"
alias .sites="cd /var/www/sites"
alias .oex="cd /var/www/sites/online-express.ru"
alias .gts="cd /var/www/sites/gotostans.com"
alias .ust="cd /var/www/sites/ustabor.uz"
