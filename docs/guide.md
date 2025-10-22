# Keybinding Guide

## Quick Reference

**Leader key**: `<Space>`  
**Timeout**: 300ms  
**Format**: `<leader>X` means press Space then X

---

## General Keybindings

| Key | Action | Category |
|-----|--------|----------|
| `jj` | Exit insert mode | Navigation |
| `jk` | Exit insert mode | Navigation |
| `<C-e>` | Exit terminal mode | Terminal |
| `<Esc><Esc>` | Exit terminal mode | Terminal |
| `<leader>cs` | Clear search highlights | Search |
| `<Esc>` | Clear search highlights + exit | Search |

---

## Navigation (Cursor & Movement)

| Key | Action |
|-----|--------|
| `j` | Down (uses gj in wrapped lines) |
| `k` | Up (uses gk in wrapped lines) |
| `H` | Go to line start (non-blank) |
| `L` | Go to line end |
| `n` | Next search result (centered) |
| `N` | Previous search result (centered) |
| `<C-h>` | Go to left window |
| `<C-j>` | Go to lower window |
| `<C-k>` | Go to upper window |
| `<C-l>` | Go to right window |

---

## Buffer & Tab Navigation

| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<C-i>` | Next buffer (tab-aware) |
| `<C-S-i>` | Previous buffer |
| `gt` | Next tab |
| `gT` | Previous tab |
| `<C-PageDown>` | Next tab |
| `<C-PageUp>` | Previous tab |
| `<leader>1` through `<leader>9` | Jump to tab 1-9 |

---

## Window Management

| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Make windows equal size |
| `<leader>sx` | Close current window |
| `<C-Up>` | Increase window height |
| `<C-Down>` | Decrease window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

---

## Editing & Text Operations

### Indentation & Movement
| Key | Action |
|-----|--------|
| `=` | Increment number |
| `-` | Decrement number |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |
| `x` | Delete char (no register) |
| `<leader>d` | Delete (no register) |
| `p` (visual) | Paste (no register pollution) |
| `<` (visual) | Indent left + reselect |
| `>` (visual) | Indent right + reselect |
| `<Tab>` (visual) | Indent right |
| `<S-Tab>` (visual) | Indent left |

### Clipboard Operations
| Key | Action |
|-----|--------|
| `<leader>Y` | Copy line to system clipboard |
| `<leader>y` | Copy to system clipboard |
| `<leader>p` | Paste from system clipboard |

---

## File Explorer

| Key | Action |
|-----|--------|
| `<leader>o` | Open Oil (file browser) |
| `<leader>O` | Open Oil in float |
| `-` | Open parent directory |

---

## Tab Management

| Key | Action |
|-----|--------|
| `<leader>to` | Open new tab |
| `<leader>tx` | Close current tab |
| `<leader>tn` | Go to next tab |
| `<leader>tp` | Go to previous tab |
| `<leader>tf` | Open current buffer in new tab |

---

## Utility & File Operations

| Key | Action |
|-----|--------|
| `<C-s>` | Save file (normal/insert/visual) |
| `<leader>R` | Reload configuration |
| `<leader>L` | Open Lazy (plugin manager) |

---

## Diagnostics & LSP

| Key | Action |
|-----|--------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>q` | Diagnostic quickfix |

---

## Toggles (UI & Behavior)

| Key | Action |
|-----|--------|
| `<leader>tw` | Toggle word wrap |
| `<leader>tn` | Toggle line numbers |
| `<leader>tr` | Toggle relative numbers |
| `<leader>ts` | Toggle spell check |
| `<leader>uT` | Toggle UI transparency |

---

## Theme Switching

| Key | Action |
|-----|--------|
| `<leader>ut` | Open Themery (theme switcher) |
| `<leader>u1` | Catppuccin Mocha |
| `<leader>u2` | Tokyo Night |
| `<leader>u3` | Rose Pine |
| `<leader>u4` | Gruvbox |
| `<leader>u5` | Oxocarbon |
| `<leader>u6` | Kanagawa |
| `<leader>u7` | Synthwave84 |
| `<leader>u8` | Material |

---

## Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text) |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find word under cursor |
| `<leader>fe` | File browser |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | Document symbols |
| `<leader>fS` | Workspace symbols |
| `<leader>fR` | References |
| `<leader>fi` | Implementations |
| `<leader>ft` | Type definitions |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps |
| `<leader>fm` | Man pages |
| `<leader>fo` | Vim options |
| `<leader>fC` | Commands |
| `<leader>fH` | Command history |
| `<leader>/` | Search in buffer |
| `<leader>f/` | Search history |

### Telescope Navigation (inside picker)
| Key | Action |
|-----|--------|
| `<C-n>` / `<Down>` | Next item |
| `<C-p>` / `<Up>` | Previous item |
| `<CR>` | Select |
| `<C-x>` | Select horizontal split |
| `<C-v>` | Select vertical split |
| `<C-t>` | Select in new tab |
| `<Tab>` | Toggle selection |
| `<S-Tab>` | Toggle selection (reverse) |
| `<C-q>` | Send to quickfix |
| `<Esc>` / `q` | Close |

---

## Git

| Key | Action |
|-----|--------|
| `<leader>gb` | Git branches (Telescope) |
| `<leader>gc` | Git commits (Telescope) |
| `<leader>gs` | Git status (Telescope) |
| `<leader>gf` | Git files (Telescope) |
| (Gitsigns) | Blame, diff, stage hunks (contextual) |

---

## Dashboard & Sessions

| Key | Action |
|-----|--------|
| `<leader>db` | Open Dashboard |
| `<leader>0` | Open Dashboard |
| (Dashboard) | `f` = Find files |
| (Dashboard) | `g` = Live grep |
| (Dashboard) | `r` = Recent files |
| (Dashboard) | `n` = New file |
| (Dashboard) | `l` = Lazy |
| (Dashboard) | `m` = Mason |
| (Dashboard) | `i` = Mason Install |
| (Dashboard) | `u` = Update all |
| (Dashboard) | `c` = Configuration |
| (Dashboard) | `h` = Health check |
| (Dashboard) | `d` = Dashboard |
| (Dashboard) | `q` = Quit |

---

## Notifications

| Key | Action |
|-----|--------|
| `<leader>nh` | Notification history |
| `<leader>nc` | Clear notifications |

---

## Terminal

| Key | Action |
|-----|--------|
| `<leader>tt` | Toggle terminal |
| `<leader>ts` | Terminal (system info) |
| `<leader>t` + ... | Terminal commands (group) |

---

## Focus & UI

| Key | Action |
|-----|--------|
| `<leader>z` | Zen mode |
| `<leader>Z` | Zen zoom |

---

## Buffer Operations

| Key | Action |
|-----|--------|
| `<leader>b` + ... | Buffer group |
| `<leader>bd` | Delete buffer |
| `<leader>bo` | Delete other buffers |

---

## Code

| Key | Action |
|-----|--------|
| `<leader>c` + ... | Code group (LSP actions, diagnostics, etc) |

---

## Which-Key Groups

Press `<leader>` then wait 300ms to see sub-groups:

| Group | Purpose |
|-------|---------|
| `<leader>c` | **Code** (LSP actions) |
| `<leader>d` | **Dashboard** |
| `<leader>e` | **Explorer** (Neo-tree) |
| `<leader>f` | **File/Find** (Telescope) |
| `<leader>g` | **Git** |
| `<leader>i` | **Image** (image.nvim) |
| `<leader>n` | **Notifications** |
| `<leader>q` | **Quit/Session** |
| `<leader>s` | **Search/Sessions** |
| `<leader>t` | **Terminal** |
| `<leader>u` | **UI/Toggles** |
| `<leader>x` | **Diagnostics/Quickfix** |
| `<leader>b` | **Buffer** |

---

## Pro Tips

- **Zen mode**: `<leader>z` for distraction-free writing
- **Quick navigation**: `<leader>ff` → type filename → `<CR>` to open
- **Buffer switcher**: `<leader>fb` for buffer list
- **Multi-cursor**: Use `<C-space>` for incremental selection (Treesitter)
- **Jump history**: `<leader>jo` (back) / `<leader>ji` (forward)
- **Terminal toggle**: Quick access to shell without leaving Vim
- **Transparent UI**: `<leader>uT` to toggle transparency
- **Session save**: `:SessionList` to see saved sessions

---

## Missing Mappings?

Run `:Telescope keymaps` to search all loaded keybindings, or `:WhichKey` to see entire keymap tree.

