#!/bin/bash

CACHEDIR="$HOME/.cache/repos"

# Check if the cache directory exists
if [ -d "$CACHEDIR" ]; then
    echo "Cache directory exists."
else
    echo "Creating cache directory."
    mkdir -p "$CACHEDIR"
fi

# Download the Flatpak reference file
wget https://dl.flathub.org/repo/appstream/io.github.flattool.Warehouse.flatpakref -O "$CACHEDIR/Warehouse.flatpakref"

# Install the Flatpak application
flatpak install --from "$CACHEDIR/Warehouse.flatpakref"

# Clean up the cache directory
rm -rf "$CACHEDIR"
