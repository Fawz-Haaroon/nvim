# Lexitron.nvim — Technical Reference

> **Complete architecture, LSP servers, plugins, and configuration details**

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [LSP & Tooling](#lsp--tooling)
- [Plugin Inventory](#plugin-inventory)
- [File Structure](#file-structure)
- [Commands](#commands)
- [Autocommands](#autocommands)
- [Features](#features)

---

## Architecture Overview

### Directory Structure

```
~/.config/nvim/
├── init.lua                    # Bootstrap entry point
├── lua/
│   ├── core/                   # Core configuration
│   │   ├── init.lua           # Core module loader
│   │   ├── options.lua        # Vim options (UI, behavior, performance)
│   │   ├── keymaps.lua        # Base keybindings
│   │   ├── functional-keymaps.lua  # Plugin-dependent keymaps
│   │   ├── autocmds.lua       # Autocommands
│   │   └── lazy.lua           # Plugin manager setup
│   │
│   ├── completion/             # Autocompletion
│   │   ├── blink-enhanced.lua # Blink.cmp configuration
│   │   └── copilot.lua        # GitHub Copilot
│   │
│   ├── lsp/                    # Language Server Protocol
│   │   ├── init.lua           # LSP loader
│   │   ├── lspconfig-ultimate.lua  # All LSP server configs
│   │   ├── mason.lua          # LSP/tool installer
│   │   ├── utils.lua          # LSP utilities (toggle, etc.)
│   │   ├── trouble.lua        # Diagnostics UI
│   │   └── actions-preview.lua # Code actions preview
│   │
│   ├── navigation/             # File & code navigation
│   │   ├── telescope-fixed.lua # Fuzzy finder
│   │   ├── harpoon.lua        # Quick file marks
│   │   ├── oil.lua            # Directory editor
│   │   ├── neo-tree-enhanced.lua # File tree
│   │   ├── flash.lua          # Jump navigation
│   │   └── aerial.lua         # Symbol outline
│   │
│   ├── editor/                 # Editing enhancements
│   │   ├── treesitter-ultimate.lua # Syntax highlighting
│   │   ├── autopairs.lua      # Auto close brackets
│   │   ├── comment.lua        # Smart commenting
│   │   ├── surround.lua       # Surround operations
│   │   ├── formatting.lua     # Format-on-save
│   │   ├── multicursor.lua    # Multiple cursors
│   │   ├── refactoring.lua    # Code refactoring
│   │   ├── spectre.lua        # Find & replace
│   │   ├── dial.lua           # Enhanced increment/decrement
│   │   └── todo-comments.lua  # TODO highlighting
│   │
│   ├── git/                    # Git integration
│   │   ├── init.lua           # Git loader
│   │   ├── gitsigns.lua       # Git signs & hunks
│   │   ├── neogit.lua         # Git UI
│   │   ├── diffview.lua       # Diff viewer
│   │   └── lazygit.lua        # LazyGit integration
│   │
│   ├── debugging/              # Debugging tools
│   │   ├── dap.lua            # Debug Adapter Protocol
│   │   ├── dap-ui.lua         # DAP UI
│   │   └── neotest.lua        # Test runner
│   │
│   ├── ui/                     # User interface
│   │   ├── snacks-dashboard.lua # Startup dashboard
│   │   ├── lualine.lua        # Statusline
│   │   ├── comfy-tabline.lua  # Buffer tabline
│   │   ├── themes.lua         # Theme collection
│   │   ├── themes-enhanced.lua # Additional themes
│   │   ├── tokyo-enhanced.lua # Tokyo Night tweaks
│   │   ├── which-key.lua      # Keybinding hints
│   │   ├── noice.lua          # UI enhancements
│   │   ├── notify.lua         # Notifications
│   │   ├── dressing.lua       # UI select/input
│   │   ├── indent-blankline.lua # Indent guides
│   │   ├── rainbow-delimiters.lua # Rainbow brackets
│   │   ├── colorizer.lua      # Color highlighting
│   │   ├── breadcrumbs.lua    # Code breadcrumbs (navic)
│   │   ├── folds.lua          # Enhanced folding (UFO)
│   │   ├── zen-mode.lua       # Distraction-free mode
│   │   ├── minimap.lua        # Code minimap
│   │   ├── image.lua          # Image preview (Kitty)
│   │   ├── markdown-preview.lua # Markdown live preview
│   │   ├── transparency.lua   # UI transparency toggle
│   │   ├── highlights.lua     # Custom highlights
│   │   ├── workspace-tracker.lua # Workspace indicator
│   │   └── devicons.lua       # File icons
│   │
│   └── utils/                  # Utilities
│       ├── workspaces.lua     # Multi-session workspaces
│       ├── session.lua        # Session management
│       ├── project.lua        # Project detection
│       ├── python-venv.lua    # Python venv detection
│       ├── overseer.lua       # Task runner
│       ├── yanky.lua          # Clipboard history
│       └── toggleterm.lua     # Terminal integration
│
├── ftplugin/                   # Filetype-specific config
│   ├── lua.lua                # Lua settings
│   ├── python.lua             # Python settings (quiet mode)
│   └── cpp.lua                # C++ & competitive programming
│
├── colors/                     # Custom colorschemes
│   └── lexitron.lua           # Custom theme
│
├── snippets/                   # Code snippets
│   └── lua.lua                # Lua snippets
│
└── docs/                       # Documentation
    ├── Guide.md               # Keybindings guide
    └── Reference.md           # This file
```

### Configuration Philosophy

- **Modular**: Each feature in its own file
- **Lazy-loaded**: Plugins load only when needed (~65ms startup)
- **Silent**: No intrusive notifications unless errors occur
- **Professional**: Production-ready with comprehensive features
- **Performant**: Optimized for large files and projects

---

## LSP & Tooling

### Language Servers

| Language | Server | Auto-Install | Features |
|----------|--------|--------------|----------|
| **TypeScript/JavaScript** | `ts_ls` | ✅ | Completion, diagnostics, inlay hints, refactoring |
| **Python** | `pyright` | ✅ | Type checking (openFilesOnly), completion |
| **Lua** | `lua_ls` | ✅ | Neovim API completion, inlay hints, diagnostics |
| **Rust** | `rust_analyzer` | ✅ | Full Clippy, cargo features, inlay hints |
| **Go** | `gopls` | ✅ | Go modules, imports, diagnostics |
| **C/C++** | `clangd` | ✅ | Clang-tidy, header insertion, completion |
| **Java** | `jdtls` | ✅ | Maven/Gradle, debugging, refactoring |
| **C#** | `omnisharp` | ✅ | .NET support, refactoring |
| **Ruby** | `solargraph` | ✅ | Ruby gems, documentation |
| **PHP** | `phpactor` | ✅ | PHP completion, refactoring |
| **HTML** | `html` | ✅ | HTML5, Emmet completion |
| **CSS** | `cssls` | ✅ | CSS3, SCSS support |
| **Tailwind** | `tailwindcss` | ✅ | Class completion, color preview |
| **Emmet** | `emmet_ls` | ✅ | Emmet abbreviations |
| **Svelte** | `svelte` | ✅ | Svelte framework |
| **JSON** | `jsonls` | ✅ | JSON schema validation |
| **YAML** | `yamlls` | ✅ | YAML schema validation |
| **Markdown** | `marksman` | ✅ | Markdown navigation, completion |
| **Bash** | `bashls` | ✅ | Shell script diagnostics |
| **Docker** | `dockerls` | ✅ | Dockerfile completion |
| **Terraform** | `terraformls` | ✅ | HCL syntax, validation |
| **ESLint** | `eslint` | ✅ | JavaScript/TypeScript linting |

### Formatters

| Language | Formatter | Auto-Install | Command |
|----------|-----------|--------------|---------|
| **Lua** | stylua | ✅ | `stylua --search-parent-directories` |
| **TypeScript/JavaScript** | prettier | ✅ | `prettier --parser typescript/babel` |
| **Python** | black (disabled) | ❌ | Quiet mode - no formatting |
| **Rust** | rustfmt | ✅ | `cargo fmt` |
| **Go** | gofumpt, goimports | ✅ | Go formatting with imports |
| **C/C++** | clang-format | ✅ | Via clangd |
| **JSON/YAML** | prettier | ✅ | `prettier --parser json/yaml` |
| **Shell** | shfmt | ✅ | Shell script formatting |

### Linters

| Language | Linter | Auto-Install | Purpose |
|----------|--------|--------------|---------|
| **TypeScript/JavaScript** | eslint_d | ✅ | Fast ESLint daemon |
| **Shell** | shellcheck | ✅ | Shell script linting |
| **Docker** | hadolint | ✅ | Dockerfile linting |
| **Markdown** | markdownlint | ✅ | Markdown style checking |
| **YAML** | yamllint | ✅ | YAML syntax checking |

### Debuggers

| Language | Debugger | Auto-Install | Notes |
|----------|----------|--------------|-------|
| **Python** | debugpy | ✅ | Python DAP adapter |
| **Rust/C/C++** | codelldb | ✅ | LLDB-based debugger |
| **Go** | delve | ✅ | Go debugger |
| **JavaScript/TypeScript** | js-debug-adapter | ✅ | Node.js debugging |

### Special LSP Features

#### Python - Quiet Mode
- **Default**: LSP disabled, no diagnostics
- **Philosophy**: Avoid style noise, focus on code
- **Toggle**: `<leader>pE` (enable), `<leader>pD` (disable)

#### Diagnostics
- **Virtual text**: Disabled (cleaner UI)
- **Signs**: Disabled (minimal signcolumn)
- **Floating window**: Available on demand (`<leader>cd`)
- **Trouble**: Full diagnostics UI (`<leader>xx`)

#### Inlay Hints
- **TypeScript**: Parameter names, types, return types
- **Lua**: Type hints for Neovim API
- **Rust**: Full type information, lifetimes
- **Toggle**: `<leader>ch`

---

## Plugin Inventory

### Completion (2 plugins)
- **saghen/blink.cmp** - VS Code-like completion with LSP, snippets, emoji
- **zbirenbaum/copilot.lua** - GitHub Copilot AI assistance

### LSP (4 plugins)
- **neovim/nvim-lspconfig** - LSP client configurations
- **mason-org/mason.nvim** - LSP/tool installer UI
- **folke/trouble.nvim** - Diagnostics, references, quickfix UI
- **aznhe21/actions-preview.nvim** - Code actions preview

### Navigation (6 plugins)
- **nvim-telescope/telescope.nvim** - Fuzzy finder for files, grep, LSP
- **ThePrimeagen/harpoon** - Quick file marking (v2)
- **stevearc/oil.nvim** - Edit directories like buffers
- **nvim-neo-tree/neo-tree.nvim** - File tree explorer
- **folke/flash.nvim** - Jump to any location
- **stevearc/aerial.nvim** - Symbol outline sidebar

### Editor (10 plugins)
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting (70+ languages)
- **windwp/nvim-autopairs** - Auto close brackets
- **numToStr/Comment.nvim** - Smart commenting
- **kylechui/nvim-surround** - Add/change/delete surroundings
- **stevearc/conform.nvim** - Format-on-save
- **mg979/vim-visual-multi** - Multiple cursors
- **ThePrimeagen/refactoring.nvim** - Code refactoring operations
- **nvim-pack/nvim-spectre** - Find and replace across project
- **monaqa/dial.nvim** - Enhanced increment/decrement
- **folke/todo-comments.nvim** - Highlight TODO, FIXME, etc.

### Git (4 plugins)
- **lewis6991/gitsigns.nvim** - Git signs, hunks, blame
- **NeogitOrg/neogit** - Magit-like Git UI
- **sindrets/diffview.nvim** - Git diff and file history
- **kdheepak/lazygit.nvim** - LazyGit terminal integration

### Debugging (3 plugins)
- **mfussenegger/nvim-dap** - Debug Adapter Protocol
- **rcarriga/nvim-dap-ui** - DAP UI with scopes, watches, console
- **nvim-neotest/neotest** - Test runner UI

### UI (24 plugins)
- **folke/snacks.nvim** - Dashboard with skull ASCII art
- **nvim-lualine/lualine.nvim** - Statusline with arrows, breadcrumbs
- **Custom comfy-tabline** - Buffer tabs with workspace indicator
- **folke/tokyonight.nvim** - Tokyo Night theme (default)
- **catppuccin/nvim** - Catppuccin theme
- **rose-pine/neovim** - Rose Pine theme
- **ellisonleao/gruvbox.nvim** - Gruvbox theme
- **nyoom-engineering/oxocarbon.nvim** - Oxocarbon theme
- **rebelot/kanagawa.nvim** - Kanagawa theme
- **lunarvim/synthwave84.nvim** - Synthwave84 theme
- **marko-cerovac/material.nvim** - Material theme
- **zaldih/themery.nvim** - Theme switcher UI
- **folke/which-key.nvim** - Keybinding hints
- **folke/noice.nvim** - Enhanced cmdline, messages, notifications
- **rcarriga/nvim-notify** - Notification manager
- **stevearc/dressing.nvim** - Better vim.ui.select/input
- **lukas-reineke/indent-blankline.nvim** - Indentation guides
- **HiPhish/rainbow-delimiters.nvim** - Rainbow bracket matching
- **NvChad/nvim-colorizer.lua** - Inline color preview
- **SmiteshP/nvim-navic** - Breadcrumbs (LSP context)
- **kevinhwang91/nvim-ufo** - Enhanced folding UI
- **folke/zen-mode.nvim** - Distraction-free mode
- **gorbit99/codewindow.nvim** - Code minimap
- **3rd/image.nvim** - Image preview (Kitty terminal)
- **iamcco/markdown-preview.nvim** - Live Markdown preview
- **nvim-tree/nvim-web-devicons** - File icons
- **Custom transparency.lua** - Runtime transparency toggle
- **Custom highlights.lua** - Custom theme tweaks

### Utils (7 plugins)
- **Custom workspaces.lua** - Named multi-session workspaces
- **rmagatti/auto-session** - Session management
- **ahmedkhalf/project.nvim** - Project detection
- **Custom python-venv.lua** - Python venv auto-detection
- **stevearc/overseer.nvim** - Task runner (build, test, run)
- **gbprod/yanky.nvim** - Clipboard history
- **akinsho/toggleterm.nvim** - Terminal integration

**Total**: 60+ plugins (110+ including dependencies)

---

## File Structure

### Core Files

| File | Purpose | Key Features |
|------|---------|--------------|
| `init.lua` | Bootstrap entry point | Disables default vim plugins, sets Python provider, loads core |
| `lua/core/options.lua` | Vim options | 200+ options: UI, performance, editing, persistence |
| `lua/core/keymaps.lua` | Base keybindings | Navigation, editing, windows, tabs, buffers |
| `lua/core/functional-keymaps.lua` | Plugin keymaps | Telescope, Harpoon, LSP, Git, debugging |
| `lua/core/autocmds.lua` | Autocommands | Cursor position, trailing whitespace, large files |
| `lua/core/lazy.lua` | Plugin manager | Lazy-loading, performance optimization |

### Completion

| File | Header | Purpose |
|------|--------|---------|
| `lua/completion/blink-enhanced.lua` | ⚡ BLINK ENHANCED | VS Code-like completion with Catppuccin colors |
| `lua/completion/copilot.lua` | 🤖 COPILOT | GitHub Copilot with toggle commands |

### LSP

| File | Header | Purpose |
|------|--------|---------|
| `lua/lsp/lspconfig-ultimate.lua` | 🚀 ULTIMATE LSP CONFIG | 20+ LSP servers with full configuration |
| `lua/lsp/mason.lua` | 🔧 MASON CONFIG | Auto-install LSP servers and tools |
| `lua/lsp/utils.lua` | 🔧 LSP UTILITIES | Toggle LSP servers, Python LSP control |
| `lua/lsp/trouble.lua` | 👁 TROUBLE | Diagnostics UI |
| `lua/lsp/actions-preview.lua` | 🔍 ACTIONS PREVIEW | Code actions preview |

### Navigation

| File | Header | Purpose |
|------|--------|---------|
| `lua/navigation/telescope-fixed.lua` | 🔭 TELESCOPE FIXED | Image preview, all pickers |
| `lua/navigation/harpoon.lua` | 🎯 HARPOON | Quick file marks (v2) |
| `lua/navigation/oil.lua` | 🛢️ OIL NEXUS | Directory editor |
| `lua/navigation/neo-tree-enhanced.lua` | 🌳 NEO-TREE | File tree with curved UI |
| `lua/navigation/flash.lua` | ⚡ FLASH | Jump navigation |
| `lua/navigation/aerial.lua` | 🧭 AERIAL | Symbol outline |

### Editor

| File | Header | Purpose |
|------|--------|---------|
| `lua/editor/treesitter-ultimate.lua` | 🌳 ULTIMATE TREESITTER | 70+ languages, text objects |
| `lua/editor/autopairs.lua` | 🔗 AUTOPAIRS | Auto close brackets |
| `lua/editor/comment.lua` | 💬 COMMENT | Context-aware commenting |
| `lua/editor/surround.lua` | 🔄 SURROUND | Add/change/delete surrounds |
| `lua/editor/formatting.lua` | 🧼 CONFORM.NVIM | Format-on-save |
| `lua/editor/multicursor.lua` | 🎮 MULTICURSOR | Multiple cursors |
| `lua/editor/refactoring.lua` | 🔧 REFACTORING | Extract function/variable |
| `lua/editor/spectre.lua` | 🔍 SPECTRE | Find & replace |
| `lua/editor/dial.lua` | ⏲️ DIAL | Increment/decrement |
| `lua/editor/todo-comments.lua` | 📝 TODO COMMENTS | Highlight todos |

### Git

| File | Header | Purpose |
|------|--------|---------|
| `lua/git/gitsigns.lua` | 📊 GITSIGNS | Git signs, hunks |
| `lua/git/neogit.lua` | 🔀 NEOGIT | Git UI |
| `lua/git/diffview.lua` | 📜 DIFFVIEW | Diff viewer |
| `lua/git/lazygit.lua` | 🦥 LAZYGIT | LazyGit integration |

### Debugging

| File | Header | Purpose |
|------|--------|---------|
| `lua/debugging/dap.lua` | 🐛 DAP | Debug Adapter Protocol |
| `lua/debugging/dap-ui.lua` | 🎯 DAP UI | Debug UI |
| `lua/debugging/neotest.lua` | 🧪 NEOTEST | Test runner |

### UI

| File | Header | Purpose |
|------|--------|---------|
| `lua/ui/snacks-dashboard.lua` | 🍿 SNACKS DASHBOARD | Skull ASCII startup |
| `lua/ui/lualine.lua` | ✨ TOKYONIGHT LUALINE | Statusline with arrows |
| `lua/ui/comfy-tabline.lua` | 🗂️ COMFY TABLINE | Buffer tabs |
| `lua/ui/themes.lua` | 🎆 THEME COLLECTION | 8+ themes |
| `lua/ui/themes-enhanced.lua` | 🎨 ENHANCED THEMES | Additional vibrant themes |
| `lua/ui/tokyo-enhanced.lua` | 🌙 TOKYO ENHANCED | Tokyo Night tweaks |
| `lua/ui/which-key.lua` | 🗝️ WHICH-KEY | Keybinding hints |
| `lua/ui/noice.lua` | 🔮 NOICE | Enhanced UI |
| `lua/ui/notify.lua` | 📢 NOTIFY | Notifications |
| `lua/ui/dressing.lua` | 👔 DRESSING | Better UI select |
| `lua/ui/indent-blankline.lua` | 📏 INDENT BLANKLINE | Indent guides |
| `lua/ui/rainbow-delimiters.lua` | 🌈 RAINBOW DELIMITERS | Rainbow brackets |
| `lua/ui/colorizer.lua` | 🎨 COLORIZER | Color preview |
| `lua/ui/breadcrumbs.lua` | 🍞 BREADCRUMBS | LSP context |
| `lua/ui/folds.lua` | 📁 UFO FOLDS | Enhanced folding |
| `lua/ui/zen-mode.lua` | 🧘 ZEN MODE | Distraction-free |
| `lua/ui/minimap.lua` | 🗺️ MINIMAP | Code overview |
| `lua/ui/image.lua` | 🖼️ IMAGE.NVIM | Image preview |
| `lua/ui/markdown-preview.lua` | 📝 MARKDOWN PREVIEW | Live preview |
| `lua/ui/transparency.lua` | 🪟 TRANSPARENCY | Runtime toggle |
| `lua/ui/highlights.lua` | 🎨 HIGHLIGHTS | Custom colors |
| `lua/ui/workspace-tracker.lua` | 🧭 WORKSPACE TRACKER | Workspace indicator |
| `lua/ui/devicons.lua` | 🔣 DEVICONS | File icons |

### Utils

| File | Header | Purpose |
|------|--------|---------|
| `lua/utils/workspaces.lua` | 🗂️ WORKSPACES | Multi-session manager |
| `lua/utils/session.lua` | 🧭 PRO-LEVEL SESSIONS | Auto-save/restore |
| `lua/utils/project.lua` | 📁 PROJECT | Project detection |
| `lua/utils/python-venv.lua` | 🐍 PYTHON VENV | Venv auto-detection |
| `lua/utils/overseer.lua` | 🏃 OVERSEER | Task runner |
| `lua/utils/yanky.lua` | 📋 YANKY | Clipboard history |
| `lua/utils/toggleterm.lua` | 🧪 TOGGLETERM | Terminal |

### Filetype-Specific

| File | Purpose | Key Features |
|------|---------|--------------|
| `ftplugin/lua.lua` | Lua settings | Auto-format on save, run/source keymaps |
| `ftplugin/python.lua` | Python settings | Quiet mode (no LSP by default), run/test keymaps |
| `ftplugin/cpp.lua` | C++ settings | CP template, compile & run, debug with GDB |

---

## Commands

### Core
| Command | Description | Source |
|---------|-------------|--------|
| `:Docs` | Open keybindings guide | `core/init.lua` |

### Editor
| Command | Description | Source |
|---------|-------------|--------|
| `:Format` | Format current buffer | `editor/formatting.lua` |

### LSP
| Command | Description | Source |
|---------|-------------|--------|
| `:LspInfo` | Show LSP server info | Built-in |
| `:LspRestart` | Restart LSP servers | Built-in |
| `:Mason` | Open Mason installer | `lsp/mason.lua` |

### Git
| Command | Description | Source |
|---------|-------------|--------|
| `:Neogit` | Open Neogit | `git/neogit.lua` |
| `:LazyGit` | Open LazyGit | `git/lazygit.lua` |
| `:DiffviewOpen` | Open diff view | `git/diffview.lua` |
| `:DiffviewFileHistory` | Show file history | `git/diffview.lua` |
| `:DiffviewClose` | Close diff view | `git/diffview.lua` |

### Navigation
| Command | Description | Source |
|---------|-------------|--------|
| `:Telescope` | Open Telescope picker | `navigation/telescope-fixed.lua` |
| `:Oil` | Open Oil file browser | `navigation/oil.lua` |
| `:AerialToggle` | Toggle symbol outline | `navigation/aerial.lua` |

### UI
| Command | Description | Source |
|---------|-------------|--------|
| `:Themery` | Open theme switcher | `ui/themes.lua` |
| `:ZenMode` | Toggle zen mode | `ui/zen-mode.lua` |
| `:MinimapToggle` | Toggle minimap | `ui/minimap.lua` |
| `:MinimapOpen` | Open minimap | `ui/minimap.lua` |
| `:MinimapClose` | Close minimap | `ui/minimap.lua` |
| `:ColorizerToggle` | Toggle color highlighting | `ui/colorizer.lua` |
| `:NvimTransparencyToggle` | Toggle transparency | `ui/transparency.lua` |

### Workspaces & Sessions
| Command | Description | Source |
|---------|-------------|--------|
| `:WorkspaceNew` | Create new workspace | `utils/workspaces.lua` |
| `:WorkspaceSave` | Save workspace | `utils/workspaces.lua` |
| `:WorkspaceOpen` | Open workspace | `utils/workspaces.lua` |
| `:WorkspaceList` | List workspaces | `utils/workspaces.lua` |
| `:WorkspaceDelete` | Delete workspace | `utils/workspaces.lua` |
| `:WorkspaceRename` | Rename workspace | `utils/workspaces.lua` |
| `:WorkspaceSessions` | List sessions in workspace | `utils/workspaces.lua` |
| `:SessionList` | Search sessions (Telescope) | `utils/session.lua` |
| `:SessionSnapshotSave` | Save session snapshot | `utils/session.lua` |
| `:SessionSnapshotList` | List session snapshots | `utils/session.lua` |
| `:SessionSnapshotDelete` | Delete session snapshot | `utils/session.lua` |

### Python
| Command | Description | Source |
|---------|-------------|--------|
| `:PythonDetect` | Detect Python venv | `utils/python-venv.lua` |
| `:PythonSetup` | Setup Python provider | `utils/python-venv.lua` |

### Copilot
| Command | Description | Source |
|---------|-------------|--------|
| `:Copilot auth` | Authenticate Copilot | `completion/copilot.lua` |
| `:Copilot status` | Check Copilot status | `completion/copilot.lua` |
| `:CopilotToggle` | Toggle Copilot on/off | `completion/copilot.lua` |

### Plugin Management
| Command | Description | Source |
|---------|-------------|--------|
| `:Lazy` | Open Lazy plugin manager | `core/lazy.lua` |
| `:Lazy update` | Update plugins | `core/lazy.lua` |
| `:Lazy sync` | Sync plugins | `core/lazy.lua` |
| `:Lazy clean` | Clean unused plugins | `core/lazy.lua` |
| `:Lazy profile` | Profile plugin load times | `core/lazy.lua` |

---

## Autocommands

### Core (`core/autocmds.lua`)
- **Modifiable buffers**: Ensure all normal buffers are modifiable
- **Yank highlight**: Flash yanked text for 300ms
- **Trailing whitespace**: Remove on save
- **Cursor position**: Remember last position per file
- **Dynamic cursorline**: Hide in insert mode, show in normal
- **Auto-resize**: Balance splits on terminal resize
- **Auto-create directories**: Create parent dirs on buffer write
- **Large file optimization**: Disable syntax for files >1MB

### LSP (`lsp/lspconfig-ultimate.lua`)
- **LspAttach**: Setup keybindings, highlights, codelens on LSP attach
- **Document highlight**: Highlight symbol under cursor (debounced)
- **Codelens refresh**: Auto-refresh codelens on events

### Completion (`completion/blink-enhanced.lua`)
- **ColorScheme**: Reapply Blink highlight colors on theme change

### UI
- **ColorScheme**: Reapply custom highlights across all UI plugins
- **Winbar**: Clear winbar to prevent extra lines under tabline
- **Dashboard**: Special handling for startup screen

### Utils (`utils/python-venv.lua`)
- **DirChanged, VimEnter**: Auto-detect Python virtual environment
- **PythonVenvDetection**: Custom event for venv changes

---

## Features

### Startup Performance
- **Time**: ~65ms average
- **Method**: Lazy-loading with `lazy.nvim`
- **Optimization**: Native Lua loader, disabled default plugins

### Themes
**15+ colorschemes** with instant switching:
- Tokyo Night (Storm, Night, Moon, Day) - **Default**
- Catppuccin (Mocha, Macchiato, Frappe, Latte)
- Rose Pine (Main, Moon, Dawn)
- Gruvbox (Dark, Light)
- Oxocarbon
- Kanagawa (Wave, Dragon, Lotus)
- Synthwave84
- Material (Darker, Lighter, Oceanic, Palenight, Deep Ocean)

### Workspace & Session Management
**Tmux/Zellij-style workflow**:
- **Workspaces**: Named containers with multiple sessions
- **Sessions**: Auto-save/restore per-project and per-git-branch
- **Storage**: `~/.local/share/nvim/workspaces/<name>/`
- **Integration**: Closes UI panes (neo-tree, trouble) before save
- **Telescope**: Search and preview sessions

### Python Quiet Mode
**Philosophy**: Minimize diagnostic noise for Python development
- **Default**: LSP and diagnostics disabled
- **Reason**: Avoid style warnings (unused imports, type hints, etc.)
- **Enable**: `<leader>pE` or `:LspStart pyright`
- **Disable**: `<leader>pD` or detach LSP

### C++ Competitive Programming
**Quick compile & run workflow**:
- **Template**: Full CP template with macros (`<leader>ct`)
- **Compile & Run**: C++23 with optimizations (`<leader>cc`)
- **Debug**: Compile with `-g` and launch GDB (`<leader>cd`)
- **Settings**: 4-space indent, 120-char column

### Dashboard
**Skull ASCII art** with quick actions:
- Find files, new file, live grep, recent files
- Lazy, Mason, Mason install, update all
- Config, quit
- **Shortcuts**: `f`, `n`, `g`, `r`, `l`, `m`, `i`, `u`, `c`, `q`

### Custom Tabline
**Comfy buffer tabs** with:
- Workspace indicator (if in workspace)
- File icons and diagnostics
- Modified indicator
- Close button
- Custom sorting (directory, extension, etc.)

### Transparency
**Glassmorphic UI** with runtime toggle:
- **Command**: `:NvimTransparencyToggle` or `<leader>uT`
- **Effect**: Transparent background, floating windows
- **Persistence**: State saved across sessions

### Git Integration
**4-way Git workflow**:
1. **LazyGit** (`<leader>lg`): Terminal UI for full Git operations
2. **Neogit** (`<leader>gn`): Magit-like interface in Neovim
3. **Gitsigns** (`]h`, `[h`, `<leader>hs`): Inline hunk operations
4. **Diffview** (`<leader>gh`, `<leader>gd`): Visual diff and history

### Image Support
**Inline image preview** (Kitty terminal):
- **Plugin**: `3rd/image.nvim`
- **Support**: PNG, JPG, JPEG, GIF, WebP, AVIF
- **Preview**: Telescope, Oil, Neo-tree
- **Rendering**: Uses Kitty graphics protocol

---

## Statistics

| Metric | Value |
|--------|-------|
| **Startup time** | ~65ms (lazy-loaded) |
| **Plugins** | 110+ (60 primary + dependencies) |
| **Keybindings** | 250+ |
| **LSP servers** | 20+ configured, auto-installed |
| **Formatters** | 9 languages |
| **Supported languages** | 70+ (Treesitter) |
| **Lines of code** | 8,000+ |
| **Files** | 74 configuration files |
| **Themes** | 15+ colorschemes |

---

## Requirements

### Essential
- **Neovim** ≥ 0.10.0
- **Git** (for lazy.nvim and plugins)

### Recommended
- **fd** or **ripgrep** - Faster file search (Telescope)
- **bat** - Syntax highlighting in previews
- **lazygit** - Git UI
- **Node.js** ≥ 18 - LSP servers (TypeScript, Tailwind, etc.)
- **Python** ≥ 3.8 - LSP servers, provider
- **Nerd Font** - Icons (JetBrains Mono Nerd Font recommended)
- **Kitty terminal** - Image preview support

### Optional
- **Go** - Go LSP server
- **Rust** - Rust LSP server
- **Java** - Java LSP server
- **Ruby** - Ruby LSP server
- **PHP** - PHP LSP server
- **.NET SDK** - C# LSP server

---

*Last updated: 2025-10-22*
