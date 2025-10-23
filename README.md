# Lexitron.nvim

A comprehensive Neovim distribution with LSP support for 15+ languages, 110+ plugins, and performance optimizations.

## Documentation

- [Guide](docs/Guide.md) - Keybindings and workflows
- [Reference](docs/Reference.md) - Architecture and troubleshooting

## Installation

### Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/Fawz-Haaroon/nvim/main/install.sh | bash
```

### Manual Install

```bash
git clone https://github.com/Fawz-Haaroon/nvim.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```

### Advanced Options

```bash
./install.sh --verbose    # Detailed logging
./install.sh --force      # Overwrite existing config
./install.sh --dry-run    # Preview installation
./install.sh --skip-fonts --skip-nodejs --skip-rust
```

### Post-Installation

```bash
nvim +checkhealth
nvim +Lazy
nvim +Mason
```

## Maintenance

```bash
make health   # Run health checks
make format   # Format Lua code
make lint     # Lint code
make profile  # Profile startup time
```

## Requirements

- Neovim 0.10.0+
- Git
- Internet connection

The installer automatically handles dependencies including Node.js, Python, build tools, ripgrep, fd, bat, and JetBrains Mono Nerd Font.

Supported systems: Arch, Debian, Ubuntu, Fedora, openSUSE, macOS

## Troubleshooting

### Installation Issues

Check logs:
```bash
cat ~/.cache/lexitron-nvim-installer/install_*.log
cat ~/.cache/lexitron-nvim-installer/errors_*.log
```

Re-run:
```bash
./install.sh --verbose --force
./install.sh --skip-nodejs --skip-fonts
```

Manual installation:

```bash
nvim +Mason  # LSP servers
sudo pacman -S ripgrep fd bat tree-sitter  # Arch
sudo apt install ripgrep fd-find bat       # Debian/Ubuntu
```

### Plugin Issues

```bash
nvim +Lazy
nvim "+Lazy sync"
nvim +checkhealth
```

### LSP Issues

```bash
nvim +LspInfo
nvim +Mason
nvim "+checkhealth mason"
```

### Backup and Recovery

```bash
ls ~/.local/share/lexitron-nvim-backups/
cp -r ~/.local/share/lexitron-nvim-backups/nvim_config_* ~/.config/nvim

# Clean install
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim
./install.sh
```

## Structure

```
lua/
├── core/        Options, keymaps, autocmds
├── lsp/         LSP setup, Mason
├── navigation/  Telescope, Neo-tree, Oil
├── editor/      Treesitter, formatting
├── ui/          Dashboard, statusline, themes
└── utils/       Utilities
```

## License

MIT
