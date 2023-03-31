#!/bin/bash

flatpak install flathub org.telegram.desktop

# GNOME Tweaks
sudo dnf install gnome-tweaks

flatpak install flathub com.mattjakeman.ExtensionManager

# Устанавливаем иконки Papirus
wget -qO- https://git.io/papirus-icon-theme-install | sh
