# Lexitron.nvim — Professional Neovim Distribution

> **Clean, fast, and quiet.** Batteries included. Production-ready IDE with 110+ plugins, LSP for 15+ languages, and comprehensive documentation.

## 📚 Documentation

- **[Guide](docs/guide.md)** — 250+ keybindings organized by category (Navigation, LSP, Git, Telescope, etc.)
- **[Reference](docs/reference.md)** — Architecture, LSP servers, formatters, linters, plugins, troubleshooting
- **[Keymaps](docs/guide.md#quick-reference)** — Quick reference table

## 🎯 Quick Start

### Installation

```bash
# Clone or update
cd ~/.config
git clone https://github.com/yourusername/nvim.git nvim
cd nvim

# Run health check
make health

# Format code (optional)
make format
```

### First Time

1. Open Neovim: `nvim`
2. Plugins auto-install via lazy.nvim
3. Install LSP servers: `:Mason`
4. Discover keybindings: `<leader>fk` (Telescope)
5. Read the guide: `docs/guide.md`

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

## 📋 Requirements

- **Neovim** 0.10+ (use `:version` to check)
- **Git** (to clone config)
- **External tools** (optional but recommended):
  - `fd`, `rg` — faster file/text search
  - `bat` — syntax highlighting in previews
  - `lazygit` — Git UI
  - `node`, `python3` — LSP servers
  - `stylua`, `luacheck` — Lua formatting/linting

## ❓ Troubleshooting

### Dashboard not showing?
- `nvim` (no args) should show dashboard
- Check: `:set filetype?` should be `snacks_dashboard`

### LSP not attaching?
1. `:LspInfo` — see active servers
2. `:MasonInstall <server-name>` — install missing server
3. `:checkhealth lsp` — diagnose issues

### Telescope slow?
- Install `fd` or `rg`: `pacman -S fd ripgrep` (Arch)
- Try: `:Telescope find_files` vs `:Telescope find_files hidden=true`

### See full troubleshooting
- `docs/reference.md#troubleshooting`

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
