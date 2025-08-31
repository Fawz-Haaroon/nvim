# Lexitron’s Neovim Cheatsheet (Quick Reference)

Leader: <Space>

Core
- Save: <C-s> (all modes)
- Exit insert: jj / jk
- Clear search: <leader>cs (or <Esc>)
- Move lines: Alt-j / Alt-k
- Increment/Decrement: = / - (or Dial: <C-a> / <C-x>)

Navigation
- Buffers: <S-h>/<S-l> prev/next; <C-i> next; <C-S-i> prev
- Windows: <C-h/j/k/l>; splits <leader>sv / <leader>sh; equalize <leader>se
- Tabs: gt/gT; <leader>to (new), <leader>tx (close), <leader>tn/<leader>tp
- Neo-tree: <leader>e toggle, <leader>ge Git status (float)
- Oil: - parent; <leader>fo open; <leader>fO float
- Telescope: <leader>ff files, <leader>fg grep, <leader>fb buffers, <leader>fr recent,
  <leader>fh help, <leader>fk keymaps, <leader>fC commands
- Harpoon: <leader>a add, <leader>h menu, <C-1>.. <C-4> select, <C-n>/<C-p> cycle
- Flash: s jump, S treesitter

LSP
- gd/gD/gI/gy/gr: def/decl/impl/type/refs
- K hover; gK or i<C-k> signature help
- <leader>ca actions; <leader>cr rename; <leader>cc run codelens
- Diagnostics: [d / ]d; <leader>cd float; <leader>xx Trouble
- Format: <leader>cf (or :Format via Conform)

Git
- Gitsigns: ]h/[h next/prev hunk; <leader>hs/hr stage/reset hunk;
  <leader>hS stage buffer; <leader>hu undo stage; <leader>hp preview;
  <leader>hb blame; <leader>hd diff; ih text object
- Neogit: :Neogit; Diffview: :DiffviewOpen

Editing
- Surround: ys/yss/yS/ySS; ds; cs; visual S/gS
- Comment: gcc, gc (motion/visual), gbc
- Multicursor: prefix <Space>m; see plugin docs
- Replace (Spectre): <leader>sr project, <leader>sf file
- Todo: ]t/[t next/prev; <leader>st list

UI
- Themes: <leader>ut (switcher), quick: <leader>u1..u8
- Transparency: <leader>uT
- Notifications: <leader>un dismiss
- Images (Kitty): <leader>ti toggle, <leader>ic clear, <leader>ir refresh

Managers
- Plugins: <leader>L, <leader>Lu update, <leader>Ls sync, <leader>Lc clean
- LSP tools: <leader>cm (Mason)

Docs
- :Docs → open README in a new tab

