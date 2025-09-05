#!/bin/bash

# install all the requirements
apk add networkmanager networkmanager-cli networkmanager-wifi networkmanager-dnsmasq network-manager-applet kitty kitty-x11 kitty-kitten font-jetbrains-mono-nerd flatpak gcc

# setup flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
