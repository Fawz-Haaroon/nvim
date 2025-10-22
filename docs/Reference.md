# Lexitron.nvim — Reference (Deep Spec)

Everything: architecture, file inventory with headers, commands, plugins, autocmds, and full keymap listings.

## File Inventory (with headers)
- lua/completion/blink-enhanced.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  ⚡ BLINK ENHANCED - VS Code-like Completion Experience
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/autocmds.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔄 AUTOCMDS - Revolutionary User Experience
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/functional-keymaps.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🎯 FUNCTIONAL KEYMAPS - Actually Working Keybindings!
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/init.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🌟 CORE MODULE - The Perfect Neovim Configuration
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/keymaps.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  ⌨️ CORE KEYMAPS - Professional Workflow
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/lazy.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📦 LAZY.NVIM - Ultimate Plugin Manager Bootstrap
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/core/options.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  ⚙️ CORE OPTIONS - Ultimate IDE Settings
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/debugging/dap-ui.lua
- lua/debugging/dap.lua
- lua/debugging/neotest.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧪 NEOTEST - Run tests inside Neovim with beautiful UI
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/editor/autopairs.lua
- lua/editor/comment.lua
- lua/editor/dial.lua
- lua/editor/formatting.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧼 Conform.nvim - Format-on-save with zero bloat
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/editor/multicursor.lua
- lua/editor/refactoring.lua
- lua/editor/spectre.lua
- lua/editor/surround.lua
- lua/editor/todo-comments.lua
- lua/editor/treesitter-ultimate.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🌳 ULTIMATE TREESITTER - Complete Syntax Highlighting
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/git/diffview.lua
- lua/git/gitsigns.lua
- lua/git/neogit.lua
- lua/lsp/actions-preview.lua
- lua/lsp/init.lua
  - LSP plugins loader
  - Skips utils.lua which is a utility module, not a plugin spec
- lua/lsp/lspconfig-ultimate.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🚀 ULTIMATE LSP CONFIG - Complete Language Support
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/lsp/mason.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔧 MASON CONFIG - LSP Server Management
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/lsp/trouble.lua
- lua/lsp/utils.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔧 LSP UTILITIES - Advanced LSP Controls
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/navigation/aerial.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧭 AERIAL - Symbols outline sidebar
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/navigation/flash.lua
- lua/navigation/harpoon.lua
- lua/navigation/neo-tree-enhanced.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🌳 NEO-TREE - Enhanced UI with curved aesthetics
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/navigation/oil.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🛢️  OIL NEXUS - Ultra-Modern Directory Editor
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/navigation/telescope-fixed.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔭 TELESCOPE FIXED - Complete with Image Preview & All Features
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/alpha.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🌸 REVOLUTIONARY ALPHA DASHBOARD - Anime Aesthetic Paradise 
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/breadcrumbs.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🍞 BREADCRUMBS - nvim-navic integration
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/cmdline-enhanced.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🎯 ENHANCED COMMAND-LINE - Ultimate completion with dropdown menus
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/colorizer.lua
- lua/ui/comfy-tabline.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🗂️  COMFYLINE-INSPIRED BUFFERLINE - Custom Tabline for Neovim
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/devicons.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔣 DEVICONS ULTRA - Vivid, larger, and expressive icons
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/dressing.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  👔 DRESSING - Beautiful UI Select & Input
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/folds.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📁 UFO FOLDS - Better folding UI
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/highlights.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🎨 NEXUS HIGHLIGHTS - Ultra-Modern Curved UI Cohesive Theme
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/image.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🖼️ IMAGE.NVIM - Ultimate Image Viewing for Kitty Terminal
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/indent-blankline.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📏 INDENT BLANKLINE - Beautiful Indentation Guides
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/lualine.lua
  - ═══════════════════════════════════════════════════════════════════════════
  -  ✨ TOKYONIGHT LUALINE - Arrow separators, breadcrumbs, progress & location
  - ═══════════════════════════════════════════════════════════════════════════
- lua/ui/markdown-preview.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📝 MARKDOWN-PREVIEW.NVIM - Live Markdown Preview (no yarn/npm required)
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/minimap.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🗺️ MINIMAP - Code overview
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/noice.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🔮 NOICE - Revolutionary UI Experience
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/notify.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📢 NVIM-NOTIFY - Beautiful Notifications
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/rainbow-delimiters.lua
- lua/ui/themes-enhanced.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🎨 ENHANCED THEMES - Vibrant, Glowing & Aesthetic Collection
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/themes.lua
  - ═══════════════════════════════════════════════════════════════════════════
  -  🎆 ULTIMATE THEME COLLECTION - Epic Colorschemes & Theme Switcher
  - ═══════════════════════════════════════════════════════════════════════════
- lua/ui/tokyo-enhanced.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🌙 TOKYO NIGHT ENHANCED - Vibrant Storm with Soothing Lualine Colors
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/transparency.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🪟 TRANSPARENCY TOGGLE - Glassmorphic Neovim (runtime toggle)
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/ui/workspace-tracker.lua
  - ═══════════════════════════════════════════════════════════════════════════
  -  🧭 WORKSPACE TRACKER - small helper for bufferline/tabline components
  - ═══════════════════════════════════════════════════════════════════════════
- lua/ui/zen-mode.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧘 ZEN MODE - Distraction-free editing
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/utils/copilot.lua
- lua/utils/cp.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🏆 CP UTILITIES - Competitive Programming Setup
  - ═══════════════════════════════════════════════════════════════════════════════
  - Module aliases
- lua/utils/init.lua
  - Utils plugins loader
  - Only loads plugin specs, skips utility modules
- lua/utils/overseer.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🏃 OVERSEER - Task runner (builds, tests, commands)
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/utils/project.lua
- lua/utils/python-venv.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🐍 PYTHON VENV - Auto-detect and switch Python virtual environments
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/utils/session.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧭 PRO-LEVEL SESSIONS (tmux/zellij-like)
  -  Uses rmagatti/auto-session + session-lens (Telescope UI)
  -  Features:
  -    - Auto-save/restore per-project and per-git-branch sessions
  -    - Named sessions, search/list/preview with Telescope
  -    - Robust layout restore (tabs, splits, buffers, cwd)
  -    - Pre/post hooks to close/reopen UI panes (neo-tree, trouble, diffview)
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/utils/toggleterm.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🧪 TOGGLETEAM (toggleterm) - Integrated terminal
  - ═══════════════════════════════════════════════════════════════════════════════
