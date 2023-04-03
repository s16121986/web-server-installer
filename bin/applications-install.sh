#!/bin/bash

flatpak install flathub com.mattjakeman.ExtensionManager

# Устанавливаем иконки Papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh

# RPM Fusion Free repository
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# RPM Fusion NonFree repository
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Fedora external repository
#dnf install fedora-workstation-repositories

dnf -y install google-chrome-stable

dnf -y install telegram-desktop

#dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
#dnf install microsoft-edge-stable
