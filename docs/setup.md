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

### 3. Restart WSL

```shell
wsl -t debian
```

### 4. Setup installer

```shell
sudo apt -y install wget

wget -qO- https://raw.githubusercontent.com/s16121986/linux-bootstrap/wsl-debian/setup.sh | bash
```

### 5. Setup windows hosts

```text
#C:\Windows\System32\drivers\etc

# Home server
192.168.1.10  smarthome.hfgh.ru
192.168.1.1   router.home
192.168.1.10  server.home
192.168.1.10  torrents.home

# WSL services
127.0.0.1     redis
127.0.0.1     memcached
127.0.0.1     phpmyadmin.local

# WSL WWW
127.0.0.1     gts.local
127.0.0.1     www.gts.local
127.0.0.1     admin.gts.local
127.0.0.1     api.gts.local
127.0.0.1     hotel.gts.local

127.0.0.1     ustabor.local
127.0.0.1     www.ustabor.local
127.0.0.1     auto.ustabor.local
127.0.0.1     home.ustabor.local
127.0.0.1     tech.ustabor.local
127.0.0.1     admin.ustabor.local
127.0.0.1     api.ustabor.local

127.0.0.1     oex.local
127.0.0.1     www.oex.local
```