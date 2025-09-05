#!/bin/bash

# add user to group
adduser ikrsh plugdev

# add config to config file
echo "[main]
dhcp=internal
plugins=ifupdown,keyfile

[ifupdown]
managed=true

[device]
wifi.scan-rand-mac-address=yes
wifi.backend=wpa_supplicant" > /etc/NetworkManager/NetworkManager.conf

# Stop & Remove conflicting services
rc-service networking stop
rc-service wpa_supplicant stop
rc-update del networking boot
rc-update del wpa_supplicant boot

# Start NetworkManager
rc-service networkmanager restart
rc-update add networkmanager default
