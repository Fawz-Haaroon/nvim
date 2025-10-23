# Lexitron.nvim — Professional Neovim Distribution

> **Clean, fast, and quiet.** Batteries included. Production-ready IDE with 110+ plugins, LSP for 15+ languages, and comprehensive documentation.

## 📚 Documentation

- **[Guide](docs/guide.md)** — 250+ keybindings organized by category (Navigation, LSP, Git, Telescope, etc.)
- **[Reference](docs/reference.md)** — Architecture, LSP servers, formatters, linters, plugins, troubleshooting
- **[Keymaps](docs/guide.md#quick-reference)** — Quick reference table

## 🚀 Quick Start

### 🎯 One-Line Installation

```bash
# Download and run the ultimate installer
curl -fsSL https://raw.githubusercontent.com/yourusername/nvim/main/install.sh | bash
```

### 🛠️ Manual Installation

```bash
# Clone the repository
cd ~/.config
git clone https://github.com/yourusername/nvim.git nvim
cd nvim

# Run the bulletproof installer
./install.sh
```

### 🎛️ Advanced Installation Options

```bash
# Verbose installation with detailed logging
./install.sh --verbose

# Force installation (overwrite existing config)
./install.sh --force

# Preview what will be installed (dry run)
./install.sh --dry-run

# Skip specific components
./install.sh --skip-fonts --skip-nodejs --skip-rust

# Environment variables for automation
SKIP_FONTS=true VERBOSE=true ./install.sh
```

### ✨ First Launch

1. Start Neovim: `nvim`
2. Plugins auto-install via lazy.nvim ⚡
3. LSP servers auto-install via Mason 🔧
4. Enjoy your legendary development environment! 🎊

### 🔍 Post-Installation

```bash
# Health check
nvim +checkhealth +qall

# Plugin manager
nvim +Lazy

# LSP/tool manager
nvim +Mason

# Keybinding discovery
# In Neovim: <leader>fk
```

## ⚡ Features

- **UI** — Dashboard (skull theme), Lualine, custom tabline, 15+ colorschemes, transparency
- **Navigation** — Telescope, Neo-tree, Oil, Harpoon, Flash, Aerial
- **Editing** — Treesitter (70+ languages), Surround, Comment, Multicursor, Refactoring
- **LSP** — 15+ servers (Lua, TypeScript, Python, Rust, Go, C/C++, etc.), auto-attach, minimal diagnostics
- **Git** — Gitsigns, Neogit, Diffview, GitBrowse
- **Completion** — Blink.cmp + LSP + snippets
- **Debug** — DAP with UI, Neotest
- **Performance** — ~65ms startup, lazy-loaded plugins, optimized for large files

## 🛠️ Maintenance

```bash
# Health check
make health

# Format Lua code
make format

# Lint code
make lint

# Profile startup
make profile

# Install tools (stylua, luacheck)
make install

# Clean temp files
make clean
```

## 📋 System Requirements

### Minimum Requirements
- **Operating System**: Linux (Arch, Debian, Ubuntu, Fedora, openSUSE) or macOS
- **Neovim**: 0.10.0+ (automatically installed by the script)
- **Internet Connection**: Required for downloading packages and plugins
- **Disk Space**: ~500MB free space
- **Memory**: 2GB RAM minimum (4GB recommended)

### Automatically Installed Dependencies
The installer handles everything automatically:

#### Core Tools
- **Build Tools**: GCC/Clang, CMake, Make
- **Version Control**: Git
- **Archive Tools**: unzip, tar, rsync
- **Network Tools**: curl, wget

#### Neovim Ecosystem
- **Plugin Manager**: lazy.nvim
- **LSP Manager**: Mason.nvim with 30+ language servers
- **Tree-sitter**: CLI and parsers for syntax highlighting
- **Python Provider**: Isolated virtual environment with pynvim

#### Development Runtimes
- **Node.js 20 LTS**: TypeScript/JavaScript LSP servers
- **Python 3**: Python development and Neovim provider
- **Go**: (optional) Go development
- **Rust**: (optional) Rust development with rust-analyzer

#### Essential CLI Tools
- **ripgrep (rg)**: Lightning-fast text search
- **fd**: Modern find replacement
- **bat**: Syntax-highlighted cat replacement
- **JetBrains Mono Nerd Font**: Icons and glyphs support

#### Optional Enhancements
- **Clipboard Tools**: xclip, wl-clipboard (Linux)
- **Image Preview**: chafa, ImageMagick, poppler, ffmpeg
- **Debuggers**: gdb, lldb
- **Terminal**: Kitty (recommended for image preview)
- **File Management**: trash-cli

### Supported Package Managers
- **Arch Linux**: pacman
- **Debian/Ubuntu**: apt-get (with PPA support)
- **Fedora**: dnf
- **CentOS/RHEL**: yum
- **openSUSE**: zypper
- **macOS**: Homebrew

## 🔧 Installation Troubleshooting

### Installation Failed?

#### Check Installation Logs
```bash
# View installation logs
ls -la ~/.cache/lexitron-nvim-installer/
cat ~/.cache/lexitron-nvim-installer/install_*.log

# View error logs
cat ~/.cache/lexitron-nvim-installer/errors_*.log
```

#### Re-run Installation
```bash
# Re-run with verbose logging
./install.sh --verbose --force

# Skip problematic components
./install.sh --skip-nodejs --skip-fonts

# Check what would be installed
./install.sh --dry-run
```

#### Manual Component Installation
If specific components fail:

```bash
# Install missing LSP servers manually
nvim +Mason

# Install missing tools manually
sudo pacman -S ripgrep fd bat tree-sitter  # Arch
sudo apt install ripgrep fd-find bat        # Ubuntu/Debian

# Install Node.js manually
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs  # Ubuntu/Debian
```

### System-Specific Issues

#### Debian/Ubuntu
- **Node.js too old**: Installer uses NodeSource repository for Node.js 20
- **fd command not found**: Install creates `fd` symlink from `fdfind`
- **bat command not found**: Install creates `bat` symlink from `batcat`
- **Neovim too old**: Installer adds neovim-ppa for latest version

#### Arch Linux
- **Base-devel not installed**: Installer installs build tools automatically
- **Rust conflicts**: Use `--skip-rust` if you have custom Rust setup

#### macOS
- **Xcode Command Line Tools**: Installer prompts for installation
- **Homebrew permissions**: Ensure proper Homebrew setup
- **Font installation**: Uses homebrew/cask-fonts tap

### Network Issues
```bash
# Test internet connectivity
curl -I https://github.com

# Use different mirrors (China users)
export GITHUB_MIRROR="https://github.com.cnpmjs.org"

# Install with retries
for i in {1..3}; do ./install.sh && break; done
```

## 🩺 Neovim Troubleshooting

### Plugin Issues
```bash
# Check plugin status
nvim +Lazy

# Sync all plugins
nvim "+Lazy sync" +qall

# Clean and reinstall plugins
nvim "+Lazy clean" "+Lazy sync" +qall

# Check plugin health
nvim +checkhealth +qall
```

### LSP Issues
```bash
# Check LSP server status
nvim +LspInfo

# Install missing LSP servers
nvim +Mason

# Check Mason health
nvim "+checkhealth mason" +qall

# Restart LSP servers
# In Neovim: <leader>cR
```

### Performance Issues
```bash
# Profile startup time
nvim --startuptime startup.log +qall
cat startup.log

# Check for slow plugins
nvim "+Lazy profile" +qall

# Disable specific plugins temporarily
# Edit ~/.config/nvim/lazy-lock.json
```

### Font and Display Issues
- **Icons not showing**: Install JetBrains Mono Nerd Font
- **Colors wrong**: Check terminal true color support
- **Transparency not working**: Ensure terminal supports transparency

```bash
# Test true color support
curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash

# Check font installation
fc-match "JetBrains Mono Nerd Font"

# Manual font installation
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -f
```

### Backup and Recovery
```bash
# View available backups
ls -la ~/.local/share/lexitron-nvim-backups/

# Restore from backup
cp -r ~/.local/share/lexitron-nvim-backups/nvim_config_* ~/.config/nvim

# Clean installation
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
./install.sh
```

### Getting Help
1. **Check health**: `nvim +checkhealth`
2. **Review logs**: `~/.cache/lexitron-nvim-installer/`
3. **Search issues**: GitHub repository issues
4. **Create issue**: Include logs and system info

```bash
# Gather system info for bug reports
uname -a
nvim --version
echo $SHELL
echo $TERM
```

## 📊 Stats

- **Startup:** ~65ms (lazy-loaded)
- **Plugins:** 110+
- **Keybindings:** 250+
- **Lines of code:** 8K+
- **LSP Servers:** 15+ configured
- **Formatters:** 9 languages
- **Supported languages:** 70+

## 🔧 Configuration

All config is modular:

```
lua/
├── core/          — Options, keymaps, autocmds, plugins
├── lsp/           — LSP setup, Mason
├── navigation/    — Telescope, Neo-tree, Oil, etc.
├── editor/        — Treesitter, surround, formatting
├── ui/            — Dashboard, statusline, themes
└── utils/         — Utilities
```

Edit any file in `lua/` and Neovim reloads automatically.

## 📝 License

MIT — See LICENSE

## 🎉 You're All Set!

Run `make health` to validate your setup, then start editing.

```bash
# Validate
make health

# Update plugins
:Lazy update

# Check health
:checkhealth
```

**Welcome to your legendary development environment!** 🚀
