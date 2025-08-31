# 🎯 LEXITRON'S NEOVIM - Complete Keyboard Shortcuts Guide

> **📖 Your Ultimate Reference Guide to Every Shortcut**

## 🚀 ESSENTIAL OPERATIONS

### 💾 File Operations
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-s>` | Normal/Insert/Visual | Save current file |
| `<leader>q` | Normal | Quit current buffer |
| `:w` | Command | Write file |
| `:wa` | Command | Write all files |
| `:q` | Command | Quit buffer |
| `:qa` | Command | Quit all |
| `:x` | Command | Save and quit |

### 🔙 Undo & Redo
| Shortcut | Mode | Description |
|----------|------|-------------|
| `u` | Normal | Undo last change |
| `<C-r>` | Normal | Redo last undone change |
| `U` | Normal | Undo all changes in current line |
| `.` | Normal | Repeat last command |

### 📋 Copy, Cut & Paste
| Shortcut | Mode | Description |
|----------|------|-------------|
| `y` | Normal/Visual | Copy (yank) selection/motion |
| `yy` | Normal | Copy current line |
| `Y` | Normal | Copy from cursor to end of line |
| `<leader>y` | Normal/Visual | Copy to system clipboard |
| `<leader>Y` | Normal | Copy line to system clipboard |
| `p` | Normal | Paste after cursor |
| `P` | Normal | Paste before cursor |
| `<leader>p` | Normal/Visual | Paste from system clipboard |
| `d` | Normal/Visual | Cut (delete) selection/motion |
| `dd` | Normal | Cut current line |
| `D` | Normal | Cut from cursor to end of line |
| `<leader>d` | Normal/Visual | Delete without affecting register |
| `c` | Normal/Visual | Change (cut and enter insert mode) |
| `cc` | Normal | Change entire line |
| `C` | Normal | Change from cursor to end of line |

### 🎯 Text Selection
| Shortcut | Mode | Description |
|----------|------|-------------|
| `v` | Normal | Enter visual mode (character-wise) |
| `V` | Normal | Enter visual line mode |
| `<C-v>` | Normal | Enter visual block mode |
| `gv` | Normal | Re-select last visual selection |
| `aw` | Visual | Select a word (including whitespace) |
| `iw` | Visual | Select inner word |
| `as` | Visual | Select a sentence |
| `is` | Visual | Select inner sentence |
| `ap` | Visual | Select a paragraph |
| `ip` | Visual | Select inner paragraph |
| `a"` | Visual | Select including quotes |
| `i"` | Visual | Select inside quotes |
| `a(` `a)` `ab` | Visual | Select including parentheses |
| `i(` `i)` `ib` | Visual | Select inside parentheses |
| `a[` `a]` | Visual | Select including brackets |
| `i[` `i]` | Visual | Select inside brackets |
| `a{` `a}` `aB` | Visual | Select including braces |
| `i{` `i}` `iB` | Visual | Select inside braces |
| `at` | Visual | Select including XML/HTML tag |
| `it` | Visual | Select inside XML/HTML tag |

## 🧭 NAVIGATION & MOVEMENT

### ⬅️➡️ Basic Movement
| Shortcut | Mode | Description |
|----------|------|-------------|
| `h` | Normal | Move left |
| `j` | Normal | Move down (or down visual line) |
| `k` | Normal | Move up (or up visual line) |
| `l` | Normal | Move right |
| `w` | Normal | Move to beginning of next word |
| `b` | Normal | Move to beginning of previous word |
| `e` | Normal | Move to end of current word |
| `ge` | Normal | Move to end of previous word |
| `0` | Normal | Move to beginning of line |
| `^` | Normal | Move to first non-blank character |
| `$` | Normal | Move to end of line |
| `H` | Normal | Move to first non-blank character (custom) |
| `L` | Normal | Move to end of line (custom) |

### ⬆️⬇️ Advanced Movement
| Shortcut | Mode | Description |
|----------|------|-------------|
| `gg` | Normal | Go to first line |
| `G` | Normal | Go to last line |
| `{` | Normal | Move to previous paragraph |
| `}` | Normal | Move to next paragraph |
| `(` | Normal | Move to previous sentence |
| `)` | Normal | Move to next sentence |
| `%` | Normal | Jump to matching bracket/parenthesis |
| `*` | Normal | Find next occurrence of word under cursor |
| `#` | Normal | Find previous occurrence of word under cursor |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |

