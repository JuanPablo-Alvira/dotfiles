#!/bin/bash

# install.sh
# This script sets up symbolic links for various configuration files
# from a centralized dotfiles repository to their respective locations.

# Base directories
DOTFILES="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Function to create symbolic link with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # Check if the target already exists
    if [ -e "$target" ]; then
        # Create backup with timestamp
        local backup="${target}.backup.$(date +%Y%m%d_%H%M%S)"
        echo "Backing up existing file to: $backup"
        mv "$target" "$backup"
    fi
    
    # Create the symbolic link
    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Create our ~/.config directory if it doesn't exist
echo "Setting up configuration directories..."
mkdir -p "$CONFIG_DIR"


# NEOVIM
echo "Setting up Neovim configuration..."
# Remove existing Neovim config if it exists
rm -rf "$CONFIG_DIR/nvim"
# Create the nvim config directory
mkdir -p "$CONFIG_DIR/nvim"
# Create symbolic link from our dotfiles to the actual config location
ln -sf "$DOTFILES/nvim/"* "$CONFIG_DIR/nvim/"

# ZSH
echo "Setting up Zsh configuration..."
# Create symbolic link for .zshrc
# We use the create_symlink function to safely handle existing configurations
create_symlink "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

# Optional: Set up Zsh custom directory
if [ -d "$DOTFILES/zsh/custom" ]; then
    echo "Setting up Zsh custom scripts..."
    mkdir -p "$HOME/.zsh_custom"
    ln -sf "$DOTFILES/zsh/custom/"* "$HOME/.zsh_custom/"
fi

# Future setup commands for other tools will go here
# They'll follow a similar pattern:
# 1. Remove existing configuration if it exists
# 2. Create necessary directories
# 3. Create symbolic links

echo "Configuration installation complete!"