- lua/utils/which-key.lua
- lua/utils/workspaces.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  🗂️ WORKSPACES - Named, multi-session workspace manager (tmux/zellij style)
  - ═══════════════════════════════════════════════════════════════════════════════
  - 
  - Concepts
  - - Workspace: a named container holding one or more sessions (tab/layout states).
  - - Session: a saved state (mksession) inside a workspace (default name: "main").
  - - Storage: ~/.local/share/nvim/workspaces/<name>/{workspace.json,sessions/*.vim}
  - 
  - Commands (see keymaps in functional-keymaps.lua):
  -   :WorkspaceNew [name]
  -   :WorkspaceSave [name] [session]
  -   :WorkspaceOpen [name] [session]
  -   :WorkspaceList
  -   :WorkspaceDelete [name]
  -   :WorkspaceRename [old] [new]
  -   :WorkspaceSessions [name]    -> list sessions for a workspace
  - 
  - Notes
  - - Integrates with auto-session pre-save hooks by closing UI panes before save.
  - - Quiet by default (uses echo for critical output).
- lua/utils/yanky.lua
  - ═══════════════════════════════════════════════════════════════════════════════
  -  📋 YANKY - Clipboard history and smarter yanks
  - ═══════════════════════════════════════════════════════════════════════════════

## Plugin Inventory (by domain)
### completion
- saghen/blink.cmp
### debugging
- mfussenegger/nvim-dap
- nvim-neotest/neotest
- rcarriga/nvim-dap-ui
### editor
- ThePrimeagen/refactoring.nvim
- folke/todo-comments.nvim
- kylechui/nvim-surround
- mg979/vim-visual-multi
- monaqa/dial.nvim
- numToStr/Comment.nvim
- nvim-pack/nvim-spectre
- nvim-treesitter/nvim-treesitter
- stevearc/conform.nvim
- windwp/nvim-autopairs
### git
- NeogitOrg/neogit
- lewis6991/gitsigns.nvim
- sindrets/diffview.nvim
### lsp
- aznhe21/actions-preview.nvim
- folke/trouble.nvim
- mason-org/mason.nvim
- neovim/nvim-lspconfig
### navigation
- ThePrimeagen/harpoon
- folke/flash.nvim
- nvim-neo-tree/neo-tree.nvim
- nvim-telescope/telescope.nvim
- stevearc/aerial.nvim
- stevearc/oil.nvim
### ui
- 3rd/image.nvim
- HiPhish/rainbow-delimiters.nvim
- NvChad/nvim-colorizer.lua
- SmiteshP/nvim-navic
- folke/noice.nvim
- folke/tokyonight.nvim
- folke/zen-mode.nvim
- goolord/alpha-nvim
- gorbit99/codewindow.nvim
- iamcco/markdown-preview.nvim
- kevinhwang91/nvim-ufo
- lukas-reineke/indent-blankline.nvim
- nvim-lualine/lualine.nvim
- nvim-tree/nvim-web-devicons
- rcarriga/nvim-notify
- stevearc/dressing.nvim
### utils
- ahmedkhalf/project.nvim
- akinsho/toggleterm.nvim
- folke/which-key.nvim
- gbprod/yanky.nvim
- rmagatti/auto-session
- stevearc/overseer.nvim
- zbirenbaum/copilot.lua

## Autocommands (events by domain)
### completion
- ColorScheme
### core
- BufRead,BufNewFile,BufEnter
### debugging
- ColorScheme
### lsp
- LspAttach
- CursorHold,CursorHoldI
- CursorMoved,CursorMovedI
- BufEnter,CursorHold,InsertLeave
### navigation
- ColorScheme
- ColorScheme
### ui
- ColorScheme
- User,NotifyBackground
- ColorScheme
- BufEnter,FileType
- WinEnter,TabEnter,BufEnter,BufAdd,BufDelete,BufWritePost,VimResized
- DiagnosticChanged
- ColorScheme,TransparencyReapply
- BufReadPre
- FileType,image
- TabEnter,WinEnter,BufEnter
- ColorScheme
- User,AlphaReady
### utils
- DirChanged,VimEnter,PythonVenvDetection
- FocusGained,BufEnter

## Domains
- completion
- core
- debugging
- editor
- git
- lsp
- navigation
- ui
- utils

## Commands by Domain
### core
| Command | Description | Source |
|---|---|---|
| Docs | Open Neovim config guide (docs/Guide.md) | lua/core/init.lua |

### editor
| Command | Description | Source |
|---|---|---|
| Format |  | lua/editor/formatting.lua |

### ui
| Command | Description | Source |
|---|---|---|
| BufferLineOrderByDirectory |  | lua/ui/comfy-tabline.lua |
| BufferLineOrderByExtension |  | lua/ui/comfy-tabline.lua |
| BufferLineOrderByRelativeDirectory |  | lua/ui/comfy-tabline.lua |
| NvimTransparencyToggle | Toggle Neovim UI transparency | lua/ui/transparency.lua |
| MinimapToggle | Toggle minimap | lua/ui/minimap.lua |
| MinimapOpen |  | lua/ui/minimap.lua |
| MinimapClose |  | lua/ui/minimap.lua |

### utils
| Command | Description | Source |
|---|---|---|
| WorkspaceNew |  | lua/utils/workspaces.lua |
| WorkspaceSave |  | lua/utils/workspaces.lua |
| WorkspaceOpen |  | lua/utils/workspaces.lua |
| WorkspaceList |  | lua/utils/workspaces.lua |
| WorkspaceDelete |  | lua/utils/workspaces.lua |
| WorkspaceRename |  | lua/utils/workspaces.lua |
| WorkspaceSessions |  | lua/utils/workspaces.lua |
| PythonDetect |  | lua/utils/python-venv.lua |
| PythonSetup | Setup Python provider for current project | lua/utils/python-venv.lua |
| SessionList | Search sessions | lua/utils/session.lua |
| SessionSnapshotSave |  | lua/utils/session.lua |
| SessionSnapshotList |  | lua/utils/session.lua |
| SessionSnapshotDelete |  | lua/utils/session.lua |

## Keymaps by Domain
### core
| Keys | Mode | Description | Action |
|---|---|---|---|
| <leader>ff | n | Find Files | <cmd>Telescope find_files<cr> |
| <leader>fg | n | Live Grep | <cmd>Telescope live_grep<cr> |
| <leader>fb | n | Find Buffers | <cmd>Telescope buffers<cr> |
| <leader>fh | n | Help Tags | <cmd>Telescope help_tags<cr> |
| <leader>fr | n | Recent Files | <cmd>Telescope oldfiles<cr> |
| <leader>fc | n | Find Word | <cmd>Telescope grep_string<cr> |
| <leader>fm | n | Find Marks | <cmd>Telescope marks<cr> |
| <leader>fM | n | Man Pages | <cmd>Telescope man_pages<cr> |
| <leader>fk | n | Find Keymaps | <cmd>Telescope keymaps<cr> |
| <leader>fC | n | Commands | <cmd>Telescope commands<cr> |
| n | n |  | <leader>a |
| n | n |  | <leader>h |
| n | n |  | <leader>1 |
| n | n |  | <leader>2 |
| n | n |  | <leader>3 |
| n | n |  | <leader>4 |
| <leader>a | n | Harpoon File | <cmd>echo 'Harpoon not available'<cr> |
| <leader>h | n | Harpoon Menu | <cmd>echo 'Harpoon not available'<cr> |
| <leader>e | n | 🌳 Toggle Neo-tree | <cmd>Neotree toggle<cr> |
| <leader>ge | n | 🔀 Git Status Tree | <cmd>Neotree float git_status<cr> |
| <leader>wn | n |  | <cmd>WorkspaceNew<cr> |
| n | n |  | <leader>ws |
| <leader>wl | n | Workspace: List/Open | <cmd>WorkspaceList<cr> |
| <leader>wo | n | Workspace: Open by name | <cmd>WorkspaceOpen<cr> |
| <leader>wd | n | Workspace: Delete | <cmd>WorkspaceDelete<cr> |
| <leader>wr | n | Workspace: Rename | <cmd>WorkspaceRename<cr> |
| <leader>wS | n | Workspace: Sessions in current | <cmd>WorkspaceSessions<cr> |
| <leader>o | n | 📁 Open Oil | <cmd>Oil<cr> |
| <leader>ss | n | Save Session | <cmd>SaveSession<cr> |
| <leader>sl | n | List/Search Sessions | <cmd>SessionList<cr> |
| <leader>sd | n | Delete Session | <cmd>DeleteSession<cr> |
| <leader>sS | n | Save Snapshot | <cmd>SessionSnapshotSave<cr> |
| <leader>sR | n | Restore Snapshot | <cmd>SessionSnapshotList<cr> |
| <leader>sD | n | Delete Snapshot | <cmd>SessionSnapshotDelete<cr> |
| <leader>qq | n | Quit All | <cmd>qa<cr> |
| <leader>ca | n | Code Action | Code Action |
| <leader>cd | n | Diagnostics | <cmd>Telescope diagnostics<cr> |
| <leader>cr | n | Rename | Rename |
| <leader>cf | n | Format | Format |
| <leader>cs | n | Document Symbols | <cmd>Telescope lsp_document_symbols<cr> |
| <leader>cS | n | Workspace Symbols | <cmd>Telescope lsp_workspace_symbols<cr> |
| gd | n | Go to Definition | Go to Definition |
| gD | n | Go to Declaration | Go to Declaration |
| gi | n | Go to Implementation | Go to Implementation |
| gt | n | Go to Type Definition | Go to Type Definition |
| gr | n | Go to References | Go to References |
| K | n | Hover Documentation | Hover Documentation |
| <leader>gg | n | Neogit | <cmd>Neogit<cr> |
| <leader>gs | n | Git Status | <cmd>Neogit kind=split<cr> |
| <leader>gc | n | Git Commit | <cmd>Neogit commit<cr> |
| <leader>gp | n | Git Push | <cmd>Neogit push<cr> |
| <leader>gP | n | Git Pull | <cmd>Neogit pull<cr> |
| <leader>gb | n | Git Branches | <cmd>Telescope git_branches<cr> |
| <leader>gf | n | Git Files | <cmd>Telescope git_files<cr> |
| <leader>gh | n | Git History | <cmd>DiffviewFileHistory<cr> |
| <leader>gd | n | Git Diff | <cmd>DiffviewOpen<cr> |
| <leader>gx | n | Close Git Diff | <cmd>DiffviewClose<cr> |
| ]h | n | Next Hunk | <cmd>Gitsigns next_hunk<cr> |
| [h | n | Prev Hunk | <cmd>Gitsigns prev_hunk<cr> |
| <leader>ghs | n | Stage Hunk | <cmd>Gitsigns stage_hunk<cr> |
| <leader>ghu | n | Undo Stage Hunk | <cmd>Gitsigns undo_stage_hunk<cr> |
| <leader>ghr | n | Reset Hunk | <cmd>Gitsigns reset_hunk<cr> |
| <leader>ghp | n | Preview Hunk | <cmd>Gitsigns preview_hunk<cr> |
| <leader>ghb | n | Blame Line | <cmd>Gitsigns blame_line<cr> |
| <leader>rr | n | Run Task | <cmd>OverseerRun<cr> |
| <leader>rt | n | Toggle Tasks | <cmd>OverseerToggle<cr> |
| <leader>ro | n | Open Tasks | <cmd>OverseerOpen<cr> |
| <leader>rc | n | Close Tasks | <cmd>OverseerClose<cr> |
| <leader>rb | n | Build Project | <cmd>OverseerBuild<cr> |
| <leader>db | n | Toggle Breakpoint | Toggle Breakpoint |
| <leader>dc | n | Continue | Continue |
| <leader>di | n | Step Into | Step Into |
| <leader>do | n | Step Over | Step Over |
| <leader>dO | n | Step Out | Step Out |
| <leader>dr | n | Toggle REPL | Toggle REPL |
| <leader>ds | n | Session | Session |
| <leader>dt | n | Terminate | Terminate |
| <leader>du | n | Toggle Debug UI | Toggle Debug UI |
| <leader>de | n | Eval | Eval |
| <leader>xx | n |  | <cmd>Trouble diagnostics toggle<cr> |
| <leader>xX | n |  | <cmd>Trouble diagnostics toggle filter.buf=0<cr> |
| <leader>xl | n |  | <cmd>Trouble loclist toggle<cr> |
| <leader>xq | n |  | <cmd>Trouble qflist toggle<cr> |
| ]d | n | Next Diagnostic | Next Diagnostic |
| [d | n | Prev Diagnostic | Prev Diagnostic |
| <leader>xe | n | Show Diagnostics | Show Diagnostics |
| <leader>uz | n | Zen Mode | <cmd>ZenMode<cr> |
| <leader>um | n | Toggle Minimap | <cmd>MinimapToggle<cr> |
| <leader>uw | n | Toggle Word Wrap | <cmd>set wrap!<cr> |
| <leader>un | n | Toggle Line Numbers | <cmd>set number!<cr> |
| <leader>ur | n | Toggle Relative Numbers | <cmd>set relativenumber!<cr> |
| <leader>us | n | Toggle Spell Check | <cmd>set spell!<cr> |
| <leader>uc | n | Toggle Colorizer | <cmd>ColorizerToggle<cr> |
| <leader>bd | n | Delete Buffer | <cmd>bdelete<cr> |
| <leader>bD | n | Delete All But Current | <cmd>%bdelete|edit#|normal `\ |
| <leader>bl | n | Delete Buffers to Left | <cmd>BufferLineCloseLeft<cr> |
| <leader>br | n | Delete Buffers to Right | <cmd>BufferLineCloseRight<cr> |
| <leader>bp | n | Pick Buffer | <cmd>BufferLinePick<cr> |
| <leader>bo | n | Delete Other Buffers | <cmd>BufferLineCloseOthers<cr> |
| <S-h> | n | Previous Buffer | <cmd>BufferLineCyclePrev<cr> |
| <S-l> | n | Next Buffer | <cmd>BufferLineCycleNext<cr> |
| [b | n | Previous Buffer | <cmd>BufferLineCyclePrev<cr> |
| ]b | n | Next Buffer | <cmd>BufferLineCycleNext<cr> |
| <leader>sr | n | Replace in Project | <cmd>Spectre<cr> |
| <leader>sf | n | Replace in File | <cmd>Spectre open_file_search<cr> |
| <leader>sr | v | Replace Selection | <cmd>Spectre open_visual<cr> |
| <leader>L | n | Lazy | <cmd>Lazy<cr> |
| <leader>M | n | Mason | <cmd>Mason<cr> |
| ]t | n | Next Todo | <cmd>TodoNext<cr> |
| [t | n | Previous Todo | <cmd>TodoPrev<cr> |
| <leader>st | n | Todo | <cmd>TodoTelescope<cr> |
| x | n | Flash | o |
| x | n | Flash Treesitter | o |
| r | o | Remote Flash | Remote Flash |
| o | x | Treesitter Search | R |
| <c-s> | c | Toggle Flash Search | Toggle Flash Search |
| <leader>mc | n | Multi-cursor at Match | Multi-cursor at Match |
| <leader>mc | v | Multi-cursor at Every Match | Multi-cursor at Every Match |
| <leader>mC | n | Multi-cursor at End | Multi-cursor at End |
| <leader>re | x |  | Extract Function |
| <leader>rf | x |  | Extract Function To File |
| <leader>rv | x |  | Extract Variable |
| <leader>rI | n |  | Inline Function |
| x | n |  | <leader>ri |
| <leader>rb | n |  | Extract Block |
| <leader>rbf | n |  | Extract Block To File |
| <leader>R | n | Reload Config | <cmd>source $MYVIMRC<cr> |
| <leader><leader> | n | Switch to Last Buffer | <C-^> |
| jj | i | Exit insert mode | <ESC> |
| jk | i | Exit insert mode | <ESC> |
| <C-e> | t | Exit terminal mode | <C-\\><C-n> |
| <Esc><Esc> | t | Exit terminal mode | <C-\\><C-n> |
| <leader>cs | n | Clear search highlights | <cmd>nohlsearch<CR> |
| <Esc> | n |  | <cmd>nohlsearch<CR> |
| x | n | Increment number | = |
| x | n | Decrement number | - |
| x | n |  | x |
| x | n |  | <leader>d |
| p | x |  | _dP', { desc =  |
| < | x | Indent left and reselect | <gv |
| > | x | Indent right and reselect | >gv |
| <Tab> | x |  | >gv |
| <S-Tab> | x |  | <gv |
| <A-j> | n | Move line down | <cmd>m .+1<CR>== |
| <A-k> | n | Move line up | <cmd>m .-2<CR>== |
| <A-j> | i | Move line down | <Esc><cmd>m .+1<CR>==gi |
| <A-k> | i | Move line up | <Esc><cmd>m .-2<CR>==gi |
| <A-j> | x | Move selection down | :m '>+1<CR>gv=gv |
| <A-k> | x | Move selection up | :m '<-2<CR>gv=gv |
| <leader>Y | n | Copy line to system clipboard | +Y', { desc =  |
| x | n | Copy to system clipboard | <leader>y |
| x | n | Paste from system clipboard | <leader>p |
| x | n |  | j |
| x | n |  | k |
| x | n | Go to first non-blank | H |
| x | n | Go to end of line | L |
| n | n |  | nzzzv |
| N | n |  | Nzzzv |
| <S-h> | n | Previous buffer | <cmd>bprevious<cr> |
| <S-l> | n | Next buffer | <cmd>bnext<cr> |
| <C-i> | n |  | <cmd>bnext<cr> |
| <C-S-i> | n |  | <cmd>bprevious<cr> |
| <C-h> | n | Go to left window | <C-w>h |
| <C-j> | n | Go to lower window | <C-w>j |
| <C-k> | n | Go to upper window | <C-w>k |
| <C-l> | n | Go to right window | <C-w>l |
| <leader>sv | n | Split window vertically | <C-w>v |
| <leader>sh | n | Split window horizontally | <C-w>s |
| <leader>se | n | Make windows equal size | <C-w>= |
| <leader>sx | n | Close current window | <C-w>c |
| <C-Up> | n | Increase window height | <cmd>resize +2<cr> |
| <C-Down> | n | Decrease window height | <cmd>resize -2<cr> |
| <C-Left> | n | Decrease window width | <cmd>vertical resize -2<cr> |
| <C-Right> | n | Increase window width | <cmd>vertical resize +2<cr> |
| <leader>to | n | Open new tab | <cmd>tabnew<cr> |
| <leader>tx | n | Close current tab | <cmd>tabclose<cr> |
| <leader>tn | n | Go to next tab | <cmd>tabn<cr> |
| <leader>tp | n | Go to previous tab | <cmd>tabp<cr> |
| <leader>tf | n | Open current buffer in new tab | <cmd>tabnew %<cr> |
| gt | n | Next tab | <cmd>tabnext<cr> |
| gT | n | Previous tab | <cmd>tabprevious<cr> |
| <C-PageDown> | n | Next tab | <cmd>tabnext<cr> |
| <C-PageUp> | n | Previous tab | <cmd>tabprevious<cr> |
| <leader> | n | Go to tab  | gt |
| <C-\\> | n | Jump forward in jumplist | <C-i> |
| <leader>ji | n | Jump forward in jumplist | <C-i> |
| <leader>jo | n | Jump backward in jumplist | <C-o> |
| <leader>R | n | Reload config | <cmd>source $MYVIMRC<cr> |
| <C-s> | n | Save file | <cmd>w<cr> |
| <C-s> | i |  | <Esc><cmd>w<cr>a |
| <C-s> | v |  | <Esc><cmd>w<cr> |
| <leader>L | n | Open Lazy | <cmd>Lazy<cr> |
| <leader>tw | n | Toggle word wrap | <cmd>set wrap!<cr> |
| <leader>tn | n | Toggle line numbers | <cmd>set number!<cr> |
| <leader>tr | n | Toggle relative numbers | <cmd>set relativenumber!<cr> |
| <leader>ts | n | Toggle spell check | <cmd>set spell!<cr> |
| <leader>ut | n | 🎆 Switch themes | <cmd>Themery<cr> |
| n | n |  | <leader>u1 |
| n | n |  | <leader>u2 |
| n | n |  | <leader>u3 |
| n | n |  | <leader>u4 |
| n | n |  | <leader>u5 |
| n | n |  | <leader>u6 |
| n | n |  | <leader>u7 |
| n | n |  | <leader>u8 |
| n | n |  | <leader>uT |
| n | n |  | [d |
| n | n |  | ]d |
| n | n |  | <leader>q |
| n | n |  | <leader>cp |
| n | n |  | <leader>cc |
| n | n |  | <leader>sp |
| Q | n |  | <nop> |
| q | n |  | <nop> |
| <C-p> | c |  | <nop> |
| <C-n> | c |  | <nop> |
| <leader>w | n | Window commands | <C-w> |
| <leader><leader> | n | Switch to last buffer | <C-^> |
| <leader>L | n | 🚀 Open Lazy.nvim | <cmd>Lazy<cr> |
| <leader>Lu | n | 🔄 Update plugins | <cmd>Lazy update<cr> |
| <leader>Ls | n | 🔄 Sync plugins | <cmd>Lazy sync<cr> |
| <leader>Lc | n | 🧹 Clean plugins | <cmd>Lazy clean<cr> |
| <leader>Lp | n | 📊 Profile plugins | <cmd>Lazy profile<cr> |
| q | n | Close window | <cmd>close<cr> |
| n | n |  | <leader>cc |
| n | n |  | <leader>cr |
| q | n | Quit buffer | <cmd>close<cr> |

### editor
| Keys | Mode | Description | Action |
|---|---|---|---|
| n | n |  | <C-a> |
| n | n |  | <C-x> |
| v | n |  | <C-a> |
| v | n |  | <C-x> |
| v | n |  | g<C-a> |
| v | n |  | g<C-x> |
| v | n |  | <leader>cf |
| ]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
    { "<leader>st |  | Todo (Telescope) | <cmd>TodoTelescope<cr> |
| <leader>sr |  | Replace in Project | <cmd>Spectre<cr> |
| <leader>sf |  | Replace in File | <cmd>Spectre open_file_search<cr> |
| <leader>sr |  |  | <esc><cmd>Spectre open_visual<cr> |
| gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n |  |  | o |
| gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n |  |  | o |

### git
| Keys | Mode | Description | Action |
|---|---|---|---|
| n | n |  | ]h |
| n | n |  | [h |
| <leader>hs | n | Stage hunk | Stage hunk |
| <leader>hr | n | Reset hunk | Reset hunk |
| v | n |  | <leader>hs |
| v | n |  | <leader>hr |
| <leader>hS | n | Stage buffer | Stage buffer |
| <leader>hu | n | Undo stage hunk | Undo stage hunk |
| <leader>hR | n | Reset buffer | Reset buffer |
| <leader>hp | n | Preview hunk | Preview hunk |
| n | n |  | <leader>hb |
| <leader>tb | n | Toggle line blame | Toggle line blame |
| <leader>hd | n | Diff this | Diff this |
| n | n |  | <leader>hD |
| <leader>td | n | Toggle deleted | Toggle deleted |
| x | o | Select hunk | ih |

### lsp
| Keys | Mode | Description | Action |
|---|---|---|---|
| <leader>lt | n | Toggle LSP servers | Toggle LSP servers |
| <leader>lp | n | Toggle Python LSP only | Toggle Python LSP only |
| gd | n |  | Go to Definition |
| gr | n |  | Go to References |
| gI | n |  | Go to Implementation |
| gy | n |  | Go to Type Definition |
| gD | n |  | Go to Declaration |
| K | n |  | Hover Documentation |
| gK | n |  | Signature Help |
| <C-k> | i |  | Signature Help |
| v | n |  | <leader>ca |
| <leader>cc | n |  | Run Codelens |
| <leader>cC | n |  | Refresh Codelens |
| <leader>cr | n |  | Rename |
| <leader>cd | n |  | Line Diagnostics |
| <leader>cl | n |  | <cmd>LspInfo<cr> |
| <leader>cR | n |  | <cmd>LspRestart<cr> |
| ]d | n |  | Next Diagnostic |
| [d | n |  | Prev Diagnostic |
| <leader>wa | n |  | Add Workspace Folder |
| <leader>wr | n |  | Remove Workspace Folder |
| n | n |  | <leader>wl |
| n | n |  | <leader>cf |
| v | n |  | <leader>cf |
| n | n |  | <leader>ch |
| <leader>cm |  | Mason | <cmd>Mason<cr> |
| <leader>xx |  | Diagnostics (Trouble) | <cmd>Trouble diagnostics toggle<cr> |
| <leader>xX |  | Buffer Diagnostics (Trouble) | <cmd>Trouble diagnostics toggle filter.buf=0<cr> |
| <leader>xl |  | Location List (Trouble) | <cmd>Trouble loclist toggle<cr> |
| <leader>xq |  | Quickfix List (Trouble) | <cmd>Trouble qflist toggle<cr> |

### navigation
| Keys | Mode | Description | Action |
|---|---|---|---|
| s", mode = { "n |  |  | x |
| S", mode = { "n |  |  | x |
| r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o |  |  | x |
| <leader>ff |  | 🔍 Find Files | <cmd>Telescope find_files<cr> |
| <leader>fg |  | 🔎 Live Grep | <cmd>Telescope live_grep<cr> |
| <leader>fb |  | 📂 Buffers | <cmd>Telescope buffers<cr> |
| <leader>fr |  | 🕒 Recent Files | <cmd>Telescope oldfiles<cr> |
| <leader>fc |  | 🔤 Find String | <cmd>Telescope grep_string<cr> |
| <leader>fe |  | 📁 File Browser | <cmd>Telescope file_browser<cr> |
| <leader>fd |  | 🩺 Diagnostics | <cmd>Telescope diagnostics<cr> |
| <leader>fs |  | 📊 Document Symbols | <cmd>Telescope lsp_document_symbols<cr> |
| <leader>fS |  | 🏢 Workspace Symbols | <cmd>Telescope lsp_workspace_symbols<cr> |
| <leader>fR |  | 🔗 References | <cmd>Telescope lsp_references<cr> |
| <leader>fi |  | ⚙️ Implementations | <cmd>Telescope lsp_implementations<cr> |
| <leader>ft |  | 📝 Type Definitions | <cmd>Telescope lsp_type_definitions<cr> |
| <leader>fh |  | ❓ Help Tags | <cmd>Telescope help_tags<cr> |
| <leader>fk |  | ⌨️ Keymaps | <cmd>Telescope keymaps<cr> |
| <leader>fm |  | 📖 Man Pages | <cmd>Telescope man_pages<cr> |
| <leader>fo |  | ⚙️ Vim Options | <cmd>Telescope vim_options<cr> |
| <leader>fC |  | 💻 Commands | <cmd>Telescope commands<cr> |
| <leader>fH |  | 📜 Command History | <cmd>Telescope command_history<cr> |
| <leader>gb |  | 🌿 Git Branches | <cmd>Telescope git_branches<cr> |
| <leader>gc |  | 📝 Git Commits | <cmd>Telescope git_commits<cr> |
| <leader>gs |  | 📊 Git Status | <cmd>Telescope git_status<cr> |
| <leader>gf |  | 📂 Git Files | <cmd>Telescope git_files<cr> |
| <leader>/ |  | 🔍 Search in Buffer | <cmd>Telescope current_buffer_fuzzy_find<cr> |
| <leader>f/ |  | 🔍 Search History | <cmd>Telescope search_history<cr> |
| - |  | Open parent directory | <CMD>Oil<CR> |
| <leader>so |  | Symbols Outline (Aerial) | <cmd>AerialToggle!<cr> |
| <leader>ge |  | 🔀 Git Status | <cmd>Neotree float git_status<cr> |

### ui
| Keys | Mode | Description | Action |
|---|---|---|---|
| n | n |  | <leader>ti |
| n | n |  | <leader>ic |
| n | n |  | <leader>ir |
| <leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h> |  | Previous Buffer | <Cmd>bprevious<CR> |
| <S-l> |  | Next Buffer | <Cmd>bnext<CR> |
| [b |  | Previous Buffer | <Cmd>bprevious<CR> |
| ]b |  | Next Buffer | <Cmd>bnext<CR> |

### utils
| Keys | Mode | Description | Action |
|---|---|---|---|
| <leader>rr |  | Run task | <cmd>OverseerRun<cr> |
| <leader>rt |  | Toggle tasks | <cmd>OverseerToggle<cr> |
| <leader>ro |  | Open tasks | <cmd>OverseerOpen<cr> |
| <leader>cy |  | Clipboard history | <cmd>Telescope yank_history<cr> |

## Keymap Prefix Index
### -
- [1] (navigation) `-` — Open parent directory
### <
- [1] (core) `<` — Indent left and reselect
### <A-j>
- [1] (core) `<A-j>` — Move line down
- [2] (core) `<A-j>` — Move line down
- [3] (core) `<A-j>` — Move selection down
### <A-k>
- [1] (core) `<A-k>` — Move line up
- [2] (core) `<A-k>` — Move line up
- [3] (core) `<A-k>` — Move selection up
### <C-Down>
- [1] (core) `<C-Down>` — Decrease window height
### <C-Left>
- [1] (core) `<C-Left>` — Decrease window width
### <C-PageDown>
- [1] (core) `<C-PageDown>` — Next tab
### <C-PageUp>
- [1] (core) `<C-PageUp>` — Previous tab
### <C-Right>
- [1] (core) `<C-Right>` — Increase window width
### <C-S-i>
- [1] (core) `<C-S-i>` — 
### <C-Up>
- [1] (core) `<C-Up>` — Increase window height
### <C-\\>
- [1] (core) `<C-\\>` — Jump forward in jumplist
### <C-e>
- [1] (core) `<C-e>` — Exit terminal mode
### <C-h>
- [1] (core) `<C-h>` — Go to left window
### <C-i>
- [1] (core) `<C-i>` — 
### <C-j>
- [1] (core) `<C-j>` — Go to lower window
### <C-k>
- [1] (core) `<C-k>` — Go to upper window
- [2] (lsp) `<C-k>` — 
### <C-l>
- [1] (core) `<C-l>` — Go to right window
### <C-n>
- [1] (core) `<C-n>` — 
### <C-p>
- [1] (core) `<C-p>` — 
### <C-s>
- [1] (core) `<C-s>` — Save file
- [2] (core) `<C-s>` — 
- [3] (core) `<C-s>` — 
### <Esc>
- [1] (core) `<Esc>` — 
### <Esc><Esc>
- [1] (core) `<Esc><Esc>` — Exit terminal mode
### <S-Tab>
- [1] (core) `<S-Tab>` — 
### <S-h>
- [1] (core) `<S-h>` — Previous Buffer
- [2] (core) `<S-h>` — Previous buffer
### <S-l>
- [1] (core) `<S-l>` — Next Buffer
- [2] (core) `<S-l>` — Next buffer
- [3] (ui) `<S-l>` — Next Buffer
### <Tab>
- [1] (core) `<Tab>` — 
### <c-s>
- [1] (core) `<c-s>` — Toggle Flash Search
### <leader>
- [1] (core) `<leader>` — Go to tab 
### <leader>/
- [1] (navigation) `<leader>/` — 🔍 Search in Buffer
### <leader><leader>
- [1] (core) `<leader><leader>` — Switch to Last Buffer
- [2] (core) `<leader><leader>` — Switch to last buffer
### <leader>L
- [1] (core) `<leader>L` — Lazy
- [2] (core) `<leader>L` — Open Lazy
- [3] (core) `<leader>L` — 🚀 Open Lazy.nvim
### <leader>Lc
- [1] (core) `<leader>Lc` — 🧹 Clean plugins
### <leader>Lp
- [1] (core) `<leader>Lp` — 📊 Profile plugins
### <leader>Ls
- [1] (core) `<leader>Ls` — 🔄 Sync plugins
### <leader>Lu
- [1] (core) `<leader>Lu` — 🔄 Update plugins
### <leader>M
- [1] (core) `<leader>M` — Mason
### <leader>R
- [1] (core) `<leader>R` — Reload Config
- [2] (core) `<leader>R` — Reload config
### <leader>Y
- [1] (core) `<leader>Y` — Copy line to system clipboard
### <leader>a
- [1] (core) `<leader>a` — Harpoon File
### <leader>bD
- [1] (core) `<leader>bD` — Delete All But Current
### <leader>bd
- [1] (core) `<leader>bd` — Delete Buffer
### <leader>bd",
- [1] (ui) `<leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h>` — Previous Buffer
### <leader>bl
- [1] (core) `<leader>bl` — Delete Buffers to Left
### <leader>bo
- [1] (core) `<leader>bo` — Delete Other Buffers
### <leader>bp
- [1] (core) `<leader>bp` — Pick Buffer
### <leader>br
- [1] (core) `<leader>br` — Delete Buffers to Right
### <leader>cC
- [1] (lsp) `<leader>cC` — 
### <leader>cR
- [1] (lsp) `<leader>cR` — 
### <leader>cS
- [1] (core) `<leader>cS` — Workspace Symbols
### <leader>ca
- [1] (core) `<leader>ca` — Code Action
### <leader>cc
- [1] (lsp) `<leader>cc` — 
### <leader>cd
- [1] (core) `<leader>cd` — Diagnostics
- [2] (lsp) `<leader>cd` — 
### <leader>cf
- [1] (core) `<leader>cf` — Format
### <leader>cl
- [1] (lsp) `<leader>cl` — 
### <leader>cm
- [1] (lsp) `<leader>cm` — Mason
### <leader>cr
- [1] (core) `<leader>cr` — Rename
- [2] (lsp) `<leader>cr` — 
### <leader>cs
- [1] (core) `<leader>cs` — Document Symbols
- [2] (core) `<leader>cs` — Clear search highlights
### <leader>cy
- [1] (utils) `<leader>cy` — Clipboard history
### <leader>dO
- [1] (core) `<leader>dO` — Step Out
### <leader>db
- [1] (core) `<leader>db` — Toggle Breakpoint
### <leader>dc
- [1] (core) `<leader>dc` — Continue
### <leader>de
- [1] (core) `<leader>de` — Eval
### <leader>di
- [1] (core) `<leader>di` — Step Into
### <leader>do
- [1] (core) `<leader>do` — Step Over
### <leader>dr
- [1] (core) `<leader>dr` — Toggle REPL
### <leader>ds
- [1] (core) `<leader>ds` — Session
### <leader>dt
- [1] (core) `<leader>dt` — Terminate
### <leader>du
- [1] (core) `<leader>du` — Toggle Debug UI
### <leader>e
- [1] (core) `<leader>e` — 🌳 Toggle Neo-tree
### <leader>f/
- [1] (navigation) `<leader>f/` — 🔍 Search History
### <leader>fC
- [1] (core) `<leader>fC` — Commands
- [2] (navigation) `<leader>fC` — 💻 Commands
### <leader>fH
- [1] (navigation) `<leader>fH` — 📜 Command History
### <leader>fM
- [1] (core) `<leader>fM` — Man Pages
### <leader>fR
- [1] (navigation) `<leader>fR` — 🔗 References
### <leader>fS
- [1] (navigation) `<leader>fS` — 🏢 Workspace Symbols
### <leader>fb
- [1] (core) `<leader>fb` — Find Buffers
- [2] (navigation) `<leader>fb` — 📂 Buffers
### <leader>fc
- [1] (core) `<leader>fc` — Find Word
- [2] (navigation) `<leader>fc` — 🔤 Find String
### <leader>fd
- [1] (navigation) `<leader>fd` — 🩺 Diagnostics
### <leader>fe
- [1] (navigation) `<leader>fe` — 📁 File Browser
### <leader>ff
- [1] (core) `<leader>ff` — Find Files
- [2] (navigation) `<leader>ff` — 🔍 Find Files
### <leader>fg
- [1] (core) `<leader>fg` — Live Grep
- [2] (navigation) `<leader>fg` — 🔎 Live Grep
### <leader>fh
- [1] (core) `<leader>fh` — Help Tags
- [2] (navigation) `<leader>fh` — ❓ Help Tags
### <leader>fi
- [1] (navigation) `<leader>fi` — ⚙️ Implementations
### <leader>fk
- [1] (core) `<leader>fk` — Find Keymaps
- [2] (navigation) `<leader>fk` — ⌨️ Keymaps
### <leader>fm
- [1] (core) `<leader>fm` — Find Marks
- [2] (navigation) `<leader>fm` — 📖 Man Pages
### <leader>fo
- [1] (navigation) `<leader>fo` — ⚙️ Vim Options
### <leader>fr
- [1] (core) `<leader>fr` — Recent Files
- [2] (navigation) `<leader>fr` — 🕒 Recent Files
### <leader>fs
- [1] (navigation) `<leader>fs` — 📊 Document Symbols
### <leader>ft
- [1] (navigation) `<leader>ft` — 📝 Type Definitions
### <leader>gP
- [1] (core) `<leader>gP` — Git Pull
### <leader>gb
- [1] (core) `<leader>gb` — Git Branches
- [2] (navigation) `<leader>gb` — 🌿 Git Branches
### <leader>gc
- [1] (core) `<leader>gc` — Git Commit
- [2] (navigation) `<leader>gc` — 📝 Git Commits
### <leader>gd
- [1] (core) `<leader>gd` — Git Diff
### <leader>ge
- [1] (core) `<leader>ge` — 🔀 Git Status Tree
- [2] (navigation) `<leader>ge` — 🔀 Git Status
### <leader>gf
- [1] (core) `<leader>gf` — Git Files
- [2] (navigation) `<leader>gf` — 📂 Git Files
### <leader>gg
- [1] (core) `<leader>gg` — Neogit
### <leader>gh
- [1] (core) `<leader>gh` — Git History
### <leader>ghb
- [1] (core) `<leader>ghb` — Blame Line
### <leader>ghp
- [1] (core) `<leader>ghp` — Preview Hunk
### <leader>ghr
- [1] (core) `<leader>ghr` — Reset Hunk
### <leader>ghs
- [1] (core) `<leader>ghs` — Stage Hunk
### <leader>ghu
- [1] (core) `<leader>ghu` — Undo Stage Hunk
### <leader>gp
- [1] (core) `<leader>gp` — Git Push
### <leader>gs
- [1] (core) `<leader>gs` — Git Status
- [2] (navigation) `<leader>gs` — 📊 Git Status
### <leader>gx
- [1] (core) `<leader>gx` — Close Git Diff
### <leader>h
- [1] (core) `<leader>h` — Harpoon Menu
### <leader>hR
- [1] (git) `<leader>hR` — Reset buffer
### <leader>hS
- [1] (git) `<leader>hS` — Stage buffer
### <leader>hd
- [1] (git) `<leader>hd` — Diff this
### <leader>hp
- [1] (git) `<leader>hp` — Preview hunk
### <leader>hr
- [1] (git) `<leader>hr` — Reset hunk
### <leader>hs
- [1] (git) `<leader>hs` — Stage hunk
### <leader>hu
- [1] (git) `<leader>hu` — Undo stage hunk
### <leader>ji
- [1] (core) `<leader>ji` — Jump forward in jumplist
### <leader>jo
- [1] (core) `<leader>jo` — Jump backward in jumplist
### <leader>lp
- [1] (lsp) `<leader>lp` — Toggle Python LSP only
### <leader>lt
- [1] (lsp) `<leader>lt` — Toggle LSP servers
### <leader>mC
- [1] (core) `<leader>mC` — Multi-cursor at End
### <leader>mc
- [1] (core) `<leader>mc` — Multi-cursor at Match
- [2] (core) `<leader>mc` — Multi-cursor at Every Match
### <leader>o
- [1] (core) `<leader>o` — 📁 Open Oil
### <leader>qq
- [1] (core) `<leader>qq` — Quit All
### <leader>rI
- [1] (core) `<leader>rI` — 
### <leader>rb
- [1] (core) `<leader>rb` — Build Project
- [2] (core) `<leader>rb` — 
### <leader>rbf
- [1] (core) `<leader>rbf` — 
### <leader>rc
- [1] (core) `<leader>rc` — Close Tasks
### <leader>re
- [1] (core) `<leader>re` — 
### <leader>rf
- [1] (core) `<leader>rf` — 
### <leader>ro
- [1] (core) `<leader>ro` — Open Tasks
- [2] (utils) `<leader>ro` — Open tasks
### <leader>rr
- [1] (core) `<leader>rr` — Run Task
- [2] (utils) `<leader>rr` — Run task
### <leader>rt
- [1] (core) `<leader>rt` — Toggle Tasks
- [2] (utils) `<leader>rt` — Toggle tasks
### <leader>rv
- [1] (core) `<leader>rv` — 
### <leader>sD
- [1] (core) `<leader>sD` — Delete Snapshot
### <leader>sR
- [1] (core) `<leader>sR` — Restore Snapshot
### <leader>sS
- [1] (core) `<leader>sS` — Save Snapshot
### <leader>sd
- [1] (core) `<leader>sd` — Delete Session
### <leader>se
- [1] (core) `<leader>se` — Make windows equal size
### <leader>sf
- [1] (core) `<leader>sf` — Replace in File
- [2] (editor) `<leader>sf` — Replace in File
### <leader>sh
- [1] (core) `<leader>sh` — Split window horizontally
### <leader>sl
- [1] (core) `<leader>sl` — List/Search Sessions
### <leader>so
- [1] (navigation) `<leader>so` — Symbols Outline (Aerial)
### <leader>sr
- [1] (core) `<leader>sr` — Replace in Project
- [2] (core) `<leader>sr` — Replace Selection
- [3] (editor) `<leader>sr` — Replace in Project
- [4] (editor) `<leader>sr` — 
### <leader>ss
- [1] (core) `<leader>ss` — Save Session
### <leader>st
- [1] (core) `<leader>st` — Todo
### <leader>sv
- [1] (core) `<leader>sv` — Split window vertically
### <leader>sx
- [1] (core) `<leader>sx` — Close current window
### <leader>tb
- [1] (git) `<leader>tb` — Toggle line blame
### <leader>td
- [1] (git) `<leader>td` — Toggle deleted
### <leader>tf
- [1] (core) `<leader>tf` — Open current buffer in new tab
### <leader>tn
- [1] (core) `<leader>tn` — Go to next tab
- [2] (core) `<leader>tn` — Toggle line numbers
### <leader>to
- [1] (core) `<leader>to` — Open new tab
### <leader>tp
- [1] (core) `<leader>tp` — Go to previous tab
### <leader>tr
- [1] (core) `<leader>tr` — Toggle relative numbers
### <leader>ts
- [1] (core) `<leader>ts` — Toggle spell check
### <leader>tw
- [1] (core) `<leader>tw` — Toggle word wrap
### <leader>tx
- [1] (core) `<leader>tx` — Close current tab
### <leader>uc
- [1] (core) `<leader>uc` — Toggle Colorizer
### <leader>um
- [1] (core) `<leader>um` — Toggle Minimap
### <leader>un
- [1] (core) `<leader>un` — Toggle Line Numbers
### <leader>ur
- [1] (core) `<leader>ur` — Toggle Relative Numbers
### <leader>us
- [1] (core) `<leader>us` — Toggle Spell Check
### <leader>ut
- [1] (core) `<leader>ut` — 🎆 Switch themes
### <leader>uw
- [1] (core) `<leader>uw` — Toggle Word Wrap
### <leader>uz
- [1] (core) `<leader>uz` — Zen Mode
### <leader>w
- [1] (core) `<leader>w` — Window commands
### <leader>wS
- [1] (core) `<leader>wS` — Workspace: Sessions in current
### <leader>wa
- [1] (lsp) `<leader>wa` — 
### <leader>wd
- [1] (core) `<leader>wd` — Workspace: Delete
### <leader>wl
- [1] (core) `<leader>wl` — Workspace: List/Open
### <leader>wn
- [1] (core) `<leader>wn` — 
### <leader>wo
- [1] (core) `<leader>wo` — Workspace: Open by name
### <leader>wr
- [1] (core) `<leader>wr` — Workspace: Rename
- [2] (lsp) `<leader>wr` — 
### <leader>xX
- [1] (core) `<leader>xX` — 
- [2] (lsp) `<leader>xX` — Buffer Diagnostics (Trouble)
### <leader>xe
- [1] (core) `<leader>xe` — Show Diagnostics
### <leader>xl
- [1] (core) `<leader>xl` — 
- [2] (lsp) `<leader>xl` — Location List (Trouble)
### <leader>xq
- [1] (core) `<leader>xq` — 
- [2] (lsp) `<leader>xq` — Quickfix List (Trouble)
### <leader>xx
- [1] (core) `<leader>xx` — 
- [2] (lsp) `<leader>xx` — Diagnostics (Trouble)
### >
- [1] (core) `>` — Indent right and reselect
### K
- [1] (core) `K` — Hover Documentation
- [2] (lsp) `K` — 
### N
- [1] (core) `N` — 
### Q
- [1] (core) `Q` — 
### S",
- [1] (navigation) `S", mode = { "n` — 
### [b
- [1] (core) `[b` — Previous Buffer
- [2] (ui) `[b` — Previous Buffer
### [d
- [1] (core) `[d` — Prev Diagnostic
- [2] (lsp) `[d` — 
### [h
- [1] (core) `[h` — Prev Hunk
### [t
- [1] (core) `[t` — Previous Todo
### ]b
- [1] (core) `]b` — Next Buffer
- [2] (ui) `]b` — Next Buffer
### ]d
- [1] (core) `]d` — Next Diagnostic
- [2] (lsp) `]d` — 
### ]h
- [1] (core) `]h` — Next Hunk
### ]t
- [1] (core) `]t` — Next Todo
### ]t",
- [1] (editor) `]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
    { "<leader>st` — Todo (Telescope)
### gD
- [1] (core) `gD` — Go to Declaration
- [2] (lsp) `gD` — 
### gI
- [1] (lsp) `gI` — 
### gK
- [1] (lsp) `gK` — 
### gT
- [1] (core) `gT` — Previous tab
### gc",
- [1] (editor) `gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n` — 
### gcc",
- [1] (editor) `gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n` — 
### gd
- [1] (core) `gd` — Go to Definition
- [2] (lsp) `gd` — 
### gi
- [1] (core) `gi` — Go to Implementation
### gr
- [1] (core) `gr` — Go to References
- [2] (lsp) `gr` — 
### gt
- [1] (core) `gt` — Go to Type Definition
- [2] (core) `gt` — Next tab
### gy
- [1] (lsp) `gy` — 
### jj
- [1] (core) `jj` — Exit insert mode
### jk
- [1] (core) `jk` — Exit insert mode
### n
- [1] (core) `n` — 
- [2] (core) `n` — 
- [3] (core) `n` — 
- [4] (core) `n` — 
- [5] (core) `n` — 
- [6] (core) `n` — 
- [7] (core) `n` — 
- [8] (core) `n` — 
- [9] (core) `n` — 
- [10] (core) `n` — 
- [11] (core) `n` — 
- [12] (core) `n` — 
- [13] (core) `n` — 
- [14] (core) `n` — 
- [15] (core) `n` — 
- [16] (core) `n` — 
- [17] (core) `n` — 
- [18] (core) `n` — 
- [19] (core) `n` — 
- [20] (core) `n` — 
- [21] (core) `n` — 
- [22] (core) `n` — 
- [23] (core) `n` — 
- [24] (core) `n` — 
- [25] (core) `n` — 
- [26] (editor) `n` — 
- [27] (editor) `n` — 
- [28] (git) `n` — 
- [29] (git) `n` — 
- [30] (git) `n` — 
- [31] (git) `n` — 
- [32] (lsp) `n` — 
- [33] (lsp) `n` — 
- [34] (lsp) `n` — 
- [35] (ui) `n` — 
- [36] (ui) `n` — 
- [37] (ui) `n` — 
### o
- [1] (core) `o` — Treesitter Search
### p
- [1] (core) `p` — 
### q
- [1] (core) `q` — 
- [2] (core) `q` — Close window
- [3] (core) `q` — Quit buffer
### r
- [1] (core) `r` — Remote Flash
### r",
- [1] (navigation) `r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o` — 
### s",
- [1] (navigation) `s", mode = { "n` — 
### v
- [1] (editor) `v` — 
- [2] (editor) `v` — 
- [3] (editor) `v` — 
- [4] (editor) `v` — 
- [5] (editor) `v` — 
- [6] (git) `v` — 
- [7] (git) `v` — 
- [8] (lsp) `v` — 
- [9] (lsp) `v` — 
### x
- [1] (core) `x` — Flash
- [2] (core) `x` — Flash Treesitter
- [3] (core) `x` — 
- [4] (core) `x` — Increment number
- [5] (core) `x` — Decrement number
- [6] (core) `x` — 
- [7] (core) `x` — 
- [8] (core) `x` — Copy to system clipboard
- [9] (core) `x` — Paste from system clipboard
- [10] (core) `x` — 
- [11] (core) `x` — 
- [12] (core) `x` — Go to first non-blank
- [13] (core) `x` — Go to end of line
- [14] (git) `x` — Select hunk
## Cross-Reference by File
### lua/completion/blink-enhanced.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  ⚡ BLINK ENHANCED - VS Code-like Completion Experience
- ═══════════════════════════════════════════════════════════════════════════════
### lua/core/autocmds.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔄 AUTOCMDS - Revolutionary User Experience
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `q` [n] — Close window; → `<cmd>close<cr>`
  002. `n` [n] — ; → `<leader>cc`
  003. `n` [n] — ; → `<leader>cr`
  004. `q` [n] — Quit buffer; → `<cmd>close<cr>`
### lua/core/functional-keymaps.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🎯 FUNCTIONAL KEYMAPS - Actually Working Keybindings!
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>ff` [n] — Find Files; → `<cmd>Telescope find_files<cr>`
  002. `<leader>fg` [n] — Live Grep; → `<cmd>Telescope live_grep<cr>`
  003. `<leader>fb` [n] — Find Buffers; → `<cmd>Telescope buffers<cr>`
  004. `<leader>fh` [n] — Help Tags; → `<cmd>Telescope help_tags<cr>`
  005. `<leader>fr` [n] — Recent Files; → `<cmd>Telescope oldfiles<cr>`
  006. `<leader>fc` [n] — Find Word; → `<cmd>Telescope grep_string<cr>`
  007. `<leader>fm` [n] — Find Marks; → `<cmd>Telescope marks<cr>`
  008. `<leader>fM` [n] — Man Pages; → `<cmd>Telescope man_pages<cr>`
  009. `<leader>fk` [n] — Find Keymaps; → `<cmd>Telescope keymaps<cr>`
  010. `<leader>fC` [n] — Commands; → `<cmd>Telescope commands<cr>`
  011. `n` [n] — ; → `<leader>a`
  012. `n` [n] — ; → `<leader>h`
  013. `n` [n] — ; → `<leader>1`
  014. `n` [n] — ; → `<leader>2`
  015. `n` [n] — ; → `<leader>3`
  016. `n` [n] — ; → `<leader>4`
  017. `<leader>a` [n] — Harpoon File; → `<cmd>echo 'Harpoon not available'<cr>`
  018. `<leader>h` [n] — Harpoon Menu; → `<cmd>echo 'Harpoon not available'<cr>`
  019. `<leader>e` [n] — 🌳 Toggle Neo-tree; → `<cmd>Neotree toggle<cr>`
  020. `<leader>ge` [n] — 🔀 Git Status Tree; → `<cmd>Neotree float git_status<cr>`
  021. `<leader>wn` [n] — ; → `<cmd>WorkspaceNew<cr>`
  022. `n` [n] — ; → `<leader>ws`
  023. `<leader>wl` [n] — Workspace: List/Open; → `<cmd>WorkspaceList<cr>`
  024. `<leader>wo` [n] — Workspace: Open by name; → `<cmd>WorkspaceOpen<cr>`
  025. `<leader>wd` [n] — Workspace: Delete; → `<cmd>WorkspaceDelete<cr>`
  026. `<leader>wr` [n] — Workspace: Rename; → `<cmd>WorkspaceRename<cr>`
  027. `<leader>wS` [n] — Workspace: Sessions in current; → `<cmd>WorkspaceSessions<cr>`
  028. `<leader>o` [n] — 📁 Open Oil; → `<cmd>Oil<cr>`
  029. `<leader>ss` [n] — Save Session; → `<cmd>SaveSession<cr>`
  030. `<leader>sl` [n] — List/Search Sessions; → `<cmd>SessionList<cr>`
  031. `<leader>sd` [n] — Delete Session; → `<cmd>DeleteSession<cr>`
  032. `<leader>sS` [n] — Save Snapshot; → `<cmd>SessionSnapshotSave<cr>`
  033. `<leader>sR` [n] — Restore Snapshot; → `<cmd>SessionSnapshotList<cr>`
  034. `<leader>sD` [n] — Delete Snapshot; → `<cmd>SessionSnapshotDelete<cr>`
  035. `<leader>qq` [n] — Quit All; → `<cmd>qa<cr>`
  036. `<leader>ca` [n] — Code Action; → `Code Action`
  037. `<leader>cd` [n] — Diagnostics; → `<cmd>Telescope diagnostics<cr>`
  038. `<leader>cr` [n] — Rename; → `Rename`
  039. `<leader>cf` [n] — Format; → `Format`
  040. `<leader>cs` [n] — Document Symbols; → `<cmd>Telescope lsp_document_symbols<cr>`
  041. `<leader>cS` [n] — Workspace Symbols; → `<cmd>Telescope lsp_workspace_symbols<cr>`
  042. `gd` [n] — Go to Definition; → `Go to Definition`
  043. `gD` [n] — Go to Declaration; → `Go to Declaration`
  044. `gi` [n] — Go to Implementation; → `Go to Implementation`
  045. `gt` [n] — Go to Type Definition; → `Go to Type Definition`
  046. `gr` [n] — Go to References; → `Go to References`
  047. `K` [n] — Hover Documentation; → `Hover Documentation`
  048. `<leader>gg` [n] — Neogit; → `<cmd>Neogit<cr>`
  049. `<leader>gs` [n] — Git Status; → `<cmd>Neogit kind=split<cr>`
  050. `<leader>gc` [n] — Git Commit; → `<cmd>Neogit commit<cr>`
  051. `<leader>gp` [n] — Git Push; → `<cmd>Neogit push<cr>`
  052. `<leader>gP` [n] — Git Pull; → `<cmd>Neogit pull<cr>`
  053. `<leader>gb` [n] — Git Branches; → `<cmd>Telescope git_branches<cr>`
  054. `<leader>gf` [n] — Git Files; → `<cmd>Telescope git_files<cr>`
  055. `<leader>gh` [n] — Git History; → `<cmd>DiffviewFileHistory<cr>`
  056. `<leader>gd` [n] — Git Diff; → `<cmd>DiffviewOpen<cr>`
  057. `<leader>gx` [n] — Close Git Diff; → `<cmd>DiffviewClose<cr>`
  058. `]h` [n] — Next Hunk; → `<cmd>Gitsigns next_hunk<cr>`
  059. `[h` [n] — Prev Hunk; → `<cmd>Gitsigns prev_hunk<cr>`
  060. `<leader>ghs` [n] — Stage Hunk; → `<cmd>Gitsigns stage_hunk<cr>`
  061. `<leader>ghu` [n] — Undo Stage Hunk; → `<cmd>Gitsigns undo_stage_hunk<cr>`
  062. `<leader>ghr` [n] — Reset Hunk; → `<cmd>Gitsigns reset_hunk<cr>`
  063. `<leader>ghp` [n] — Preview Hunk; → `<cmd>Gitsigns preview_hunk<cr>`
  064. `<leader>ghb` [n] — Blame Line; → `<cmd>Gitsigns blame_line<cr>`
  065. `<leader>rr` [n] — Run Task; → `<cmd>OverseerRun<cr>`
  066. `<leader>rt` [n] — Toggle Tasks; → `<cmd>OverseerToggle<cr>`
  067. `<leader>ro` [n] — Open Tasks; → `<cmd>OverseerOpen<cr>`
  068. `<leader>rc` [n] — Close Tasks; → `<cmd>OverseerClose<cr>`
  069. `<leader>rb` [n] — Build Project; → `<cmd>OverseerBuild<cr>`
  070. `<leader>db` [n] — Toggle Breakpoint; → `Toggle Breakpoint`
  071. `<leader>dc` [n] — Continue; → `Continue`
  072. `<leader>di` [n] — Step Into; → `Step Into`
  073. `<leader>do` [n] — Step Over; → `Step Over`
  074. `<leader>dO` [n] — Step Out; → `Step Out`
  075. `<leader>dr` [n] — Toggle REPL; → `Toggle REPL`
  076. `<leader>ds` [n] — Session; → `Session`
  077. `<leader>dt` [n] — Terminate; → `Terminate`
  078. `<leader>du` [n] — Toggle Debug UI; → `Toggle Debug UI`
  079. `<leader>de` [n] — Eval; → `Eval`
  080. `<leader>xx` [n] — ; → `<cmd>Trouble diagnostics toggle<cr>`
  081. `<leader>xX` [n] — ; → `<cmd>Trouble diagnostics toggle filter.buf=0<cr>`
  082. `<leader>xl` [n] — ; → `<cmd>Trouble loclist toggle<cr>`
  083. `<leader>xq` [n] — ; → `<cmd>Trouble qflist toggle<cr>`
  084. `]d` [n] — Next Diagnostic; → `Next Diagnostic`
  085. `[d` [n] — Prev Diagnostic; → `Prev Diagnostic`
  086. `<leader>xe` [n] — Show Diagnostics; → `Show Diagnostics`
  087. `<leader>uz` [n] — Zen Mode; → `<cmd>ZenMode<cr>`
  088. `<leader>um` [n] — Toggle Minimap; → `<cmd>MinimapToggle<cr>`
  089. `<leader>uw` [n] — Toggle Word Wrap; → `<cmd>set wrap!<cr>`
  090. `<leader>un` [n] — Toggle Line Numbers; → `<cmd>set number!<cr>`
  091. `<leader>ur` [n] — Toggle Relative Numbers; → `<cmd>set relativenumber!<cr>`
  092. `<leader>us` [n] — Toggle Spell Check; → `<cmd>set spell!<cr>`
  093. `<leader>uc` [n] — Toggle Colorizer; → `<cmd>ColorizerToggle<cr>`
  094. `<leader>bd` [n] — Delete Buffer; → `<cmd>bdelete<cr>`
  095. `<leader>bD` [n] — Delete All But Current; → `<cmd>%bdelete|edit#|normal `\`
  096. `<leader>bl` [n] — Delete Buffers to Left; → `<cmd>BufferLineCloseLeft<cr>`
  097. `<leader>br` [n] — Delete Buffers to Right; → `<cmd>BufferLineCloseRight<cr>`
  098. `<leader>bp` [n] — Pick Buffer; → `<cmd>BufferLinePick<cr>`
  099. `<leader>bo` [n] — Delete Other Buffers; → `<cmd>BufferLineCloseOthers<cr>`
  100. `<S-h>` [n] — Previous Buffer; → `<cmd>BufferLineCyclePrev<cr>`
  101. `<S-l>` [n] — Next Buffer; → `<cmd>BufferLineCycleNext<cr>`
  102. `[b` [n] — Previous Buffer; → `<cmd>BufferLineCyclePrev<cr>`
  103. `]b` [n] — Next Buffer; → `<cmd>BufferLineCycleNext<cr>`
  104. `<leader>sr` [n] — Replace in Project; → `<cmd>Spectre<cr>`
  105. `<leader>sf` [n] — Replace in File; → `<cmd>Spectre open_file_search<cr>`
  106. `<leader>sr` [v] — Replace Selection; → `<cmd>Spectre open_visual<cr>`
  107. `<leader>L` [n] — Lazy; → `<cmd>Lazy<cr>`
  108. `<leader>M` [n] — Mason; → `<cmd>Mason<cr>`
  109. `]t` [n] — Next Todo; → `<cmd>TodoNext<cr>`
  110. `[t` [n] — Previous Todo; → `<cmd>TodoPrev<cr>`
  111. `<leader>st` [n] — Todo; → `<cmd>TodoTelescope<cr>`
  112. `x` [n] — Flash; → `o`
  113. `x` [n] — Flash Treesitter; → `o`
  114. `r` [o] — Remote Flash; → `Remote Flash`
  115. `o` [x] — Treesitter Search; → `R`
  116. `<c-s>` [c] — Toggle Flash Search; → `Toggle Flash Search`
  117. `<leader>mc` [n] — Multi-cursor at Match; → `Multi-cursor at Match`
  118. `<leader>mc` [v] — Multi-cursor at Every Match; → `Multi-cursor at Every Match`
  119. `<leader>mC` [n] — Multi-cursor at End; → `Multi-cursor at End`
  120. `<leader>re` [x] — ; → `Extract Function`
  121. `<leader>rf` [x] — ; → `Extract Function To File`
  122. `<leader>rv` [x] — ; → `Extract Variable`
  123. `<leader>rI` [n] — ; → `Inline Function`
  124. `x` [n] — ; → `<leader>ri`
  125. `<leader>rb` [n] — ; → `Extract Block`
  126. `<leader>rbf` [n] — ; → `Extract Block To File`
  127. `<leader>R` [n] — Reload Config; → `<cmd>source $MYVIMRC<cr>`
  128. `<leader><leader>` [n] — Switch to Last Buffer; → `<C-^>`
### lua/core/init.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🌟 CORE MODULE - The Perfect Neovim Configuration
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :Docs — Open Neovim config guide (docs/Guide.md)
### lua/core/keymaps.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  ⌨️ CORE KEYMAPS - Professional Workflow
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `jj` [i] — Exit insert mode; → `<ESC>`
  002. `jk` [i] — Exit insert mode; → `<ESC>`
  003. `<C-e>` [t] — Exit terminal mode; → `<C-\\><C-n>`
  004. `<Esc><Esc>` [t] — Exit terminal mode; → `<C-\\><C-n>`
  005. `<leader>cs` [n] — Clear search highlights; → `<cmd>nohlsearch<CR>`
  006. `<Esc>` [n] — ; → `<cmd>nohlsearch<CR>`
  007. `x` [n] — Increment number; → `=`
  008. `x` [n] — Decrement number; → `-`
  009. `x` [n] — ; → `x`
  010. `x` [n] — ; → `<leader>d`
  011. `p` [x] — ; → `_dP', { desc = `
  012. `<` [x] — Indent left and reselect; → `<gv`
  013. `>` [x] — Indent right and reselect; → `>gv`
  014. `<Tab>` [x] — ; → `>gv`
  015. `<S-Tab>` [x] — ; → `<gv`
  016. `<A-j>` [n] — Move line down; → `<cmd>m .+1<CR>==`
  017. `<A-k>` [n] — Move line up; → `<cmd>m .-2<CR>==`
  018. `<A-j>` [i] — Move line down; → `<Esc><cmd>m .+1<CR>==gi`
  019. `<A-k>` [i] — Move line up; → `<Esc><cmd>m .-2<CR>==gi`
  020. `<A-j>` [x] — Move selection down; → `:m '>+1<CR>gv=gv`
  021. `<A-k>` [x] — Move selection up; → `:m '<-2<CR>gv=gv`
  022. `<leader>Y` [n] — Copy line to system clipboard; → `+Y', { desc = `
  023. `x` [n] — Copy to system clipboard; → `<leader>y`
  024. `x` [n] — Paste from system clipboard; → `<leader>p`
  025. `x` [n] — ; → `j`
  026. `x` [n] — ; → `k`
  027. `x` [n] — Go to first non-blank; → `H`
  028. `x` [n] — Go to end of line; → `L`
  029. `n` [n] — ; → `nzzzv`
  030. `N` [n] — ; → `Nzzzv`
  031. `<S-h>` [n] — Previous buffer; → `<cmd>bprevious<cr>`
  032. `<S-l>` [n] — Next buffer; → `<cmd>bnext<cr>`
  033. `<C-i>` [n] — ; → `<cmd>bnext<cr>`
  034. `<C-S-i>` [n] — ; → `<cmd>bprevious<cr>`
  035. `<C-h>` [n] — Go to left window; → `<C-w>h`
  036. `<C-j>` [n] — Go to lower window; → `<C-w>j`
  037. `<C-k>` [n] — Go to upper window; → `<C-w>k`
  038. `<C-l>` [n] — Go to right window; → `<C-w>l`
  039. `<leader>sv` [n] — Split window vertically; → `<C-w>v`
  040. `<leader>sh` [n] — Split window horizontally; → `<C-w>s`
  041. `<leader>se` [n] — Make windows equal size; → `<C-w>=`
  042. `<leader>sx` [n] — Close current window; → `<C-w>c`
  043. `<C-Up>` [n] — Increase window height; → `<cmd>resize +2<cr>`
  044. `<C-Down>` [n] — Decrease window height; → `<cmd>resize -2<cr>`
  045. `<C-Left>` [n] — Decrease window width; → `<cmd>vertical resize -2<cr>`
  046. `<C-Right>` [n] — Increase window width; → `<cmd>vertical resize +2<cr>`
  047. `<leader>to` [n] — Open new tab; → `<cmd>tabnew<cr>`
  048. `<leader>tx` [n] — Close current tab; → `<cmd>tabclose<cr>`
  049. `<leader>tn` [n] — Go to next tab; → `<cmd>tabn<cr>`
  050. `<leader>tp` [n] — Go to previous tab; → `<cmd>tabp<cr>`
  051. `<leader>tf` [n] — Open current buffer in new tab; → `<cmd>tabnew %<cr>`
  052. `gt` [n] — Next tab; → `<cmd>tabnext<cr>`
  053. `gT` [n] — Previous tab; → `<cmd>tabprevious<cr>`
  054. `<C-PageDown>` [n] — Next tab; → `<cmd>tabnext<cr>`
  055. `<C-PageUp>` [n] — Previous tab; → `<cmd>tabprevious<cr>`
  056. `<leader>` [n] — Go to tab ; → `gt`
  057. `<C-\\>` [n] — Jump forward in jumplist; → `<C-i>`
  058. `<leader>ji` [n] — Jump forward in jumplist; → `<C-i>`
  059. `<leader>jo` [n] — Jump backward in jumplist; → `<C-o>`
  060. `<leader>R` [n] — Reload config; → `<cmd>source $MYVIMRC<cr>`
  061. `<C-s>` [n] — Save file; → `<cmd>w<cr>`
  062. `<C-s>` [i] — ; → `<Esc><cmd>w<cr>a`
  063. `<C-s>` [v] — ; → `<Esc><cmd>w<cr>`
  064. `<leader>L` [n] — Open Lazy; → `<cmd>Lazy<cr>`
  065. `<leader>tw` [n] — Toggle word wrap; → `<cmd>set wrap!<cr>`
  066. `<leader>tn` [n] — Toggle line numbers; → `<cmd>set number!<cr>`
  067. `<leader>tr` [n] — Toggle relative numbers; → `<cmd>set relativenumber!<cr>`
  068. `<leader>ts` [n] — Toggle spell check; → `<cmd>set spell!<cr>`
  069. `<leader>ut` [n] — 🎆 Switch themes; → `<cmd>Themery<cr>`
  070. `n` [n] — ; → `<leader>u1`
  071. `n` [n] — ; → `<leader>u2`
  072. `n` [n] — ; → `<leader>u3`
  073. `n` [n] — ; → `<leader>u4`
  074. `n` [n] — ; → `<leader>u5`
  075. `n` [n] — ; → `<leader>u6`
  076. `n` [n] — ; → `<leader>u7`
  077. `n` [n] — ; → `<leader>u8`
  078. `n` [n] — ; → `<leader>uT`
  079. `n` [n] — ; → `[d`
  080. `n` [n] — ; → `]d`
  081. `n` [n] — ; → `<leader>q`
  082. `n` [n] — ; → `<leader>cp`
  083. `n` [n] — ; → `<leader>cc`
  084. `n` [n] — ; → `<leader>sp`
  085. `Q` [n] — ; → `<nop>`
  086. `q` [n] — ; → `<nop>`
  087. `<C-p>` [c] — ; → `<nop>`
  088. `<C-n>` [c] — ; → `<nop>`
  089. `<leader>w` [n] — Window commands; → `<C-w>`
  090. `<leader><leader>` [n] — Switch to last buffer; → `<C-^>`
### lua/core/lazy.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📦 LAZY.NVIM - Ultimate Plugin Manager Bootstrap
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>L` [n] — 🚀 Open Lazy.nvim; → `<cmd>Lazy<cr>`
  002. `<leader>Lu` [n] — 🔄 Update plugins; → `<cmd>Lazy update<cr>`
  003. `<leader>Ls` [n] — 🔄 Sync plugins; → `<cmd>Lazy sync<cr>`
  004. `<leader>Lc` [n] — 🧹 Clean plugins; → `<cmd>Lazy clean<cr>`
  005. `<leader>Lp` [n] — 📊 Profile plugins; → `<cmd>Lazy profile<cr>`
### lua/core/options.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  ⚙️ CORE OPTIONS - Ultimate IDE Settings
- ═══════════════════════════════════════════════════════════════════════════════
### lua/debugging/dap-ui.lua
### lua/debugging/dap.lua
### lua/debugging/neotest.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧪 NEOTEST - Run tests inside Neovim with beautiful UI
- ═══════════════════════════════════════════════════════════════════════════════
### lua/editor/autopairs.lua
### lua/editor/comment.lua
#### Keymaps
  001. `gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n` [] — ; → `o`
  002. `gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n` [] — ; → `o`
### lua/editor/dial.lua
#### Keymaps
  001. `n` [n] — ; → `<C-a>`
  002. `n` [n] — ; → `<C-x>`
  003. `v` [n] — ; → `<C-a>`
  004. `v` [n] — ; → `<C-x>`
  005. `v` [n] — ; → `g<C-a>`
  006. `v` [n] — ; → `g<C-x>`
### lua/editor/formatting.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧼 Conform.nvim - Format-on-save with zero bloat
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :Format — 
#### Keymaps
  001. `v` [n] — ; → `<leader>cf`
### lua/editor/multicursor.lua
### lua/editor/refactoring.lua
### lua/editor/spectre.lua
#### Keymaps
  001. `<leader>sr` [] — Replace in Project; → `<cmd>Spectre<cr>`
  002. `<leader>sf` [] — Replace in File; → `<cmd>Spectre open_file_search<cr>`
  003. `<leader>sr` [] — ; → `<esc><cmd>Spectre open_visual<cr>`
### lua/editor/surround.lua
### lua/editor/todo-comments.lua
#### Keymaps
  001. `]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
    { "<leader>st` [] — Todo (Telescope); → `<cmd>TodoTelescope<cr>`
### lua/editor/treesitter-ultimate.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🌳 ULTIMATE TREESITTER - Complete Syntax Highlighting
- ═══════════════════════════════════════════════════════════════════════════════
### lua/git/diffview.lua
### lua/git/gitsigns.lua
#### Keymaps
  001. `n` [n] — ; → `]h`
  002. `n` [n] — ; → `[h`
  003. `<leader>hs` [n] — Stage hunk; → `Stage hunk`
  004. `<leader>hr` [n] — Reset hunk; → `Reset hunk`
  005. `v` [n] — ; → `<leader>hs`
  006. `v` [n] — ; → `<leader>hr`
  007. `<leader>hS` [n] — Stage buffer; → `Stage buffer`
  008. `<leader>hu` [n] — Undo stage hunk; → `Undo stage hunk`
  009. `<leader>hR` [n] — Reset buffer; → `Reset buffer`
  010. `<leader>hp` [n] — Preview hunk; → `Preview hunk`
  011. `n` [n] — ; → `<leader>hb`
  012. `<leader>tb` [n] — Toggle line blame; → `Toggle line blame`
  013. `<leader>hd` [n] — Diff this; → `Diff this`
  014. `n` [n] — ; → `<leader>hD`
  015. `<leader>td` [n] — Toggle deleted; → `Toggle deleted`
  016. `x` [o] — Select hunk; → `ih`
### lua/git/neogit.lua
### lua/lsp/actions-preview.lua
### lua/lsp/init.lua
- LSP plugins loader
- Skips utils.lua which is a utility module, not a plugin spec
### lua/lsp/lspconfig-ultimate.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🚀 ULTIMATE LSP CONFIG - Complete Language Support
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `gd` [n] — ; → `Go to Definition`
  002. `gr` [n] — ; → `Go to References`
  003. `gI` [n] — ; → `Go to Implementation`
  004. `gy` [n] — ; → `Go to Type Definition`
  005. `gD` [n] — ; → `Go to Declaration`
  006. `K` [n] — ; → `Hover Documentation`
  007. `gK` [n] — ; → `Signature Help`
  008. `<C-k>` [i] — ; → `Signature Help`
  009. `v` [n] — ; → `<leader>ca`
  010. `<leader>cc` [n] — ; → `Run Codelens`
  011. `<leader>cC` [n] — ; → `Refresh Codelens`
  012. `<leader>cr` [n] — ; → `Rename`
  013. `<leader>cd` [n] — ; → `Line Diagnostics`
  014. `<leader>cl` [n] — ; → `<cmd>LspInfo<cr>`
  015. `<leader>cR` [n] — ; → `<cmd>LspRestart<cr>`
  016. `]d` [n] — ; → `Next Diagnostic`
  017. `[d` [n] — ; → `Prev Diagnostic`
  018. `<leader>wa` [n] — ; → `Add Workspace Folder`
  019. `<leader>wr` [n] — ; → `Remove Workspace Folder`
  020. `n` [n] — ; → `<leader>wl`
  021. `n` [n] — ; → `<leader>cf`
  022. `v` [n] — ; → `<leader>cf`
  023. `n` [n] — ; → `<leader>ch`
### lua/lsp/mason.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔧 MASON CONFIG - LSP Server Management
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>cm` [] — Mason; → `<cmd>Mason<cr>`
### lua/lsp/trouble.lua
#### Keymaps
  001. `<leader>xx` [] — Diagnostics (Trouble); → `<cmd>Trouble diagnostics toggle<cr>`
  002. `<leader>xX` [] — Buffer Diagnostics (Trouble); → `<cmd>Trouble diagnostics toggle filter.buf=0<cr>`
  003. `<leader>xl` [] — Location List (Trouble); → `<cmd>Trouble loclist toggle<cr>`
  004. `<leader>xq` [] — Quickfix List (Trouble); → `<cmd>Trouble qflist toggle<cr>`
### lua/lsp/utils.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔧 LSP UTILITIES - Advanced LSP Controls
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>lt` [n] — Toggle LSP servers; → `Toggle LSP servers`
  002. `<leader>lp` [n] — Toggle Python LSP only; → `Toggle Python LSP only`
### lua/navigation/aerial.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧭 AERIAL - Symbols outline sidebar
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>so` [] — Symbols Outline (Aerial); → `<cmd>AerialToggle!<cr>`
### lua/navigation/flash.lua
#### Keymaps
  001. `s", mode = { "n` [] — ; → `x`
  002. `S", mode = { "n` [] — ; → `x`
  003. `r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o` [] — ; → `x`
### lua/navigation/harpoon.lua
### lua/navigation/neo-tree-enhanced.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🌳 NEO-TREE - Enhanced UI with curved aesthetics
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>ge` [] — 🔀 Git Status; → `<cmd>Neotree float git_status<cr>`
### lua/navigation/oil.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🛢️  OIL NEXUS - Ultra-Modern Directory Editor
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `-` [] — Open parent directory; → `<CMD>Oil<CR>`
### lua/navigation/telescope-fixed.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔭 TELESCOPE FIXED - Complete with Image Preview & All Features
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>ff` [] — 🔍 Find Files; → `<cmd>Telescope find_files<cr>`
  002. `<leader>fg` [] — 🔎 Live Grep; → `<cmd>Telescope live_grep<cr>`
  003. `<leader>fb` [] — 📂 Buffers; → `<cmd>Telescope buffers<cr>`
  004. `<leader>fr` [] — 🕒 Recent Files; → `<cmd>Telescope oldfiles<cr>`
  005. `<leader>fc` [] — 🔤 Find String; → `<cmd>Telescope grep_string<cr>`
  006. `<leader>fe` [] — 📁 File Browser; → `<cmd>Telescope file_browser<cr>`
  007. `<leader>fd` [] — 🩺 Diagnostics; → `<cmd>Telescope diagnostics<cr>`
  008. `<leader>fs` [] — 📊 Document Symbols; → `<cmd>Telescope lsp_document_symbols<cr>`
  009. `<leader>fS` [] — 🏢 Workspace Symbols; → `<cmd>Telescope lsp_workspace_symbols<cr>`
  010. `<leader>fR` [] — 🔗 References; → `<cmd>Telescope lsp_references<cr>`
  011. `<leader>fi` [] — ⚙️ Implementations; → `<cmd>Telescope lsp_implementations<cr>`
  012. `<leader>ft` [] — 📝 Type Definitions; → `<cmd>Telescope lsp_type_definitions<cr>`
  013. `<leader>fh` [] — ❓ Help Tags; → `<cmd>Telescope help_tags<cr>`
  014. `<leader>fk` [] — ⌨️ Keymaps; → `<cmd>Telescope keymaps<cr>`
  015. `<leader>fm` [] — 📖 Man Pages; → `<cmd>Telescope man_pages<cr>`
  016. `<leader>fo` [] — ⚙️ Vim Options; → `<cmd>Telescope vim_options<cr>`
  017. `<leader>fC` [] — 💻 Commands; → `<cmd>Telescope commands<cr>`
  018. `<leader>fH` [] — 📜 Command History; → `<cmd>Telescope command_history<cr>`
  019. `<leader>gb` [] — 🌿 Git Branches; → `<cmd>Telescope git_branches<cr>`
  020. `<leader>gc` [] — 📝 Git Commits; → `<cmd>Telescope git_commits<cr>`
  021. `<leader>gs` [] — 📊 Git Status; → `<cmd>Telescope git_status<cr>`
  022. `<leader>gf` [] — 📂 Git Files; → `<cmd>Telescope git_files<cr>`
  023. `<leader>/` [] — 🔍 Search in Buffer; → `<cmd>Telescope current_buffer_fuzzy_find<cr>`
  024. `<leader>f/` [] — 🔍 Search History; → `<cmd>Telescope search_history<cr>`
### lua/ui/alpha.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🌸 REVOLUTIONARY ALPHA DASHBOARD - Anime Aesthetic Paradise 
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/breadcrumbs.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🍞 BREADCRUMBS - nvim-navic integration
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/cmdline-enhanced.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🎯 ENHANCED COMMAND-LINE - Ultimate completion with dropdown menus
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/colorizer.lua
### lua/ui/comfy-tabline.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🗂️  COMFYLINE-INSPIRED BUFFERLINE - Custom Tabline for Neovim
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :BufferLineOrderByDirectory — 
- :BufferLineOrderByExtension — 
- :BufferLineOrderByRelativeDirectory — 
#### Keymaps
  001. `<leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h>` [] — Previous Buffer; → `<Cmd>bprevious<CR>`
  002. `<S-l>` [] — Next Buffer; → `<Cmd>bnext<CR>`
  003. `[b` [] — Previous Buffer; → `<Cmd>bprevious<CR>`
  004. `]b` [] — Next Buffer; → `<Cmd>bnext<CR>`
### lua/ui/devicons.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔣 DEVICONS ULTRA - Vivid, larger, and expressive icons
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/dressing.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  👔 DRESSING - Beautiful UI Select & Input
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/folds.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📁 UFO FOLDS - Better folding UI
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/highlights.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🎨 NEXUS HIGHLIGHTS - Ultra-Modern Curved UI Cohesive Theme
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/image.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🖼️ IMAGE.NVIM - Ultimate Image Viewing for Kitty Terminal
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `n` [n] — ; → `<leader>ti`
  002. `n` [n] — ; → `<leader>ic`
  003. `n` [n] — ; → `<leader>ir`
### lua/ui/indent-blankline.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📏 INDENT BLANKLINE - Beautiful Indentation Guides
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/lualine.lua
- ═══════════════════════════════════════════════════════════════════════════
-  ✨ TOKYONIGHT LUALINE - Arrow separators, breadcrumbs, progress & location
- ═══════════════════════════════════════════════════════════════════════════
### lua/ui/markdown-preview.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📝 MARKDOWN-PREVIEW.NVIM - Live Markdown Preview (no yarn/npm required)
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/minimap.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🗺️ MINIMAP - Code overview
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :MinimapToggle — Toggle minimap
- :MinimapOpen — 
- :MinimapClose — 
### lua/ui/noice.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🔮 NOICE - Revolutionary UI Experience
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/notify.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📢 NVIM-NOTIFY - Beautiful Notifications
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/rainbow-delimiters.lua
### lua/ui/themes-enhanced.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🎨 ENHANCED THEMES - Vibrant, Glowing & Aesthetic Collection
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/themes.lua
- ═══════════════════════════════════════════════════════════════════════════
-  🎆 ULTIMATE THEME COLLECTION - Epic Colorschemes & Theme Switcher
- ═══════════════════════════════════════════════════════════════════════════
### lua/ui/tokyo-enhanced.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🌙 TOKYO NIGHT ENHANCED - Vibrant Storm with Soothing Lualine Colors
- ═══════════════════════════════════════════════════════════════════════════════
### lua/ui/transparency.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🪟 TRANSPARENCY TOGGLE - Glassmorphic Neovim (runtime toggle)
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :NvimTransparencyToggle — Toggle Neovim UI transparency
### lua/ui/workspace-tracker.lua
- ═══════════════════════════════════════════════════════════════════════════
-  🧭 WORKSPACE TRACKER - small helper for bufferline/tabline components
- ═══════════════════════════════════════════════════════════════════════════
### lua/ui/zen-mode.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧘 ZEN MODE - Distraction-free editing
- ═══════════════════════════════════════════════════════════════════════════════
### lua/utils/copilot.lua
### lua/utils/cp.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🏆 CP UTILITIES - Competitive Programming Setup
- ═══════════════════════════════════════════════════════════════════════════════
- Module aliases
### lua/utils/init.lua
- Utils plugins loader
- Only loads plugin specs, skips utility modules
### lua/utils/overseer.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🏃 OVERSEER - Task runner (builds, tests, commands)
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>rr` [] — Run task; → `<cmd>OverseerRun<cr>`
  002. `<leader>rt` [] — Toggle tasks; → `<cmd>OverseerToggle<cr>`
  003. `<leader>ro` [] — Open tasks; → `<cmd>OverseerOpen<cr>`
### lua/utils/project.lua
### lua/utils/python-venv.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🐍 PYTHON VENV - Auto-detect and switch Python virtual environments
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :PythonDetect — 
- :PythonSetup — Setup Python provider for current project
### lua/utils/session.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧭 PRO-LEVEL SESSIONS (tmux/zellij-like)
-  Uses rmagatti/auto-session + session-lens (Telescope UI)
-  Features:
-    - Auto-save/restore per-project and per-git-branch sessions
-    - Named sessions, search/list/preview with Telescope
-    - Robust layout restore (tabs, splits, buffers, cwd)
-    - Pre/post hooks to close/reopen UI panes (neo-tree, trouble, diffview)
- ═══════════════════════════════════════════════════════════════════════════════
#### Commands
- :SessionList — Search sessions
- :SessionSnapshotSave — 
- :SessionSnapshotList — 
- :SessionSnapshotDelete — 
### lua/utils/toggleterm.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🧪 TOGGLETEAM (toggleterm) - Integrated terminal
- ═══════════════════════════════════════════════════════════════════════════════
### lua/utils/which-key.lua
### lua/utils/workspaces.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  🗂️ WORKSPACES - Named, multi-session workspace manager (tmux/zellij style)
- ═══════════════════════════════════════════════════════════════════════════════
- 
- Concepts
- - Workspace: a named container holding one or more sessions (tab/layout states).
- - Session: a saved state (mksession) inside a workspace (default name: "main").
- - Storage: ~/.local/share/nvim/workspaces/<name>/{workspace.json,sessions/*.vim}
- 
- Commands (see keymaps in functional-keymaps.lua):
-   :WorkspaceNew [name]
-   :WorkspaceSave [name] [session]
-   :WorkspaceOpen [name] [session]
-   :WorkspaceList
-   :WorkspaceDelete [name]
-   :WorkspaceRename [old] [new]
-   :WorkspaceSessions [name]    -> list sessions for a workspace
- 
- Notes
- - Integrates with auto-session pre-save hooks by closing UI panes before save.
- - Quiet by default (uses echo for critical output).
#### Commands
- :WorkspaceNew — 
- :WorkspaceSave — 
- :WorkspaceOpen — 
- :WorkspaceList — 
- :WorkspaceDelete — 
- :WorkspaceRename — 
- :WorkspaceSessions — 
### lua/utils/yanky.lua
- ═══════════════════════════════════════════════════════════════════════════════
-  📋 YANKY - Clipboard history and smarter yanks
- ═══════════════════════════════════════════════════════════════════════════════
#### Keymaps
  001. `<leader>cy` [] — Clipboard history; → `<cmd>Telescope yank_history<cr>`
## Detailed Inventory
### completion

### core
0001. `<leader>ff` [n] — Find Files; → `<cmd>Telescope find_files<cr>`
0002. `<leader>fg` [n] — Live Grep; → `<cmd>Telescope live_grep<cr>`
0003. `<leader>fb` [n] — Find Buffers; → `<cmd>Telescope buffers<cr>`
0004. `<leader>fh` [n] — Help Tags; → `<cmd>Telescope help_tags<cr>`
0005. `<leader>fr` [n] — Recent Files; → `<cmd>Telescope oldfiles<cr>`
0006. `<leader>fc` [n] — Find Word; → `<cmd>Telescope grep_string<cr>`
0007. `<leader>fm` [n] — Find Marks; → `<cmd>Telescope marks<cr>`
0008. `<leader>fM` [n] — Man Pages; → `<cmd>Telescope man_pages<cr>`
0009. `<leader>fk` [n] — Find Keymaps; → `<cmd>Telescope keymaps<cr>`
0010. `<leader>fC` [n] — Commands; → `<cmd>Telescope commands<cr>`
0011. `n` [n] — ; → `<leader>a`
0012. `n` [n] — ; → `<leader>h`
0013. `n` [n] — ; → `<leader>1`
0014. `n` [n] — ; → `<leader>2`
0015. `n` [n] — ; → `<leader>3`
0016. `n` [n] — ; → `<leader>4`
0017. `<leader>a` [n] — Harpoon File; → `<cmd>echo 'Harpoon not available'<cr>`
0018. `<leader>h` [n] — Harpoon Menu; → `<cmd>echo 'Harpoon not available'<cr>`
0019. `<leader>e` [n] — 🌳 Toggle Neo-tree; → `<cmd>Neotree toggle<cr>`
0020. `<leader>ge` [n] — 🔀 Git Status Tree; → `<cmd>Neotree float git_status<cr>`
0021. `<leader>wn` [n] — ; → `<cmd>WorkspaceNew<cr>`
0022. `n` [n] — ; → `<leader>ws`
0023. `<leader>wl` [n] — Workspace: List/Open; → `<cmd>WorkspaceList<cr>`
0024. `<leader>wo` [n] — Workspace: Open by name; → `<cmd>WorkspaceOpen<cr>`
0025. `<leader>wd` [n] — Workspace: Delete; → `<cmd>WorkspaceDelete<cr>`
0026. `<leader>wr` [n] — Workspace: Rename; → `<cmd>WorkspaceRename<cr>`
0027. `<leader>wS` [n] — Workspace: Sessions in current; → `<cmd>WorkspaceSessions<cr>`
0028. `<leader>o` [n] — 📁 Open Oil; → `<cmd>Oil<cr>`
0029. `<leader>ss` [n] — Save Session; → `<cmd>SaveSession<cr>`
0030. `<leader>sl` [n] — List/Search Sessions; → `<cmd>SessionList<cr>`
0031. `<leader>sd` [n] — Delete Session; → `<cmd>DeleteSession<cr>`
0032. `<leader>sS` [n] — Save Snapshot; → `<cmd>SessionSnapshotSave<cr>`
0033. `<leader>sR` [n] — Restore Snapshot; → `<cmd>SessionSnapshotList<cr>`
0034. `<leader>sD` [n] — Delete Snapshot; → `<cmd>SessionSnapshotDelete<cr>`
0035. `<leader>qq` [n] — Quit All; → `<cmd>qa<cr>`
0036. `<leader>ca` [n] — Code Action; → `Code Action`
0037. `<leader>cd` [n] — Diagnostics; → `<cmd>Telescope diagnostics<cr>`
0038. `<leader>cr` [n] — Rename; → `Rename`
0039. `<leader>cf` [n] — Format; → `Format`
0040. `<leader>cs` [n] — Document Symbols; → `<cmd>Telescope lsp_document_symbols<cr>`
0041. `<leader>cS` [n] — Workspace Symbols; → `<cmd>Telescope lsp_workspace_symbols<cr>`
0042. `gd` [n] — Go to Definition; → `Go to Definition`
0043. `gD` [n] — Go to Declaration; → `Go to Declaration`
0044. `gi` [n] — Go to Implementation; → `Go to Implementation`
0045. `gt` [n] — Go to Type Definition; → `Go to Type Definition`
0046. `gr` [n] — Go to References; → `Go to References`
0047. `K` [n] — Hover Documentation; → `Hover Documentation`
0048. `<leader>gg` [n] — Neogit; → `<cmd>Neogit<cr>`
0049. `<leader>gs` [n] — Git Status; → `<cmd>Neogit kind=split<cr>`
0050. `<leader>gc` [n] — Git Commit; → `<cmd>Neogit commit<cr>`
0051. `<leader>gp` [n] — Git Push; → `<cmd>Neogit push<cr>`
0052. `<leader>gP` [n] — Git Pull; → `<cmd>Neogit pull<cr>`
0053. `<leader>gb` [n] — Git Branches; → `<cmd>Telescope git_branches<cr>`
0054. `<leader>gf` [n] — Git Files; → `<cmd>Telescope git_files<cr>`
0055. `<leader>gh` [n] — Git History; → `<cmd>DiffviewFileHistory<cr>`
0056. `<leader>gd` [n] — Git Diff; → `<cmd>DiffviewOpen<cr>`
0057. `<leader>gx` [n] — Close Git Diff; → `<cmd>DiffviewClose<cr>`
0058. `]h` [n] — Next Hunk; → `<cmd>Gitsigns next_hunk<cr>`
0059. `[h` [n] — Prev Hunk; → `<cmd>Gitsigns prev_hunk<cr>`
0060. `<leader>ghs` [n] — Stage Hunk; → `<cmd>Gitsigns stage_hunk<cr>`
0061. `<leader>ghu` [n] — Undo Stage Hunk; → `<cmd>Gitsigns undo_stage_hunk<cr>`
0062. `<leader>ghr` [n] — Reset Hunk; → `<cmd>Gitsigns reset_hunk<cr>`
0063. `<leader>ghp` [n] — Preview Hunk; → `<cmd>Gitsigns preview_hunk<cr>`
0064. `<leader>ghb` [n] — Blame Line; → `<cmd>Gitsigns blame_line<cr>`
0065. `<leader>rr` [n] — Run Task; → `<cmd>OverseerRun<cr>`
0066. `<leader>rt` [n] — Toggle Tasks; → `<cmd>OverseerToggle<cr>`
0067. `<leader>ro` [n] — Open Tasks; → `<cmd>OverseerOpen<cr>`
0068. `<leader>rc` [n] — Close Tasks; → `<cmd>OverseerClose<cr>`
0069. `<leader>rb` [n] — Build Project; → `<cmd>OverseerBuild<cr>`
0070. `<leader>db` [n] — Toggle Breakpoint; → `Toggle Breakpoint`
0071. `<leader>dc` [n] — Continue; → `Continue`
0072. `<leader>di` [n] — Step Into; → `Step Into`
0073. `<leader>do` [n] — Step Over; → `Step Over`
0074. `<leader>dO` [n] — Step Out; → `Step Out`
0075. `<leader>dr` [n] — Toggle REPL; → `Toggle REPL`
0076. `<leader>ds` [n] — Session; → `Session`
0077. `<leader>dt` [n] — Terminate; → `Terminate`
0078. `<leader>du` [n] — Toggle Debug UI; → `Toggle Debug UI`
0079. `<leader>de` [n] — Eval; → `Eval`
0080. `<leader>xx` [n] — ; → `<cmd>Trouble diagnostics toggle<cr>`
0081. `<leader>xX` [n] — ; → `<cmd>Trouble diagnostics toggle filter.buf=0<cr>`
0082. `<leader>xl` [n] — ; → `<cmd>Trouble loclist toggle<cr>`
0083. `<leader>xq` [n] — ; → `<cmd>Trouble qflist toggle<cr>`
0084. `]d` [n] — Next Diagnostic; → `Next Diagnostic`
0085. `[d` [n] — Prev Diagnostic; → `Prev Diagnostic`
0086. `<leader>xe` [n] — Show Diagnostics; → `Show Diagnostics`
0087. `<leader>uz` [n] — Zen Mode; → `<cmd>ZenMode<cr>`
0088. `<leader>um` [n] — Toggle Minimap; → `<cmd>MinimapToggle<cr>`
0089. `<leader>uw` [n] — Toggle Word Wrap; → `<cmd>set wrap!<cr>`
0090. `<leader>un` [n] — Toggle Line Numbers; → `<cmd>set number!<cr>`
0091. `<leader>ur` [n] — Toggle Relative Numbers; → `<cmd>set relativenumber!<cr>`
0092. `<leader>us` [n] — Toggle Spell Check; → `<cmd>set spell!<cr>`
0093. `<leader>uc` [n] — Toggle Colorizer; → `<cmd>ColorizerToggle<cr>`
0094. `<leader>bd` [n] — Delete Buffer; → `<cmd>bdelete<cr>`
0095. `<leader>bD` [n] — Delete All But Current; → `<cmd>%bdelete|edit#|normal `\`
0096. `<leader>bl` [n] — Delete Buffers to Left; → `<cmd>BufferLineCloseLeft<cr>`
0097. `<leader>br` [n] — Delete Buffers to Right; → `<cmd>BufferLineCloseRight<cr>`
0098. `<leader>bp` [n] — Pick Buffer; → `<cmd>BufferLinePick<cr>`
0099. `<leader>bo` [n] — Delete Other Buffers; → `<cmd>BufferLineCloseOthers<cr>`
0100. `<S-h>` [n] — Previous Buffer; → `<cmd>BufferLineCyclePrev<cr>`
0101. `<S-l>` [n] — Next Buffer; → `<cmd>BufferLineCycleNext<cr>`
0102. `[b` [n] — Previous Buffer; → `<cmd>BufferLineCyclePrev<cr>`
0103. `]b` [n] — Next Buffer; → `<cmd>BufferLineCycleNext<cr>`
0104. `<leader>sr` [n] — Replace in Project; → `<cmd>Spectre<cr>`
0105. `<leader>sf` [n] — Replace in File; → `<cmd>Spectre open_file_search<cr>`
0106. `<leader>sr` [v] — Replace Selection; → `<cmd>Spectre open_visual<cr>`
0107. `<leader>L` [n] — Lazy; → `<cmd>Lazy<cr>`
0108. `<leader>M` [n] — Mason; → `<cmd>Mason<cr>`
0109. `]t` [n] — Next Todo; → `<cmd>TodoNext<cr>`
0110. `[t` [n] — Previous Todo; → `<cmd>TodoPrev<cr>`
0111. `<leader>st` [n] — Todo; → `<cmd>TodoTelescope<cr>`
0112. `x` [n] — Flash; → `o`
0113. `x` [n] — Flash Treesitter; → `o`
0114. `r` [o] — Remote Flash; → `Remote Flash`
0115. `o` [x] — Treesitter Search; → `R`
0116. `<c-s>` [c] — Toggle Flash Search; → `Toggle Flash Search`
0117. `<leader>mc` [n] — Multi-cursor at Match; → `Multi-cursor at Match`
0118. `<leader>mc` [v] — Multi-cursor at Every Match; → `Multi-cursor at Every Match`
0119. `<leader>mC` [n] — Multi-cursor at End; → `Multi-cursor at End`
0120. `<leader>re` [x] — ; → `Extract Function`
0121. `<leader>rf` [x] — ; → `Extract Function To File`
0122. `<leader>rv` [x] — ; → `Extract Variable`
0123. `<leader>rI` [n] — ; → `Inline Function`
0124. `x` [n] — ; → `<leader>ri`
0125. `<leader>rb` [n] — ; → `Extract Block`
0126. `<leader>rbf` [n] — ; → `Extract Block To File`
0127. `<leader>R` [n] — Reload Config; → `<cmd>source $MYVIMRC<cr>`
0128. `<leader><leader>` [n] — Switch to Last Buffer; → `<C-^>`
0129. `jj` [i] — Exit insert mode; → `<ESC>`
0130. `jk` [i] — Exit insert mode; → `<ESC>`
0131. `<C-e>` [t] — Exit terminal mode; → `<C-\\><C-n>`
0132. `<Esc><Esc>` [t] — Exit terminal mode; → `<C-\\><C-n>`
0133. `<leader>cs` [n] — Clear search highlights; → `<cmd>nohlsearch<CR>`
0134. `<Esc>` [n] — ; → `<cmd>nohlsearch<CR>`
0135. `x` [n] — Increment number; → `=`
0136. `x` [n] — Decrement number; → `-`
0137. `x` [n] — ; → `x`
0138. `x` [n] — ; → `<leader>d`
0139. `p` [x] — ; → `_dP', { desc = `
0140. `<` [x] — Indent left and reselect; → `<gv`
0141. `>` [x] — Indent right and reselect; → `>gv`
0142. `<Tab>` [x] — ; → `>gv`
0143. `<S-Tab>` [x] — ; → `<gv`
0144. `<A-j>` [n] — Move line down; → `<cmd>m .+1<CR>==`
0145. `<A-k>` [n] — Move line up; → `<cmd>m .-2<CR>==`
0146. `<A-j>` [i] — Move line down; → `<Esc><cmd>m .+1<CR>==gi`
0147. `<A-k>` [i] — Move line up; → `<Esc><cmd>m .-2<CR>==gi`
0148. `<A-j>` [x] — Move selection down; → `:m '>+1<CR>gv=gv`
0149. `<A-k>` [x] — Move selection up; → `:m '<-2<CR>gv=gv`
0150. `<leader>Y` [n] — Copy line to system clipboard; → `+Y', { desc = `
0151. `x` [n] — Copy to system clipboard; → `<leader>y`
0152. `x` [n] — Paste from system clipboard; → `<leader>p`
0153. `x` [n] — ; → `j`
0154. `x` [n] — ; → `k`
0155. `x` [n] — Go to first non-blank; → `H`
0156. `x` [n] — Go to end of line; → `L`
0157. `n` [n] — ; → `nzzzv`
0158. `N` [n] — ; → `Nzzzv`
0159. `<S-h>` [n] — Previous buffer; → `<cmd>bprevious<cr>`
0160. `<S-l>` [n] — Next buffer; → `<cmd>bnext<cr>`
0161. `<C-i>` [n] — ; → `<cmd>bnext<cr>`
0162. `<C-S-i>` [n] — ; → `<cmd>bprevious<cr>`
0163. `<C-h>` [n] — Go to left window; → `<C-w>h`
0164. `<C-j>` [n] — Go to lower window; → `<C-w>j`
0165. `<C-k>` [n] — Go to upper window; → `<C-w>k`
0166. `<C-l>` [n] — Go to right window; → `<C-w>l`
0167. `<leader>sv` [n] — Split window vertically; → `<C-w>v`
0168. `<leader>sh` [n] — Split window horizontally; → `<C-w>s`
0169. `<leader>se` [n] — Make windows equal size; → `<C-w>=`
0170. `<leader>sx` [n] — Close current window; → `<C-w>c`
0171. `<C-Up>` [n] — Increase window height; → `<cmd>resize +2<cr>`
0172. `<C-Down>` [n] — Decrease window height; → `<cmd>resize -2<cr>`
0173. `<C-Left>` [n] — Decrease window width; → `<cmd>vertical resize -2<cr>`
0174. `<C-Right>` [n] — Increase window width; → `<cmd>vertical resize +2<cr>`
0175. `<leader>to` [n] — Open new tab; → `<cmd>tabnew<cr>`
0176. `<leader>tx` [n] — Close current tab; → `<cmd>tabclose<cr>`
0177. `<leader>tn` [n] — Go to next tab; → `<cmd>tabn<cr>`
0178. `<leader>tp` [n] — Go to previous tab; → `<cmd>tabp<cr>`
0179. `<leader>tf` [n] — Open current buffer in new tab; → `<cmd>tabnew %<cr>`
0180. `gt` [n] — Next tab; → `<cmd>tabnext<cr>`
0181. `gT` [n] — Previous tab; → `<cmd>tabprevious<cr>`
0182. `<C-PageDown>` [n] — Next tab; → `<cmd>tabnext<cr>`
0183. `<C-PageUp>` [n] — Previous tab; → `<cmd>tabprevious<cr>`
0184. `<leader>` [n] — Go to tab ; → `gt`
0185. `<C-\\>` [n] — Jump forward in jumplist; → `<C-i>`
0186. `<leader>ji` [n] — Jump forward in jumplist; → `<C-i>`
0187. `<leader>jo` [n] — Jump backward in jumplist; → `<C-o>`
0188. `<leader>R` [n] — Reload config; → `<cmd>source $MYVIMRC<cr>`
0189. `<C-s>` [n] — Save file; → `<cmd>w<cr>`
0190. `<C-s>` [i] — ; → `<Esc><cmd>w<cr>a`
0191. `<C-s>` [v] — ; → `<Esc><cmd>w<cr>`
0192. `<leader>L` [n] — Open Lazy; → `<cmd>Lazy<cr>`
0193. `<leader>tw` [n] — Toggle word wrap; → `<cmd>set wrap!<cr>`
0194. `<leader>tn` [n] — Toggle line numbers; → `<cmd>set number!<cr>`
0195. `<leader>tr` [n] — Toggle relative numbers; → `<cmd>set relativenumber!<cr>`
0196. `<leader>ts` [n] — Toggle spell check; → `<cmd>set spell!<cr>`
0197. `<leader>ut` [n] — 🎆 Switch themes; → `<cmd>Themery<cr>`
0198. `n` [n] — ; → `<leader>u1`
0199. `n` [n] — ; → `<leader>u2`
0200. `n` [n] — ; → `<leader>u3`
0201. `n` [n] — ; → `<leader>u4`
0202. `n` [n] — ; → `<leader>u5`
0203. `n` [n] — ; → `<leader>u6`
0204. `n` [n] — ; → `<leader>u7`
0205. `n` [n] — ; → `<leader>u8`
0206. `n` [n] — ; → `<leader>uT`
0207. `n` [n] — ; → `[d`
0208. `n` [n] — ; → `]d`
0209. `n` [n] — ; → `<leader>q`
0210. `n` [n] — ; → `<leader>cp`
0211. `n` [n] — ; → `<leader>cc`
0212. `n` [n] — ; → `<leader>sp`
0213. `Q` [n] — ; → `<nop>`
0214. `q` [n] — ; → `<nop>`
0215. `<C-p>` [c] — ; → `<nop>`
0216. `<C-n>` [c] — ; → `<nop>`
0217. `<leader>w` [n] — Window commands; → `<C-w>`
0218. `<leader><leader>` [n] — Switch to last buffer; → `<C-^>`
0219. `<leader>L` [n] — 🚀 Open Lazy.nvim; → `<cmd>Lazy<cr>`
0220. `<leader>Lu` [n] — 🔄 Update plugins; → `<cmd>Lazy update<cr>`
0221. `<leader>Ls` [n] — 🔄 Sync plugins; → `<cmd>Lazy sync<cr>`
0222. `<leader>Lc` [n] — 🧹 Clean plugins; → `<cmd>Lazy clean<cr>`
0223. `<leader>Lp` [n] — 📊 Profile plugins; → `<cmd>Lazy profile<cr>`
0224. `q` [n] — Close window; → `<cmd>close<cr>`
0225. `n` [n] — ; → `<leader>cc`
0226. `n` [n] — ; → `<leader>cr`
0227. `q` [n] — Quit buffer; → `<cmd>close<cr>`

### debugging

### editor
0001. `n` [n] — ; → `<C-a>`
0002. `n` [n] — ; → `<C-x>`
0003. `v` [n] — ; → `<C-a>`
0004. `v` [n] — ; → `<C-x>`
0005. `v` [n] — ; → `g<C-a>`
0006. `v` [n] — ; → `g<C-x>`
0007. `v` [n] — ; → `<leader>cf`
0008. `]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
    { "<leader>st` [] — Todo (Telescope); → `<cmd>TodoTelescope<cr>`
0009. `<leader>sr` [] — Replace in Project; → `<cmd>Spectre<cr>`
0010. `<leader>sf` [] — Replace in File; → `<cmd>Spectre open_file_search<cr>`
0011. `<leader>sr` [] — ; → `<esc><cmd>Spectre open_visual<cr>`
0012. `gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n` [] — ; → `o`
0013. `gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n` [] — ; → `o`

### git
0001. `n` [n] — ; → `]h`
0002. `n` [n] — ; → `[h`
0003. `<leader>hs` [n] — Stage hunk; → `Stage hunk`
0004. `<leader>hr` [n] — Reset hunk; → `Reset hunk`
0005. `v` [n] — ; → `<leader>hs`
0006. `v` [n] — ; → `<leader>hr`
0007. `<leader>hS` [n] — Stage buffer; → `Stage buffer`
0008. `<leader>hu` [n] — Undo stage hunk; → `Undo stage hunk`
0009. `<leader>hR` [n] — Reset buffer; → `Reset buffer`
0010. `<leader>hp` [n] — Preview hunk; → `Preview hunk`
0011. `n` [n] — ; → `<leader>hb`
0012. `<leader>tb` [n] — Toggle line blame; → `Toggle line blame`
0013. `<leader>hd` [n] — Diff this; → `Diff this`
0014. `n` [n] — ; → `<leader>hD`
0015. `<leader>td` [n] — Toggle deleted; → `Toggle deleted`
0016. `x` [o] — Select hunk; → `ih`

### lsp
0001. `<leader>lt` [n] — Toggle LSP servers; → `Toggle LSP servers`
0002. `<leader>lp` [n] — Toggle Python LSP only; → `Toggle Python LSP only`
0003. `gd` [n] — ; → `Go to Definition`
0004. `gr` [n] — ; → `Go to References`
0005. `gI` [n] — ; → `Go to Implementation`
0006. `gy` [n] — ; → `Go to Type Definition`
0007. `gD` [n] — ; → `Go to Declaration`
0008. `K` [n] — ; → `Hover Documentation`
0009. `gK` [n] — ; → `Signature Help`
0010. `<C-k>` [i] — ; → `Signature Help`
0011. `v` [n] — ; → `<leader>ca`
0012. `<leader>cc` [n] — ; → `Run Codelens`
0013. `<leader>cC` [n] — ; → `Refresh Codelens`
0014. `<leader>cr` [n] — ; → `Rename`
0015. `<leader>cd` [n] — ; → `Line Diagnostics`
0016. `<leader>cl` [n] — ; → `<cmd>LspInfo<cr>`
0017. `<leader>cR` [n] — ; → `<cmd>LspRestart<cr>`
0018. `]d` [n] — ; → `Next Diagnostic`
0019. `[d` [n] — ; → `Prev Diagnostic`
0020. `<leader>wa` [n] — ; → `Add Workspace Folder`
0021. `<leader>wr` [n] — ; → `Remove Workspace Folder`
0022. `n` [n] — ; → `<leader>wl`
0023. `n` [n] — ; → `<leader>cf`
0024. `v` [n] — ; → `<leader>cf`
0025. `n` [n] — ; → `<leader>ch`
0026. `<leader>cm` [] — Mason; → `<cmd>Mason<cr>`
0027. `<leader>xx` [] — Diagnostics (Trouble); → `<cmd>Trouble diagnostics toggle<cr>`
0028. `<leader>xX` [] — Buffer Diagnostics (Trouble); → `<cmd>Trouble diagnostics toggle filter.buf=0<cr>`
0029. `<leader>xl` [] — Location List (Trouble); → `<cmd>Trouble loclist toggle<cr>`
0030. `<leader>xq` [] — Quickfix List (Trouble); → `<cmd>Trouble qflist toggle<cr>`

### navigation
0001. `s", mode = { "n` [] — ; → `x`
0002. `S", mode = { "n` [] — ; → `x`
0003. `r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o` [] — ; → `x`
0004. `<leader>ff` [] — 🔍 Find Files; → `<cmd>Telescope find_files<cr>`
0005. `<leader>fg` [] — 🔎 Live Grep; → `<cmd>Telescope live_grep<cr>`
0006. `<leader>fb` [] — 📂 Buffers; → `<cmd>Telescope buffers<cr>`
0007. `<leader>fr` [] — 🕒 Recent Files; → `<cmd>Telescope oldfiles<cr>`
0008. `<leader>fc` [] — 🔤 Find String; → `<cmd>Telescope grep_string<cr>`
0009. `<leader>fe` [] — 📁 File Browser; → `<cmd>Telescope file_browser<cr>`
0010. `<leader>fd` [] — 🩺 Diagnostics; → `<cmd>Telescope diagnostics<cr>`
0011. `<leader>fs` [] — 📊 Document Symbols; → `<cmd>Telescope lsp_document_symbols<cr>`
0012. `<leader>fS` [] — 🏢 Workspace Symbols; → `<cmd>Telescope lsp_workspace_symbols<cr>`
0013. `<leader>fR` [] — 🔗 References; → `<cmd>Telescope lsp_references<cr>`
0014. `<leader>fi` [] — ⚙️ Implementations; → `<cmd>Telescope lsp_implementations<cr>`
0015. `<leader>ft` [] — 📝 Type Definitions; → `<cmd>Telescope lsp_type_definitions<cr>`
0016. `<leader>fh` [] — ❓ Help Tags; → `<cmd>Telescope help_tags<cr>`
0017. `<leader>fk` [] — ⌨️ Keymaps; → `<cmd>Telescope keymaps<cr>`
0018. `<leader>fm` [] — 📖 Man Pages; → `<cmd>Telescope man_pages<cr>`
0019. `<leader>fo` [] — ⚙️ Vim Options; → `<cmd>Telescope vim_options<cr>`
0020. `<leader>fC` [] — 💻 Commands; → `<cmd>Telescope commands<cr>`
0021. `<leader>fH` [] — 📜 Command History; → `<cmd>Telescope command_history<cr>`
0022. `<leader>gb` [] — 🌿 Git Branches; → `<cmd>Telescope git_branches<cr>`
0023. `<leader>gc` [] — 📝 Git Commits; → `<cmd>Telescope git_commits<cr>`
0024. `<leader>gs` [] — 📊 Git Status; → `<cmd>Telescope git_status<cr>`
0025. `<leader>gf` [] — 📂 Git Files; → `<cmd>Telescope git_files<cr>`
0026. `<leader>/` [] — 🔍 Search in Buffer; → `<cmd>Telescope current_buffer_fuzzy_find<cr>`
0027. `<leader>f/` [] — 🔍 Search History; → `<cmd>Telescope search_history<cr>`
0028. `-` [] — Open parent directory; → `<CMD>Oil<CR>`
0029. `<leader>so` [] — Symbols Outline (Aerial); → `<cmd>AerialToggle!<cr>`
0030. `<leader>ge` [] — 🔀 Git Status; → `<cmd>Neotree float git_status<cr>`

### ui
0001. `n` [n] — ; → `<leader>ti`
0002. `n` [n] — ; → `<leader>ic`
0003. `n` [n] — ; → `<leader>ir`
0004. `<leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h>` [] — Previous Buffer; → `<Cmd>bprevious<CR>`
0005. `<S-l>` [] — Next Buffer; → `<Cmd>bnext<CR>`
0006. `[b` [] — Previous Buffer; → `<Cmd>bprevious<CR>`
0007. `]b` [] — Next Buffer; → `<Cmd>bnext<CR>`

### utils
0001. `<leader>rr` [] — Run task; → `<cmd>OverseerRun<cr>`
0002. `<leader>rt` [] — Toggle tasks; → `<cmd>OverseerToggle<cr>`
0003. `<leader>ro` [] — Open tasks; → `<cmd>OverseerOpen<cr>`
0004. `<leader>cy` [] — Clipboard history; → `<cmd>Telescope yank_history<cr>`
