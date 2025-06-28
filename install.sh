#!/bin/bash

# Dotfiles installation script
# This script creates symlinks from your home directory to the dotfiles repository

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "Backup directory created: $BACKUP_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    
    # If target already exists, back it up
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target"
        mv "$target" "$BACKUP_DIR/$(basename "$target")"
    fi
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Create symlink
    ln -sf "$source" "$target"
    echo "Created symlink: $target -> $source"
}

# Shell configurations
echo "Setting up shell configurations..."
create_symlink "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/shell/.profile" "$HOME/.profile"
create_symlink "$DOTFILES_DIR/shell/.zprofile" "$HOME/.zprofile"

# Git configuration
echo "Setting up git configuration..."
if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
    create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
fi

# SSH configuration
echo "Setting up SSH configuration..."
create_symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"

# Config directory
echo "Setting up application configurations..."
if [ -d "$DOTFILES_DIR/config" ]; then
    for config_item in "$DOTFILES_DIR/config"/*; do
        if [ -e "$config_item" ]; then
            config_name=$(basename "$config_item")
            create_symlink "$config_item" "$HOME/.config/$config_name"
        fi
    done
fi

echo ""
echo "✅ Dotfiles installation complete!"
echo "📁 Backup directory: $BACKUP_DIR"
echo ""
echo "You may need to:"
echo "  - Restart your terminal for shell changes to take effect"
echo "  - Configure SSH keys manually"
echo "  - Install required applications mentioned in the configs"