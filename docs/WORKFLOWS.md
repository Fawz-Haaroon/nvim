# Workflows & Keybindings

This document collects practical workflows, keybindings, and tips for everyday development in Lexitron.nvim.

## Text Selection & Indentation
- Columns/rectangles: Ctrl-v (visual block), move the cursor to expand selection
- Whole lines: V (visual line)
- Indent: Tab
- Outdent: Shift-Tab
- Classic: > and < also work (both reselect the region)

## Search & Replace
- Project search: <leader>fg (Telescope live_grep)
- Project replace: <leader>sr (Spectre)
- File-only replace: <leader>sf (Spectre)
- Replace in selection: visually select, then <leader>sr
- Built-in (file): :%s/old/new/gc
- Built-in (selection): :s/old/new/gc

## Navigation & Code Intelligence
- Go to definition: gd
- Go to references: gr
- Go to implementation: gi
- Go to type definition: gt
- Symbols outline: <leader>so (Aerial)
- Breadcrumbs: statusline via Navic
- File explorer: <leader>e (Neo-tree)
- Directory editor: <leader>o (Oil)
- Quick bookmarks: Harpoon — <leader>a add, <leader>h menu, Ctrl-1..4 jump, Ctrl-n/p next/prev

## Editing & Utilities
- Comments: gcc (line), gc in visual mode
- Clipboard history: <leader>cy (Yanky)
- Terminal: <leader>tt (ToggleTerm)
  - Exit terminal-mode: <c-\> then <c-n> or <Esc><Esc>
- Minimap: :MinimapToggle (codewindow)
- Tasks: Overseer — <leader>rr run, <leader>rt toggle list, <leader>ro open, <leader>rb build
- Diagnostics: ]d next / [d prev; Trouble: <leader>xx

## Formatting
- Conform picks the right formatter per language
- Manual: :Format (custom command) or <leader>cf (LSP when enabled)

## Theme & Visuals (Tokyo Night)
- Default colorscheme: tokyonight-storm (see ui/themes.lua)
- Aerial/Navic use Tokyo Night’s palette for bright, distinct symbol colors
- Switch flavors quickly:
  - :colorscheme tokyonight-night or :colorscheme tokyonight-storm
  - Themery: <leader>ut for curated themes

## Post‑install Checks
- :checkhealth — Python provider should point to ~/.config/nvim/.venv/bin/python
- :Mason — tools auto-install on first run
- :Lazy — plugins synced (auto-run headlessly by installer)
- Smoke test: <leader>so, breadcrumbs visible, :MinimapToggle, <leader>tt

## Troubleshooting
- PEP 668 (externally managed)
  - Handled: installer creates ~/.config/nvim/.venv and installs pynvim/pytest; init sets python3_host_prog
- pipx command not found
  - Ensure ~/.local/bin is on PATH; installer runs pipx ensurepath
- Old Node on Debian/Ubuntu
  - Installer sets up Node 20 via NodeSource when needed
- Harpoon ‘No write since last change’
  - Fixed: we auto-write modified buffers before Harpoon switches; hidden + confirm enabled
- Outline colors dim
  - With Tokyo Night active, Aerial/Navic pick bright palette; changing colorscheme re-applies highlights

## Tips
- Use visual block + Tab/Shift-Tab for fast column editing
- Spectre provides safe, previewed project-wide replacements
- Combine Harpoon with Telescope for rapid file-hopping

