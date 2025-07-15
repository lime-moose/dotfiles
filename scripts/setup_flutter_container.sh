#!/bin/bash
# add codium binaries
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt upgrade

# install necessary packages
sudo apt install codium git adb openjdk-17-jdk clang cmake ninja-build pkg-config libgtk-3-dev mesa-utils

# setup flutter env
echo 'export PATH="$HOME/sdk/android/cmdline-tools/latest/bin/:$PATH"' >> ~/.zshenv
echo 'export PATH="$HOME/sdk/flutter/bin/:$PATH"' >> ~/.zshenv
source ~/.zshenv

# install android-sdk
sdkmanager --install "build-tools;35.0.0" "platform-tools" "platforms;android-35"

# add android-sdk to environment
echo 'export PATH="$HOME/sdk/android/platforms/:$PATH"' >> ~/.zshenv
echo 'export PATH="$HOME/sdk/android/platform-tools/:$PATH"' >> ~/.zshenv
echo 'export PATH="$HOME/sdk/android/build-tools/:$PATH"' >> ~/.zshenv
source ~/.zshenv
