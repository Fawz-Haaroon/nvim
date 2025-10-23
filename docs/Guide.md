# Lexitron.nvim — Keybindings Guide

> **Complete reference for all keybindings** • Organized by functionality • `<leader>` = `<Space>`

## Table of Contents

- [Essential Mappings](#essential-mappings)
- [Navigation](#navigation)
- [Editing](#editing)
- [LSP & Code](#lsp--code)
- [Git Operations](#git-operations)
- [Debugging](#debugging)
- [Search & Replace](#search--replace)
- [UI Toggles](#ui-toggles)
- [Sessions & Workspaces](#sessions--workspaces)
- [Windows & Splits](#windows--splits)
- [Buffers & Tabs](#buffers--tabs)
- [Plugin Management](#plugin-management)
- [Filetype Specific](#filetype-specific)

---

## Essential Mappings

| Keys | Mode | Description |
|------|------|-------------|
| `jj` or `jk` | i | Exit insert mode |
| `<C-s>` | n, i, v | Save file |
| `<Esc>` | n | Clear search highlights |
| `<C-e>` or `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>R` | n | Reload configuration |
| `<leader><leader>` | n | Switch to last buffer |

---

## Navigation

### File Finding (Telescope)

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep (search in files) |
| `<leader>fb` | n | Find buffers |
| `<leader>fr` | n | Recent files (oldfiles) |
| `<leader>fc` | n | Find word under cursor |
| `<leader>fe` | n | File browser |
| `<leader>fk` | n | Find keymaps |
| `<leader>fh` | n | Help tags |
| `<leader>fm` | n | Man pages |
| `<leader>fC` | n | Commands |
| `<leader>fH` | n | Command history |
| `<leader>fo` | n | Vim options |
| `<leader>f/` | n | Search history |
| `<leader>/` | n | Search in current buffer |

### LSP-Specific Finding

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>fs` | n | Document symbols |
| `<leader>fS` | n | Workspace symbols |
| `<leader>fd` | n | Diagnostics |
| `<leader>fR` | n | LSP references |
| `<leader>fi` | n | LSP implementations |
| `<leader>ft` | n | LSP type definitions |

### Quick File Navigation

| Keys | Mode | Description |
|------|------|-------------|
| `-` | n | Open parent directory (Oil) |
| `<leader>o` | n | Open Oil file browser |
| `<leader>O` | n | Open Oil (floating) |
| `<leader>e` | n | Toggle file explorer (Snacks) |
| `<leader>E` | n | File explorer at CWD |
| `<leader>so` | n | Symbols outline (Aerial) |

### Harpoon (Quick Marks)

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>a` | n | Add file to Harpoon |
| `<leader>h` | n | Toggle Harpoon menu |
| `<leader>1` | n | Jump to Harpoon file 1 |
| `<leader>2` | n | Jump to Harpoon file 2 |
| `<leader>3` | n | Jump to Harpoon file 3 |
| `<leader>4` | n | Jump to Harpoon file 4 |
| `<C-n>` | n | Next Harpoon file |
| `<C-p>` | n | Previous Harpoon file |

### Flash (Jump Navigation)

| Keys | Mode | Description |
|------|------|-------------|
| `s` | n, x, o | Flash jump |
| `S` | n, x, o | Flash treesitter |
| `r` | o | Remote flash |
| `R` | o, x | Treesitter search |

### Window Navigation

| Keys | Mode | Description |
|------|------|-------------|
| `<C-h>` | n | Go to left window |
| `<C-j>` | n | Go to lower window |
| `<C-k>` | n | Go to upper window |
| `<C-l>` | n | Go to right window |

### Line Navigation

| Keys | Mode | Description |
|------|------|-------------|
| `j` / `k` | n, x | Move down/up (visual lines) |
| `H` | n, x | Go to first non-blank character |
| `L` | n, x | Go to end of line |
| `n` | n | Next search result (centered) |
| `N` | n | Previous search result (centered) |

### Jump List

| Keys | Mode | Description |
|------|------|-------------|
| `<C-o>` | n | Jump backward |
| `<C-\\>` | n | Jump forward |
| `<leader>jo` | n | Jump backward (alternative) |
| `<leader>ji` | n | Jump forward (alternative) |

---

## Editing

### Text Manipulation

| Keys | Mode | Description |
|------|------|-------------|
| `<A-j>` | n, i, x | Move line/selection down |
| `<A-k>` | n, i, x | Move line/selection up |
| `<Tab>` | x | Indent selection |
| `<S-Tab>` | x | Outdent selection |
| `<` | x | Indent left (reselect) |
| `>` | x | Indent right (reselect) |

### Copy/Paste/Delete

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>y` | n, x | Copy to system clipboard |
| `<leader>Y` | n | Copy line to system clipboard |
| `<leader>p` | n, x | Paste from system clipboard |
| `<leader>d` | n, x | Delete without polluting register |
| `x` | n, x | Delete char (no register) |
| `p` | x | Paste (no register pollution) |

### Increment/Decrement

| Keys | Mode | Description |
|------|------|-------------|
| `=` | n, x | Increment number |
| `-` | x | Decrement number (visual only) |

### Comments

| Keys | Mode | Description |
|------|------|-------------|
| `gcc` | n | Toggle comment line |
| `gc` | n, x, o | Toggle comment motion/selection |
| `gbc` | n | Toggle comment block |
| `gb` | n, x, o | Toggle block comment motion |

### Surround

| Keys | Mode | Description |
|------|------|-------------|
| `ys{motion}{char}` | n | Add surround |
| `cs{old}{new}` | n | Change surround |
| `ds{char}` | n | Delete surround |
| `S{char}` | x | Surround selection |

### Multi-cursor

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>mc` | n | Add cursor at nearest match |
| `<leader>mc` | v | Add cursor at every match |
| `<leader>mC` | n | Add cursor at end of match |

### Refactoring

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>re` | x | Extract function |
| `<leader>rf` | x | Extract function to file |
| `<leader>rv` | x | Extract variable |
| `<leader>ri` | n, x | Inline variable |
| `<leader>rI` | n | Inline function |
| `<leader>rb` | n | Extract block |
| `<leader>rbf` | n | Extract block to file |

### Todo Comments

| Keys | Mode | Description |
|------|------|-------------|
| `]t` | n | Next todo comment |
| `[t` | n | Previous todo comment |
| `<leader>st` | n | Search todos (Telescope) |

---

## LSP & Code

### Go To

| Keys | Mode | Description |
|------|------|-------------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `gr` | n | Go to references |

### Documentation & Info

| Keys | Mode | Description |
|------|------|-------------|
| `K` | n | Hover documentation |
| `gK` | n | Signature help |
| `<C-k>` | i | Signature help (insert mode) |

### Code Actions

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>ca` | n, v | Code action |
| `<leader>cr` | n | Rename symbol |
| `<leader>cf` | n, v | Format document/selection |
| `<leader>cc` | n | Run codelens |
| `<leader>cC` | n | Refresh codelens |
| `<leader>ch` | n | Toggle inlay hints |

### Diagnostics

| Keys | Mode | Description |
|------|------|-------------|
| `]d` | n | Next diagnostic |
| `[d` | n | Previous diagnostic |
| `<leader>cd` | n | Show line diagnostics |
| `<leader>xe` | n | Show diagnostics (float) |
| `<leader>xx` | n | Diagnostics (Trouble) |
| `<leader>xX` | n | Buffer diagnostics (Trouble) |
| `<leader>xl` | n | Location list (Trouble) |
| `<leader>xq` | n | Quickfix list (Trouble) |

### LSP Info & Management

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>cl` | n | LSP info |
| `<leader>cR` | n | Restart LSP |
| `<leader>lt` | n | Toggle LSP servers |
| `<leader>lp` | n | Toggle Python LSP only |

### Workspace Folders

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>wa` | n | Add workspace folder |
| `<leader>wr` | n | Remove workspace folder |
| `<leader>wl` | n | List workspace folders |

---

## Git Operations

### LazyGit & Neogit

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>lg` or `<leader>gg` | n | Open LazyGit |
| `<leader>gn` | n | Open Neogit |
| `<leader>gs` | n | Git status (Neogit split) |
| `<leader>gc` | n | Git commit |
| `<leader>gp` | n | Git push |
| `<leader>gP` | n | Git pull |

### Telescope Git

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>gb` | n | Git branches |
| `<leader>gf` | n | Git files |
| `<leader>gC` | n | Git commits |
| `<leader>gB` | n | Buffer commits |

### Diffview

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>gh` | n | Git file history |
| `<leader>gd` | n | Git diff |
| `<leader>gx` | n | Close git diff |

### Gitsigns (Hunks)

| Keys | Mode | Description |
|------|------|-------------|
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |
| `<leader>hs` | n, v | Stage hunk |
| `<leader>hr` | n, v | Reset hunk |
| `<leader>hS` | n | Stage buffer |
| `<leader>hR` | n | Reset buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hd` | n | Diff this |
| `<leader>hD` | n | Diff this ~ |
| `<leader>tb` | n | Toggle line blame |
| `<leader>td` | n | Toggle deleted |
| `ih` | o, x | Select hunk (text object) |

---

## Debugging

### DAP Controls

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>db` | n | Toggle breakpoint |
| `<leader>dc` | n | Continue |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step over |
| `<leader>dO` | n | Step out |
| `<leader>dr` | n | Toggle REPL |
| `<leader>ds` | n | Debug session |
| `<leader>dt` | n | Terminate |
| `<leader>du` | n | Toggle debug UI |
| `<leader>de` | n | Eval expression |

---

## Search & Replace

### Spectre (Find & Replace)

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>sr` | n | Replace in project |
| `<leader>sr` | v | Replace selection |
| `<leader>sf` | n | Replace in file |

### Clear Search

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>cs` | n | Clear search highlights |
| `<Esc>` | n | Clear search highlights |

---

## UI Toggles

### Theme & Appearance

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>ut` | n | Theme switcher (Themery) |
| `<leader>u1` | n | Catppuccin Mocha |
| `<leader>u2` | n | Tokyo Night |
| `<leader>u3` | n | Rose Pine |
| `<leader>u4` | n | Gruvbox |
| `<leader>u5` | n | Oxocarbon |
| `<leader>u6` | n | Kanagawa |
| `<leader>u7` | n | Synthwave84 |
| `<leader>u8` | n | Material |
| `<leader>uT` | n | Toggle transparency |

### Editor Options

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>tw` or `<leader>uw` | n | Toggle word wrap |
| `<leader>tl` or `<leader>un` | n | Toggle line numbers |
| `<leader>tr` or `<leader>ur` | n | Toggle relative numbers |
| `<leader>ts` or `<leader>us` | n | Toggle spell check |
| `<leader>uc` | n | Toggle colorizer |
| `<leader>um` | n | Toggle minimap |
| `<leader>uz` | n | Zen mode |

---

## Sessions & Workspaces

### Sessions

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>ss` | n | Save session |
| `<leader>sl` | n | List/search sessions |
| `<leader>sd` | n | Delete session |
| `<leader>sS` | n | Save snapshot |
| `<leader>sR` | n | Restore snapshot |
| `<leader>sD` | n | Delete snapshot |

### Workspaces

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>wn` | n | New workspace |
| `<leader>ws` | n | Save workspace |
| `<leader>wl` | n | List workspaces |
| `<leader>wo` | n | Open workspace |
| `<leader>wd` | n | Delete workspace |
| `<leader>wr` | n | Rename workspace |
| `<leader>wS` | n | List sessions in workspace |

---

## Windows & Splits

### Window Management

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>sv` | n | Split vertically |
| `<leader>sh` | n | Split horizontally |
| `<leader>se` | n | Make windows equal size |
| `<leader>sx` | n | Close current window |
| `<leader>w` | n | Window command prefix |

### Window Resizing

| Keys | Mode | Description |
|------|------|-------------|
| `<C-Up>` | n | Increase window height |
| `<C-Down>` | n | Decrease window height |
| `<C-Left>` | n | Decrease window width |
| `<C-Right>` | n | Increase window width |

---

## Buffers & Tabs

### Buffer Navigation

| Keys | Mode | Description |
|------|------|-------------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `[b` | n | Previous buffer |
| `]b` | n | Next buffer |
| `<C-i>` | n | Next buffer (tabline) |

### Buffer Management

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>bd` | n | Delete buffer |
| `<leader>bD` | n | Delete all but current |
| `<leader>bl` | n | Delete buffers to left |
| `<leader>br` | n | Delete buffers to right |
| `<leader>bp` | n | Pick buffer |
| `<leader>bo` | n | Delete other buffers |

### Tab Management

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>to` | n | Open new tab |
| `<leader>tx` | n | Close current tab |
| `<leader>tn` or `<leader>tN` | n | Next tab |
| `<leader>tp` | n | Previous tab |
| `<leader>tf` | n | Open buffer in new tab |
| `gt` | n | Next tab |
| `gT` | n | Previous tab |
| `<C-PageDown>` | n | Next tab |
| `<C-PageUp>` | n | Previous tab |
| `<leader>5-9` | n | Jump to tab 5-9 |

---

## Plugin Management

### Lazy.nvim

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>L` | n | Open Lazy |
| `<leader>Lu` | n | Update plugins |
| `<leader>Ls` | n | Sync plugins |
| `<leader>Lc` | n | Clean plugins |
| `<leader>Lp` | n | Profile plugins |

### Mason

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>M` or `<leader>cm` | n | Open Mason |

---

## Filetype Specific

### C++ (Competitive Programming)

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>cc` | n | Compile & run C++ |
| `<leader>cd` | n | Debug with GDB |
| `<leader>ct` | n | Insert CP template |

### Python

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>pr` | n | Run Python file |
| `<leader>pi` | n | Run Python interactive |
| `<leader>pt` | n | Run pytest |
| `<leader>pE` | n | Enable Python LSP/diagnostics |
| `<leader>pD` | n | Disable Python LSP/diagnostics |

### Lua

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>lr` | n | Run Lua file |
| `<leader>ll` | n | Source Lua file |

---

## Copilot (AI Assistance)

### Normal Mode

| Keys | Mode | Description |
|------|------|-------------|
| `<leader>cp` | n | Copilot panel |
| `<leader>ct` | n | Toggle Copilot on/off |
| `<leader>cs` | n | Copilot status |
| `gx` | n | Open URL under cursor |

### Insert Mode

| Keys | Mode | Description |
|------|------|-------------|
| `<M-l>` (Alt+l) | i | Accept suggestion |
| `<M-]>` (Alt+]) | i | Next suggestion |
| `<M-[>` (Alt+[) | i | Previous suggestion |
| `<C-]>` | i | Dismiss suggestion |

---

## Disabled Keys

These keys are intentionally disabled:

| Keys | Mode | Description |
|------|------|-------------|
| `Q` | n | Ex mode (disabled) |
| `<C-p>` | c | Command history prev (disabled) |
| `<C-n>` | c | Command history next (disabled) |

---

## Completion (Blink.cmp)

### Insert Mode

| Keys | Mode | Description |
|------|------|-------------|
| `<Tab>` | i | Next completion / snippet forward |
| `<S-Tab>` | i | Previous completion / snippet backward |
| `<Up>` / `<Down>` | i | Navigate completions |
| `<C-Space>` | i | Show completion / documentation |
| `<C-e>` | i | Hide completion |
| `<C-y>` | i | Accept completion |
| `<Enter>` | i | Accept completion |
| `<C-p>` / `<C-n>` | i | Navigate completions |
| `<C-b>` / `<C-f>` | i | Scroll documentation |
| `<C-j>` / `<C-k>` | i | Snippet forward/backward |

---

## Commands Reference

| Command | Description |
|---------|-------------|
| `:Docs` | Open this guide |
| `:Lazy` | Plugin manager |
| `:Mason` | LSP/tool installer |
| `:LspInfo` | LSP server info |
| `:LspRestart` | Restart LSP servers |
| `:Telescope` | Telescope pickers |
| `:Oil` | File browser |
| `:LazyGit` | Git UI |
| `:Neogit` | Git UI (alternative) |
| `:Trouble` | Diagnostics UI |
| `:Format` | Format current file |
| `:WorkspaceNew` | Create new workspace |
| `:WorkspaceList` | List workspaces |
| `:SessionList` | List sessions |
| `:Copilot auth` | Authenticate Copilot |
| `:CopilotToggle` | Toggle Copilot |
| `:MinimapToggle` | Toggle minimap |
| `:ZenMode` | Toggle zen mode |
| `:ColorizerToggle` | Toggle color highlighting |
| `:Themery` | Theme switcher |

---

## Mode Abbreviations

- `n` = Normal mode
- `i` = Insert mode
- `v` = Visual mode
- `x` = Visual mode (specific)
- `o` = Operator-pending mode
- `t` = Terminal mode
- `c` = Command-line mode

---

## Tips

1. **Discover keybindings**: Press `<leader>fk` to search all keymaps
2. **Which-key**: Wait after `<leader>` to see available keys
3. **Help**: Press `<leader>fh` to search Neovim help
4. **Commands**: Press `<leader>fC` to search available commands
5. **Learn incrementally**: Start with navigation and editing, add more as needed

---

*Last updated: 2025-10-22*
