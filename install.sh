#!/bin/bash

SCRIPT_PATH='flean'
INSTALL_DIR='/opt/local/bin'

# Check if script is running with sudo
if [ "$(id -u)" -ne 0 ]; then
  echo "This script requires sudo privileges to install. Please run with sudo."
  exit 1
fi

# create install dir if doesn't exist already
if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR"
fi


# copy the script and change its permission
cp "$SCRIPT_PATH" "$INSTALL_DIR"

chmod +x "$INSTALL_DIR/$SCRIPT_PATH"


# add install dir in the PATH if doesn't exist
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
	echo "export PATH=$INSTALL_DIR:$PATH" >> "$HOME/.zshrc" && source "$HOME/.zshrc"
fi

echo "Installed flean, verify that it works correctly by running the flean command"
