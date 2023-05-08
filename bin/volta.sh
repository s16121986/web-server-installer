#!/bin/bash

set -e

if [ -z $(which volta) ]; then
  curl https://get.volta.sh | bash

  echo "
  export VOLTA_HOME=\"$HOME/.volta\"
  export PATH=\"$VOLTA_HOME/bin:$PATH\"
  " >~/.bashrc

  volta list
else
  echo "Volta already installed"
fi

#echo "volta list"

#wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#~/.nvm/nvm.sh install node
