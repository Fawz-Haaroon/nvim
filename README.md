<div align="center">


       ██╗     ███████╗██╗  ██╗██╗████████╗██████╗  ██████╗ ███╗   ██╗
       ██║     ██╔════╝╚██╗██╔╝██║╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║
       ██║     █████╗   ╚███╔╝ ██║   ██║   ██████╔╝██║   ██║██╔██╗ ██║
       ██║     ██╔══╝   ██╔██╗ ██║   ██║   ██╔══██╗██║   ██║██║╚██╗██║
       ███████╗███████╗██╔╝ ██╗██║   ██║   ██║  ██║╚██████╔╝██║ ╚████║
       ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝


### A blazingly fast Neovim configuration


[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1+-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](http://www.lua.org)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![Stars](https://img.shields.io/github/stars/Fawz-Haaroon/nvim?style=for-the-badge&color=orange)](https://github.com/Fawz-Haaroon/nvim/stargazers)

[![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/macos/)
[![Arch](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)

[Features](#features) • [Installation](#installation) • [Documentation](#documentation) • [Troubleshooting](#troubleshooting)

</div>

---

## Features

<table>
<tr>
<td width="50%">

### Performance
- Lazy loading for instant startup
- Async plugin management
- Optimized treesitter parsers
- Fast LSP with native client
- Sub-50ms startup time

</td>
<td width="50%">

### UI/UX
- 20+ premium themes
- Custom statusline & tabline
- File explorer (Neo-tree & Oil)
- Dashboard with quick actions
- Smooth animations

</td>
</tr>
<tr>
<td>

### Development
- LSP for 15+ languages
- Intelligent auto-completion
- Inline diagnostics & linting
- Git integration (Fugitive, Gitsigns)
- Debugging support (DAP)

</td>
<td>

### Tools
- Fuzzy finder (Telescope)
- Terminal integration (Toggleterm)
- Project management
- Session persistence
- Snippet engine (LuaSnip)

</td>
</tr>
</table>

## Installation

### Quick Start

```bash
git clone https://github.com/Fawz-Haaroon/nvim.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```

The installer automatically handles:
- Neovim installation (0.10+)
- All dependencies (Node.js, Python, Rust, Go)
- 110+ plugins via Lazy.nvim
- LSP servers via Mason
- JetBrains Mono Nerd Font
- Development tools (ripgrep, fd, bat, tree-sitter)

### Advanced Options

<table>
<tr>
<td>

**Verbose Installation**
```bash
./install.sh --verbose
```

**Dry Run**
```bash
./install.sh --dry-run
```

</td>
<td>

**Force Reinstall**
```bash
./install.sh --force
```

**Skip Components**
```bash
./install.sh --skip-fonts
```

</td>
</tr>
</table>

### Verify Installation

```bash
nvim +checkhealth  # Run health checks
nvim +Lazy         # Manage plugins
nvim +Mason        # Install LSP servers
```

## Documentation

- **[User Guide](docs/Guide.md)** - Complete keybindings, workflows, and usage tips
- **[Technical Reference](docs/Reference.md)** - Architecture, plugins, and troubleshooting

## Maintenance

| Command | Description |
|---------|-------------|
| `make health` | Run comprehensive health checks |
| `make format` | Format all Lua code with Stylua |
| `make lint` | Lint code and check for issues |
| `make profile` | Profile and optimize startup time |

## Requirements

### Core Requirements

| Component | Version | Auto-Installed |
|-----------|---------|----------------|
| Neovim | 0.10.0+ | ✓ |
| Git | Latest | Required |
| Internet | - | Required |

### Optional Components (Auto-Installed)

| Component | Purpose | Skip Flag |
|-----------|---------|----------|
| Node.js | JavaScript LSP & tools | `--skip-nodejs` |
| Python | Python LSP & pynvim | `--skip-python` |
| Rust | Rust analyzer | `--skip-rust` |
| Go | Go LSP | `--skip-go` |
| Nerd Fonts | Icons & symbols | `--skip-fonts` |

### Supported Systems

- Arch Linux
- Debian / Ubuntu
- Fedora
- openSUSE
- macOS

## Troubleshooting

<details>
<summary><b>Installation Issues</b></summary>

**Check installation logs:**
```bash
cat ~/.cache/lexitron-nvim-installer/install_*.log
cat ~/.cache/lexitron-nvim-installer/errors_*.log
```

**Retry with verbose output:**
```bash
./install.sh --verbose --force
./install.sh --skip-nodejs --skip-fonts  # Skip problematic components
```

**Manual dependency installation:**
```bash
# Arch Linux
sudo pacman -S ripgrep fd bat tree-sitter neovim nodejs python rust

# Debian/Ubuntu
sudo apt install ripgrep fd-find bat neovim nodejs python3 rustc

# macOS
brew install ripgrep fd bat tree-sitter neovim node python rust
```

</details>

<details>
<summary><b>Plugin Issues</b></summary>

**Sync and update plugins:**
```bash
nvim "+Lazy sync"       # Sync all plugins
nvim +Lazy              # Open plugin manager UI
nvim +checkhealth       # Check plugin health
```

**Clear plugin cache:**
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
nvim +Lazy restore
```

</details>

<details>
<summary><b>LSP Issues</b></summary>

**Check LSP status:**
```bash
nvim +LspInfo                   # Current LSP status
nvim +Mason                     # Manage LSP servers
nvim "+checkhealth mason"       # Mason health check
nvim "+checkhealth lspconfig"   # LSP config health
```

**Reinstall LSP server:**
```bash
nvim "+MasonUninstall <server>"  # Uninstall
nvim "+MasonInstall <server>"    # Reinstall
```

</details>

<details>
<summary><b>Backup & Recovery</b></summary>

**List available backups:**
```bash
ls -lh ~/.local/share/lexitron-nvim-backups/
```

**Restore from backup:**
```bash
cp -r ~/.local/share/lexitron-nvim-backups/nvim_config_<timestamp> ~/.config/nvim
```

**Clean reinstall:**
```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim
git clone https://github.com/Fawz-Haaroon/nvim.git ~/.config/nvim
cd ~/.config/nvim && ./install.sh
```

</details>

## Project Structure

```
lexitron.nvim/
├── lua/
│   ├── core/           Core configuration (options, keymaps, autocmds)
│   ├── lsp/            LSP setup, Mason, and diagnostics
│   ├── navigation/     File navigation (Telescope, Neo-tree, Oil)
│   ├── editor/         Editor features (Treesitter, formatting)
│   ├── ui/             UI components (statusline, themes, dashboard)
│   └── utils/          Helper functions and utilities
├── docs/               Complete documentation
├── install.sh          Automated installation script
├── Makefile            Development commands
└── README.md           This file
```

## Contributing

Contributions, issues, and feature requests are welcome!

[![Issues](https://img.shields.io/github/issues/Fawz-Haaroon/nvim?style=flat-square)](https://github.com/Fawz-Haaroon/nvim/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/Fawz-Haaroon/nvim?style=flat-square)](https://github.com/Fawz-Haaroon/nvim/pulls)

## License

MIT License - see [LICENSE](LICENSE) for details

---

<div align="center">

**Made by developers, for developers**

[Report Bug](https://github.com/Fawz-Haaroon/nvim/issues) • [Request Feature](https://github.com/Fawz-Haaroon/nvim/issues) • [Star the Repo](https://github.com/Fawz-Haaroon/nvim/stargazers)

</div>
