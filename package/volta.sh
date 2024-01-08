#!/bin/bash

function wsi_install_volta {
  wsi_ensure_package_installable volta "Volta already installed"

  curl https://get.volta.sh | bash

  u=$(id -nu 1000)

  echo "
  export VOLTA_HOME=\"$HOME/.volta\"
  export PATH=\"$VOLTA_HOME/bin:$PATH\"
  " >>~/.bashrc

  "/home/$u/.volta/bin/volta" install node@latest

  #echo "volta list"

  #wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

  #~/.nvm/nvm.sh install node
}
