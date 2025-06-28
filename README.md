# Dotfiles

Personal configuration files and setup scripts.

## Structure

```
dotfiles/
├── config/           # Application configs (.config/* files)
├── shell/            # Shell configurations (.zshrc, .profile, .zprofile)
├── oh-my-zsh/        # Oh-my-zsh custom plugins and themes
├── git/              # Git configuration
├── ssh/              # SSH configuration (keys excluded)
├── npm/              # NPM configuration
├── nvm/              # NVM configuration
├── local/            # Local environment configurations
├── scripts/          # Utility scripts
└── install.sh        # Installation script
```

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
   ```

2. Run the installation script:
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

## What's included

- **Shell configurations**: .zshrc, .profile, .zprofile
- **Oh-my-zsh customizations**: Custom plugins (zsh-autosuggestions, zsh-syntax-highlighting) and themes (jovial)
- **Application configs**: Git, GitHub CLI, iTerm2, Fish, TheFuck, UV, and more from ~/.config/
- **Development tools**: NPM and NVM configurations
- **Local environment**: Custom environment files from ~/.local/bin/
- **SSH config**: SSH configuration template (no private keys)
- **Scripts**: Installation and backup automation

## Manual setup required

After running the install script, you may need to:
- **Install oh-my-zsh** if not already installed: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- **Configure SSH keys** manually
- **Install applications** mentioned in the configs (iTerm2, Fish shell, etc.)
- **Run** `source ~/.zshrc` to reload shell with custom plugins
- **Set up application-specific credentials** and API keys