### 🚀 Super-Fast Movement
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<A-j>` | Normal/Insert | Move current line down |
| `<A-k>` | Normal/Insert | Move current line up |
| `<A-j>` | Visual | Move selection down |
| `<A-k>` | Visual | Move selection up |

## 🪟 WINDOW & TAB MANAGEMENT

### 🔲 Window Operations
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to lower window |
| `<C-k>` | Normal | Move to upper window |
| `<C-l>` | Normal | Move to right window |
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make windows equal size |
| `<leader>sx` | Normal | Close current window |
| `<C-Up>` | Normal | Increase window height |
| `<C-Down>` | Normal | Decrease window height |
| `<C-Left>` | Normal | Decrease window width |
| `<C-Right>` | Normal | Increase window width |

### 📑 Tab Management
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>to` | Normal | Open new tab |
| `<leader>tx` | Normal | Close current tab |
| `<leader>tn` | Normal | Go to next tab |
| `<leader>tp` | Normal | Go to previous tab |
| `<leader>tf` | Normal | Open current buffer in new tab |

### 🗂️ Buffer Management
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<S-h>` | Normal | Previous buffer |
| `<S-l>` | Normal | Next buffer |
| `<C-i>` | Normal | Next buffer (tabline) |
| `<C-S-i>` | Normal | Previous buffer (tabline; terminal support varies) |
| `[b` | Normal | Previous buffer |
| `]b` | Normal | Next buffer |
| `<leader>bd` | Normal | Delete buffer |
| `<leader>bD` | Normal | Delete all but current |
| `<leader>bl` | Normal | Delete buffers to left |
| `<leader>br` | Normal | Delete buffers to right |
| `<leader>bp` | Normal | Pick buffer |
| `<leader>bo` | Normal | Delete other buffers |
| `<leader>1-9` | Normal | Go to buffer 1-9 |
| `<leader>0` | Normal | Go to home dashboard |

## 🔧 EDITING OPERATIONS

### 🧮 Formatting
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>cf` | Normal | Format buffer (Conform.nvim) |
| `:Format` | Command | Format buffer (async) |

### ✂️ Advanced Editing
| Shortcut | Mode | Description |
|----------|------|-------------|
| `x` | Normal/Visual | Delete character (no register) |
| `=` | Normal/Visual | Increment number |
| `-` | Normal/Visual | Decrement number |
| `<` | Visual | Indent left and reselect |
| `>` | Visual | Indent right and reselect |
| `J` | Normal | Join lines |
| `gJ` | Normal | Join lines without space |
| `r` | Normal | Replace character |
| `R` | Normal | Enter replace mode |
| `s` | Normal | Substitute character |
| `S` | Normal | Substitute line |

### 🔤 Case Operations
| Shortcut | Mode | Description |
|----------|------|-------------|
| `~` | Normal | Toggle case of character |
| `gu` | Normal | Make lowercase (with motion) |
| `gU` | Normal | Make uppercase (with motion) |
| `guu` | Normal | Make current line lowercase |
| `gUU` | Normal | Make current line uppercase |

## 🔍 SEARCH & REPLACE

### 🔎 Search Operations
| Shortcut | Mode | Description |
|----------|------|-------------|
| `/` | Normal | Search forward |
| `?` | Normal | Search backward |
| `n` | Normal | Next search result |
| `N` | Normal | Previous search result |
| `*` | Normal | Search word under cursor forward |
| `#` | Normal | Search word under cursor backward |
| `<leader>cs` | Normal | Clear search highlights |
| `<Esc>` | Normal | Clear search highlights |

### 🔄 Replace Operations
| Shortcut | Command Mode | Description |
|----------|-------------|-------------|
| `:s/old/new/` | Command | Replace first occurrence in line |
| `:s/old/new/g` | Command | Replace all occurrences in line |
| `:%s/old/new/g` | Command | Replace all occurrences in file |
| `:%s/old/new/gc` | Command | Replace with confirmation |
| `:'<,'>s/old/new/g` | Command | Replace in visual selection |

## 🚀 PLUGIN-SPECIFIC SHORTCUTS

