# Dotfiles

Personal configuration files and setup scripts.

## Structure

```
dotfiles/
├── config/           # Application configs (.config/* files)
├── shell/           # Shell configurations
├── git/            # Git configuration
├── ssh/            # SSH configuration (keys excluded)
├── scripts/        # Utility scripts
└── install.sh      # Installation script
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

- Zsh configuration (.zshrc)
- Git configuration
- SSH config (no private keys)
- Application configurations from ~/.config/
- Installation and symlink management scripts

## Manual setup required

After running the install script, you may need to:
- Configure SSH keys
- Set up application-specific credentials
- Install required applications and tools