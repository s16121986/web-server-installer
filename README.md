## Setup installer

```shell
sudo apt -y install wget

wget -qO- https://raw.githubusercontent.com/s16121986/linux-bootstrap/wsl-debian/setup.sh | bash

alias wsi="/tmp/web-server-installer/bin/run.sh"

wsi help
```

## WSL Setup

### 1. Disable sudo password

```shell
sudo visudo

# add rule for dev user
# dev ALL=(ALL) NOPASSWD: ALL
```

### 2. Enable systemd

```shell
sudo touch /etc/wsl.conf
sudo echo -e "[boot]\nsystemd=true">/etc/wsl.conf
```

### 3. Restart WSL (Windows Terminal)

```shell
wsl -t debian
```
