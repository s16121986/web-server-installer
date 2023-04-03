1. Installation

   https://plafon.gitbook.io/fedora-zero/fedora-zero/chto-takoe-fedora-zero

   ```shell
   wget -qO- https://raw.githubusercontent.com/s16121986/linux-bootstrap/fedora-37/setup.sh | bash
   
   ./install.sh
   ```

2. Extensions

   ```shell
   flatpak install flathub com.mattjakeman.ExtensionManager
   
   # Устанавливаем иконки Papirus
   wget -qO- https://git.io/papirus-icon-theme-install | sh
   
   # RPM Fusion Free repository
   sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
   
   # RPM Fusion NonFree repository
   sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
   ```

3. Applications

    - [Yandex](https://browser.yandex.ru/beta/)
      ```
      sudo rpm -ih ~/Загрузки/Yandex.rpm && rm ~/Загрузки/Yandex.rpm
      ```
    - [Edge](https://www.microsoft.com/ru-ru/edge/download?form=MA13FW)
      ```
      sudo rpm -ih ~/Загрузки/microsoft-edge-*.rpm && rm ~/Загрузки/microsoft-edge-*.rpm
      ```
    - [Chrome](https://www.google.com/intl/ru/chrome/)
      ```
      sudo rpm -ih ~/Загрузки/google-chrome-stable*.rpm && rm ~/Загрузки/google-chrome-stable*.rpm
      ```
    - Telegram
      ```
      sudo dnf -y install telegram-desktop
      ```
    - [Zoom](https://zoom.us/download?os=linux)
      ```
      sudo rpm -ih ~/Загрузки/zoom*.rpm && rm ~/Загрузки/zoom*.rpm
      ```
    - [Skype](https://www.skype.com/ru/get-skype/)
      ```
      wget https://go.skype.com/skypeforlinux-64.rpm && sudo rpm -ih skypeforlinux-64.rpm && rm skypeforlinux-64.rpm
      ```

    - [PhpStorm](https://www.jetbrains.com/phpstorm/download/#section=linux)
      ```
      tar -xf ~/Загрузки/PhpStorm-*.tar.gz && sudo mv PhpStorm-* /opt/PhpStorm
      ```
    - [KeePass](https://keepassxc.org/download/#linux)
      ```
      sudo dnf install keepassxc
      ```

4. Web Apps

    - [Postman](https://www.postman.com/downloads/)
    - [Figma](https://www.figma.com/)
    - [Miro](https://miro.com/ru/)
    - [Gmail](https://mail.google.com/mail/u/0/#inbox)

5. System
    - Disable sudo password `visudo`
    - Setup user dirs
      ```shell
      # Set "$HOME" to disable menu item
      nano ~/.config/user-dirs.dirs
      ```

6. Remove
   ```
   sudo dnf remove httpd
   ```

## Links

https://github.com/s16121986/linux-bootstrap

## mounts

```shell
mount.cifs //server.home/nas /mnt/nas -o guest,uid=1000,gid=1000
```

google-chrome --password-store=basic --app=https://web.whatsapp.com/