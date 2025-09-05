#!/bin/bash

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