### 🧑‍🤝‍🧑 Visual‑Multi (Multi‑cursor)
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-n>` | Normal | Add word under cursor; repeat for next matches |
| `<Space>ma` | Normal/Visual | Select all occurrences |
| `<Space>mr` | Normal | Regex select matches |
| `<Space>ms` | Normal/Visual | Skip current selection |
| `<Space>md` | Normal/Visual | Remove current selection |
| `<Esc>` | Normal/Visual | Exit multi‑cursor mode |

### 🔍 Telescope (Fuzzy Finder)
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep |
| `<leader>fb` | Normal | Find buffers |
| `<leader>fr` | Normal | Recent files |
| `<leader>fh` | Normal | Help tags |
| `<leader>fc` | Normal | Find commands |
| `<leader>fk` | Normal | Find keymaps |

### 🌳 Neo-tree (File Explorer)
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>e` | Normal | Toggle file explorer |
| `<leader>ge` | Normal | Git status (float) |

### 🎯 Flash (Quick Navigation)
| Shortcut | Mode | Description |
|----------|------|-------------|
| `s` | Normal | Flash search |
| `S` | Normal | Flash treesitter |

### 🔧 LSP (Language Server)
| Shortcut | Mode | Description |
|----------|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Go to references |
| `gi` | Normal | Go to implementation |
| `gt` | Normal | Go to type definition |
| `K` | Normal | Show hover documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |
| `<leader>e` | Normal | Show diagnostics |
| `<leader>q` | Normal | Diagnostic quickfix |

### 🌳 Git Integration
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>gs` | Normal | Git status |
| `<leader>gc` | Normal | Git commit |
| `<leader>gp` | Normal | Git push |
| `<leader>gl` | Normal | Git log |
| `<leader>gb` | Normal | Git blame |
| `<leader>gd` | Normal | Git diff |

## 🎮 SPECIAL MODES & FEATURES

### 🎬 Terminal Mode
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-e>` | Terminal | Exit terminal mode |
| `<Esc><Esc>` | Terminal | Exit terminal mode |

### 📝 Insert Mode Shortcuts
| Shortcut | Mode | Description |
|----------|------|-------------|
| `jj` | Insert | Exit to normal mode |
| `jk` | Insert | Exit to normal mode |
| `<C-s>` | Insert | Save file |

### 🎯 Command Mode
| Shortcut | Mode | Description |
|----------|------|-------------|
| `:` | Normal | Enter command mode |
| `q:` | Normal | Command history window |
| `/` | Normal | Search mode |
| `<C-p>` | Command | Previous command (disabled) |
| `<C-n>` | Command | Next command (disabled) |

## ⚙️ CONFIGURATION & SYSTEM

### 🔧 Configuration
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>R` | Normal | Reload configuration |
| `<leader>L` | Normal | Open Lazy plugin manager |
| `<leader>Lu` | Normal | Update plugins |
| `<leader>Ls` | Normal | Sync plugins |
| `<leader>Lc` | Normal | Clean plugins |

### 🔄 Toggle Options
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>tw` | Normal | Toggle word wrap |
| `<leader>tn` | Normal | Toggle line numbers |
| `<leader>tr` | Normal | Toggle relative numbers |
| `<leader>ts` | Normal | Toggle spell check |

### 🪟 Workspace Management
| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>ww` | Normal | Return to last workspace |
| `<leader>0` | Normal | Go to home dashboard |

## 🎨 ALPHA DASHBOARD SHORTCUTS

### 🏠 Dashboard Navigation
| Key | Description |
|-----|-------------|
| `f` | Find Files |
| `r` | Recent Files |
| `p` | Projects |
| `c` | Configuration |
| `s` | Sessions |
| `u` | Update Plugins |
| `w` | Return to Workspace |
| `h` | Help |
| `q` | Quit |

---

## 📝 NOTES

### 🎯 Leader Key
- **Leader key is `<Space>`** (spacebar)
- All `<leader>` combinations start with spacebar

### 💡 Pro Tips
1. **Visual Mode Selection**: Select text first, then apply operations
2. **Motions**: Most commands work with motions (e.g., `d2w` deletes 2 words)
3. **Registers**: Use `"<register>` before commands to use specific registers
4. **Macros**: `q<register>` to record, `@<register>` to replay
5. **Marks**: `m<letter>` to set mark, `'<letter>` to jump to mark

### 🚀 Efficiency Tips
- Use `.` to repeat last command
- Use visual mode for complex selections
- Learn text objects (aw, iw, ap, ip, etc.)
- Master the motion commands (w, b, e, f, t)
- Use search and replace for bulk edits

---

**🌟 Remember: Practice makes perfect! Start with the essentials and gradually learn more shortcuts.**
