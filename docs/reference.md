# Neovim Configuration Reference

## Table of Contents
- [Architecture](#architecture)
- [LSP Servers](#lsp-servers)
- [Formatters & Linters](#formatters--linters)
- [Plugin List](#plugin-list)
- [Features](#features)
- [Troubleshooting](#troubleshooting)

---

## Architecture

This configuration follows a modular organization pattern:

```
~/.config/nvim/
├── init.lua                 # Bootstrap and entry point
├── lua/
│   ├── core/               # Core settings
│   │   ├── options.lua     # Vim options (indent, ui, behavior)
│   │   ├── keymaps.lua     # Base keybindings (navigation, editing, windows)
│   │   ├── autocmds.lua    # Autocommands (formatting, ui, ux)
│   │   ├── lazy.lua        # Plugin manager setup
│   │   └── functional-keymaps.lua  # Functional mappings
│   │
│   ├── ui/                 # Visual components
│   │   ├── themes.lua      # Theme management
│   │   ├── lualine.lua     # Status bar
│   │   ├── noice.lua       # Notification UI
│   │   ├── snacks-dashboard.lua  # Dashboard
│   │   └── [other ui plugins]
│   │
│   ├── lsp/                # Language Server Protocol
│   │   ├── lspconfig-ultimate.lua  # Server configs (lua, ts, python, rust, go, etc)
│   │   ├── mason.lua       # LSP/tool installer
│   │   └── utils.lua       # LSP utilities
│   │
│   ├── navigation/         # Navigation & file browsing
│   │   ├── telescope-fixed.lua  # Fuzzy finder
│   │   ├── neo-tree-enhanced.lua
│   │   ├── oil.lua
│   │   └── [other nav plugins]
│   │
│   ├── editor/             # Editing enhancements
│   │   ├── treesitter-ultimate.lua  # Syntax highlighting
│   │   ├── autopairs.lua
│   │   ├── comment.lua
│   │   ├── formatting.lua
│   │   └── [other editor plugins]
│   │
│   ├── completion/         # Autocompletion
│   │   └── blink-enhanced.lua
│   │
│   ├── git/                # Git integration
│   │   ├── gitsigns.lua
│   │   ├── neogit.lua
│   │   └── diffview.lua
│   │
│   ├── debugging/          # Debugging (DAP)
│   │   ├── dap.lua
│   │   └── dap-ui.lua
│   │
│   └── utils/              # Utilities
│       ├── which-key.lua
│       ├── session.lua
│       ├── project.lua
│       └── [other utils]
│
├── ftplugin/              # Filetype-specific settings
│   ├── lua.lua
│   ├── python.lua
│   └── cpp.lua
│
├── colors/                # Custom colorschemes
│   └── lexitron.lua
│
└── snippets/              # Code snippets
    └── lua.lua
```

---

## LSP Servers

### Installed & Configured

| Language | Server | Status | Notes |
|----------|--------|--------|-------|
| Lua | lua_ls | ✅ | Full diagnostics, inlay hints |
| TypeScript | ts_ls | ✅ | Code completion, refactoring |
| JavaScript | ts_ls | ✅ | Same as TypeScript |
| Python | pyright | ✅ | Type checking (off by default, set to openFilesOnly) |
| Rust | rust_analyzer | ✅ | Full Clippy integration, cargo all-features |
| Go | gopls | ✅ | Gofumpt formatting, staticcheck |
| C/C++ | clangd | ✅ | With clang-tidy, header insertion |
| Java | jdtls | ✅ | Maven/Eclipse support |
| C# | omnisharp | ✅ | .NET support |
| CSS | cssls | ✅ | SCSS, CSS |
| HTML | html | ✅ | With Emmet support |
| Tailwind | tailwindcss | ✅ | HTML, CSS, JS, TS |
| JSON | jsonls | ✅ | With schema support |
| YAML | yamlls | ✅ | With schema support |
| Bash | bashls | ✅ | Shell scripting |

### Installation

Via `:Mason` or `:MasonInstall <server-name>`

All servers configured with:
- Enhanced capabilities (autocompletion, documentation)
- Minimal diagnostic noise (severity_sort, virtual_text disabled)
- Format-on-save support (via conform)

---

## Formatters & Linters

### Formatters

| Language | Formatter | Command |
|----------|-----------|---------|
| Lua | stylua | `stylua --search-parent-directories` |
| TypeScript | prettier | `prettier --parser typescript` |
| JavaScript | prettier | `prettier --parser babel` |
| Python | black | `black --line-length 88` |
| Rust | rustfmt | `cargo fmt` |
| Go | gofmt | Built-in |
| C/C++ | clang-format | Via clangd |
| JSON | prettier | `prettier --parser json` |
| YAML | prettier | `prettier --parser yaml` |

### Linters

| Language | Linter | Command |
|----------|--------|---------|
| TypeScript | eslint | `eslint --fix` |
| Python | pylint | `pylint` (diagnostic only) |
| Rust | clippy | Integrated with rust_analyzer |
| Bash | shellcheck | `shellcheck` |

---

## Plugin List

### Core (always loaded)

- **lazy.nvim** — Plugin manager
- **snacks.nvim** — Dashboard, notifications, utilities
- **nvim-lspconfig** — LSP client
- **mason.nvim** — Binary manager
- **telescope.nvim** — Fuzzy finder
- **nvim-treesitter** — Syntax highlighting
- **catppuccin** — Default colorscheme

### UI (lazy-loaded on VeryLazy)

- **lualine.nvim** — Status bar
- **alpha.nvim** — Dashboard (fallback)
- **nvim-notify** — Notification UI
- **noice.nvim** — Command/search UI enhancement
- **dressing.nvim** — Better vim.ui dialogs
- **nvim-web-devicons** — File icons
- **indent-blankline.nvim** — Indentation guides
- **rainbow-delimiters.nvim** — Bracket coloring
- **twilight.nvim** — Code focus
- **zen-mode.nvim** — Distraction-free writing
- **mini.nvim** (components) — Mini modules
- **image.nvim** — Image preview support

### Navigation (lazy-loaded)

- **nvim-telescope/telescope-fzf-native.nvim** — Fast fuzzy search
- **neo-tree.nvim** — File tree explorer
- **oil.nvim** — File browser
- **harpoon** — Quick file navigation
- **flash.nvim** — Fast motion
- **aerial.nvim** — Code outline

### Editing (lazy-loaded)

- **nvim-treesitter-context** — Show function context
- **nvim-ts-autotag** — HTML/XML tag closing
- **nvim-surround** — Surround text objects
- **Comment.nvim** — Comment toggling
- **nvim-autopairs** — Auto-closing pairs
- **dial.nvim** — Increment/decrement operators
- **Todo-comments.nvim** — TODO highlighting
- **spec tre.nvim** — Find and replace
- **refactoring.nvim** — Code refactoring
- **multicursors.nvim** — Multiple cursors

### Completion (lazy-loaded)

- **blink.cmp** — Fast completion engine
- **friendly-snippets** — Snippet library

### Git (lazy-loaded)

- **gitsigns.nvim** — Git modifications indicator
- **neogit** — Git UI
- **diffview.nvim** — Diff viewer
- **fugitive.vim** — Git commands

### LSP & Debugging (lazy-loaded)

- **trouble.nvim** — Diagnostic list
- **actions-preview.nvim** — Code action preview
- **nvim-dap** — Debugger
- **nvim-dap-ui** — DAP UI
- **neotest** — Test runner

### Utilities (lazy-loaded)

- **which-key.nvim** — Keymap helper
- **session.nvim** — Session management
- **project.nvim** — Project management
- **toggleterm.nvim** — Terminal toggles
- **overseer.nvim** — Task runner
- **yanky.nvim** — Enhanced yank history
- **copilot.lua** — GitHub Copilot

---

## Features

### Core Features
- **Smart navigation**: Ctrl+hjkl for window movement, Telescope for fuzzy finding
- **LSP**: 15+ servers, auto-attach, minimal diagnostics
- **Treesitter**: Syntax highlighting for 70+ languages
- **Git integration**: Gitsigns, Neogit, Diffview
- **Completions**: Blink.cmp with LSP + snippets
- **Terminal**: ToggleTerm with custom workflows

### Advanced Features
- **Multi-cursor editing**: nvim-surround, multicursors
- **Debugging**: DAP support with UI
- **Sessions**: Auto-save and restore
- **Image preview**: Terminal image support
- **Dashboard**: Skull theme with recent files (up to 25, correct numbering)

### Performance
- **Startup time**: ~400ms (lazy loading)
- **Memory**: ~60-80MB idle
- **Lazy loading**: All non-core plugins are event/command triggered

---

## Troubleshooting

### Dashboard shows recent files with wrong count (alphabet after 9)
- **Fixed**: File count now shows 1-25 correctly (no random letters)
- Uses: Format `%2d. %-60s` for clean numbering

### Dashboard content too close to top
- **Fixed**: Added top padding (14px) per rule
- Also added gap before heading

### Mouse interaction on dashboard should be disabled
- **Fixed**: Mouse disabled, only keyboard navigation works
- Edit, select, copy, paste keys disabled on dashboard
- Arrow keys, j/k, Enter still work

### LSP not attaching to file
1. Run `:LspInfo` to see active servers
2. Run `:MasonInstall <server>` if server missing
3. Check `:checkhealth` for issues
4. Verify file filetype: `:set filetype?`

### Telescope not finding files
1. Ensure you're in a project with files
2. Try `:Telescope find_files hidden=true` for hidden files
3. Check `fd` or `rg` is installed: `which fd` or `which rg`
4. Try `:Telescope live_grep` for searching text

### Formatting not working
1. Check formatter is installed: `:MasonInstall prettier` (example)
2. Verify filetype has formatter configured in lua/editor/formatting.lua
3. Try manual format: `:Format` (if mapping active)

### Performance issues
- Run `:Lazy profile` to identify slow plugins
- Use `:checkhealth` to diagnose
- Check large files: `:lua print(vim.fn.getfsize(vim.fn.expand('%')))`

### Colorscheme not applied
1. Try `:colorscheme catppuccin-mocha` (default)
2. Run `:Themery` to browse all available themes
3. Check `init.lua` for theme setup

