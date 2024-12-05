#!/bin/bash
# install.sh

# Base directories
DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Create our ~/.config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Neovim setup
echo "Setting up Neovim configuration..."
# Remove existing Neovim config if it exists
rm -rf "$CONFIG_DIR/nvim"
# Create the nvim config directory
mkdir -p "$CONFIG_DIR/nvim"
# Create symbolic link from our dotfiles to the actual config location
ln -sf "$DOTFILES/nvim/"* "$CONFIG_DIR/nvim/"

# Future setup commands for other tools will go here
# They'll follow a similar pattern:
# 1. Remove existing configuration if it exists
# 2. Create necessary directories
# 3. Create symbolic links

echo "Configuration installation complete!"
