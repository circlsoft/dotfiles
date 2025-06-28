#!/bin/bash

# Backup current dotfiles to the repository
# Run this script to update your dotfiles repository with current configurations

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOME_DIR="$HOME"

echo "Updating dotfiles repository with current configurations..."

# Function to safely copy file if it exists
safe_copy() {
    local source="$1"
    local target="$2"
    
    if [ -e "$source" ]; then
        mkdir -p "$(dirname "$target")"
        cp "$source" "$target"
        echo "Updated: $(basename "$source")"
    else
        echo "Skipped: $source (not found)"
    fi
}

# Update shell configurations
echo "Updating shell configurations..."
safe_copy "$HOME_DIR/.zshrc" "$DOTFILES_DIR/shell/.zshrc"
safe_copy "$HOME_DIR/.profile" "$DOTFILES_DIR/shell/.profile"
safe_copy "$HOME_DIR/.zprofile" "$DOTFILES_DIR/shell/.zprofile"

# Update git configuration
echo "Updating git configuration..."
safe_copy "$HOME_DIR/.gitconfig" "$DOTFILES_DIR/git/.gitconfig"

# Update SSH configuration (without private keys)
echo "Updating SSH configuration..."
safe_copy "$HOME_DIR/.ssh/config" "$DOTFILES_DIR/ssh/config"

# Update config directory (selective)
echo "Updating application configurations..."
if [ -d "$HOME_DIR/.config" ]; then
    # Add specific configs you want to track here
    for config_name in "git" "nvim" "tmux" "alacritty" "kitty" "fish" "gh" "iterm2" "thefuck" "uv"; do
        if [ -d "$HOME_DIR/.config/$config_name" ]; then
            rm -rf "$DOTFILES_DIR/config/$config_name"
            cp -r "$HOME_DIR/.config/$config_name" "$DOTFILES_DIR/config/"
            echo "Updated: .config/$config_name"
        fi
    done
fi

# Update oh-my-zsh custom configurations
echo "Updating oh-my-zsh custom configurations..."
if [ -d "$HOME_DIR/.oh-my-zsh/custom" ]; then
    rm -rf "$DOTFILES_DIR/oh-my-zsh/custom"
    cp -r "$HOME_DIR/.oh-my-zsh/custom" "$DOTFILES_DIR/oh-my-zsh/"
    echo "Updated: oh-my-zsh custom directory"
fi

# Update NPM configuration
echo "Updating NPM configuration..."
safe_copy "$HOME_DIR/.npmrc" "$DOTFILES_DIR/npm/.npmrc"

# Update NVM configuration
echo "Updating NVM configuration..."
safe_copy "$HOME_DIR/.nvmrc" "$DOTFILES_DIR/nvm/.nvmrc"

# Update local environment configurations
echo "Updating local environment configurations..."
if [ -d "$HOME_DIR/.local/bin" ]; then
    for env_file in "$HOME_DIR/.local/bin/env" "$HOME_DIR/.local/bin/env.fish"; do
        if [ -f "$env_file" ]; then
            safe_copy "$env_file" "$DOTFILES_DIR/local/$(basename "$env_file")"
        fi
    done
fi

echo ""
echo "✅ Dotfiles backup complete!"
echo "💡 Don't forget to commit and push your changes to git"
echo "📦 Updated: shell configs, oh-my-zsh custom, app configs, npm/nvm configs"