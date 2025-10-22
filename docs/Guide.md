# Lexitron.nvim — Guide (Comprehensive)

Accurate, code-derived keymaps and user commands. For architecture and module explanations, see Reference.md.

## Core
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

## Editor
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

## Git
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

## Lsp
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

## Navigation
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

## Ui
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

## Utils
| Keys | Mode | Description | Action |
|---|---|---|---|
| <leader>rr |  | Run task | <cmd>OverseerRun<cr> |
| <leader>rt |  | Toggle tasks | <cmd>OverseerToggle<cr> |
| <leader>ro |  | Open tasks | <cmd>OverseerOpen<cr> |
| <leader>cy |  | Clipboard history | <cmd>Telescope yank_history<cr> |

## Commands
| Command | Description |
|---|---|
| Docs | Open Neovim config guide (docs/Guide.md) |
| Format |  |
| BufferLineOrderByDirectory |  |
| BufferLineOrderByExtension |  |
| BufferLineOrderByRelativeDirectory |  |
| NvimTransparencyToggle | Toggle Neovim UI transparency |
| MinimapToggle | Toggle minimap |
| MinimapOpen |  |
| MinimapClose |  |
| WorkspaceNew |  |
| WorkspaceSave |  |
| WorkspaceOpen |  |
| WorkspaceList |  |
| WorkspaceDelete |  |
| WorkspaceRename |  |
| WorkspaceSessions |  |
| PythonDetect |  |
| PythonSetup | Setup Python provider for current project |
| SessionList | Search sessions |
| SessionSnapshotSave |  |
| SessionSnapshotList |  |
| SessionSnapshotDelete |  |

## Prefix Index
### -
- [1] `-` — Open parent directory
### <
- [1] `<` — Indent left and reselect
### <A-j>
- [1] `<A-j>` — Move line down
- [2] `<A-j>` — Move line down
- [3] `<A-j>` — Move selection down
### <A-k>
- [1] `<A-k>` — Move line up
- [2] `<A-k>` — Move line up
- [3] `<A-k>` — Move selection up
### <C-Down>
- [1] `<C-Down>` — Decrease window height
### <C-Left>
- [1] `<C-Left>` — Decrease window width
### <C-PageDown>
- [1] `<C-PageDown>` — Next tab
### <C-PageUp>
- [1] `<C-PageUp>` — Previous tab
### <C-Right>
- [1] `<C-Right>` — Increase window width
### <C-S-i>
- [1] `<C-S-i>` — 
### <C-Up>
- [1] `<C-Up>` — Increase window height
### <C-\\>
- [1] `<C-\\>` — Jump forward in jumplist
### <C-e>
- [1] `<C-e>` — Exit terminal mode
### <C-h>
- [1] `<C-h>` — Go to left window
### <C-i>
- [1] `<C-i>` — 
### <C-j>
- [1] `<C-j>` — Go to lower window
### <C-k>
- [1] `<C-k>` — Go to upper window
- [2] `<C-k>` — 
### <C-l>
- [1] `<C-l>` — Go to right window
### <C-n>
- [1] `<C-n>` — 
### <C-p>
- [1] `<C-p>` — 
### <C-s>
- [1] `<C-s>` — Save file
- [2] `<C-s>` — 
- [3] `<C-s>` — 
### <Esc>
- [1] `<Esc>` — 
### <Esc><Esc>
- [1] `<Esc><Esc>` — Exit terminal mode
### <S-Tab>
- [1] `<S-Tab>` — 
### <S-h>
- [1] `<S-h>` — Previous Buffer
- [2] `<S-h>` — Previous buffer
### <S-l>
- [1] `<S-l>` — Next Buffer
- [2] `<S-l>` — Next buffer
- [3] `<S-l>` — Next Buffer
### <Tab>
- [1] `<Tab>` — 
### <c-s>
- [1] `<c-s>` — Toggle Flash Search
### <leader>
- [1] `<leader>` — Go to tab 
### <leader>/
- [1] `<leader>/` — 🔍 Search in Buffer
### <leader><leader>
- [1] `<leader><leader>` — Switch to Last Buffer
- [2] `<leader><leader>` — Switch to last buffer
### <leader>L
- [1] `<leader>L` — Lazy
- [2] `<leader>L` — Open Lazy
- [3] `<leader>L` — 🚀 Open Lazy.nvim
### <leader>Lc
- [1] `<leader>Lc` — 🧹 Clean plugins
### <leader>Lp
- [1] `<leader>Lp` — 📊 Profile plugins
### <leader>Ls
- [1] `<leader>Ls` — 🔄 Sync plugins
### <leader>Lu
- [1] `<leader>Lu` — 🔄 Update plugins
### <leader>M
- [1] `<leader>M` — Mason
### <leader>R
- [1] `<leader>R` — Reload Config
- [2] `<leader>R` — Reload config
### <leader>Y
- [1] `<leader>Y` — Copy line to system clipboard
### <leader>a
- [1] `<leader>a` — Harpoon File
### <leader>bD
- [1] `<leader>bD` — Delete All But Current
### <leader>bd
- [1] `<leader>bd` — Delete Buffer
### <leader>bd",
- [1] `<leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h>` — Previous Buffer
### <leader>bl
- [1] `<leader>bl` — Delete Buffers to Left
### <leader>bo
- [1] `<leader>bo` — Delete Other Buffers
### <leader>bp
- [1] `<leader>bp` — Pick Buffer
### <leader>br
- [1] `<leader>br` — Delete Buffers to Right
### <leader>cC
- [1] `<leader>cC` — 
### <leader>cR
- [1] `<leader>cR` — 
### <leader>cS
- [1] `<leader>cS` — Workspace Symbols
### <leader>ca
- [1] `<leader>ca` — Code Action
### <leader>cc
- [1] `<leader>cc` — 
### <leader>cd
- [1] `<leader>cd` — Diagnostics
- [2] `<leader>cd` — 
### <leader>cf
- [1] `<leader>cf` — Format
### <leader>cl
- [1] `<leader>cl` — 
### <leader>cm
- [1] `<leader>cm` — Mason
### <leader>cr
- [1] `<leader>cr` — Rename
- [2] `<leader>cr` — 
### <leader>cs
- [1] `<leader>cs` — Document Symbols
- [2] `<leader>cs` — Clear search highlights
### <leader>cy
- [1] `<leader>cy` — Clipboard history
### <leader>dO
- [1] `<leader>dO` — Step Out
### <leader>db
- [1] `<leader>db` — Toggle Breakpoint
### <leader>dc
- [1] `<leader>dc` — Continue
### <leader>de
- [1] `<leader>de` — Eval
### <leader>di
- [1] `<leader>di` — Step Into
### <leader>do
- [1] `<leader>do` — Step Over
### <leader>dr
- [1] `<leader>dr` — Toggle REPL
### <leader>ds
- [1] `<leader>ds` — Session
### <leader>dt
- [1] `<leader>dt` — Terminate
### <leader>du
- [1] `<leader>du` — Toggle Debug UI
### <leader>e
- [1] `<leader>e` — 🌳 Toggle Neo-tree
### <leader>f/
- [1] `<leader>f/` — 🔍 Search History
### <leader>fC
- [1] `<leader>fC` — Commands
- [2] `<leader>fC` — 💻 Commands
### <leader>fH
- [1] `<leader>fH` — 📜 Command History
### <leader>fM
- [1] `<leader>fM` — Man Pages
### <leader>fR
- [1] `<leader>fR` — 🔗 References
### <leader>fS
- [1] `<leader>fS` — 🏢 Workspace Symbols
### <leader>fb
- [1] `<leader>fb` — Find Buffers
- [2] `<leader>fb` — 📂 Buffers
### <leader>fc
- [1] `<leader>fc` — Find Word
- [2] `<leader>fc` — 🔤 Find String
### <leader>fd
- [1] `<leader>fd` — 🩺 Diagnostics
### <leader>fe
- [1] `<leader>fe` — 📁 File Browser
### <leader>ff
- [1] `<leader>ff` — Find Files
- [2] `<leader>ff` — 🔍 Find Files
### <leader>fg
- [1] `<leader>fg` — Live Grep
- [2] `<leader>fg` — 🔎 Live Grep
### <leader>fh
- [1] `<leader>fh` — Help Tags
- [2] `<leader>fh` — ❓ Help Tags
### <leader>fi
- [1] `<leader>fi` — ⚙️ Implementations
### <leader>fk
- [1] `<leader>fk` — Find Keymaps
- [2] `<leader>fk` — ⌨️ Keymaps
### <leader>fm
- [1] `<leader>fm` — Find Marks
- [2] `<leader>fm` — 📖 Man Pages
### <leader>fo
- [1] `<leader>fo` — ⚙️ Vim Options
### <leader>fr
- [1] `<leader>fr` — Recent Files
- [2] `<leader>fr` — 🕒 Recent Files
### <leader>fs
- [1] `<leader>fs` — 📊 Document Symbols
### <leader>ft
- [1] `<leader>ft` — 📝 Type Definitions
### <leader>gP
- [1] `<leader>gP` — Git Pull
### <leader>gb
- [1] `<leader>gb` — Git Branches
- [2] `<leader>gb` — 🌿 Git Branches
### <leader>gc
- [1] `<leader>gc` — Git Commit
- [2] `<leader>gc` — 📝 Git Commits
### <leader>gd
- [1] `<leader>gd` — Git Diff
### <leader>ge
- [1] `<leader>ge` — 🔀 Git Status Tree
- [2] `<leader>ge` — 🔀 Git Status
### <leader>gf
- [1] `<leader>gf` — Git Files
- [2] `<leader>gf` — 📂 Git Files
### <leader>gg
- [1] `<leader>gg` — Neogit
### <leader>gh
- [1] `<leader>gh` — Git History
### <leader>ghb
- [1] `<leader>ghb` — Blame Line
### <leader>ghp
- [1] `<leader>ghp` — Preview Hunk
### <leader>ghr
- [1] `<leader>ghr` — Reset Hunk
### <leader>ghs
- [1] `<leader>ghs` — Stage Hunk
### <leader>ghu
- [1] `<leader>ghu` — Undo Stage Hunk
### <leader>gp
- [1] `<leader>gp` — Git Push
### <leader>gs
- [1] `<leader>gs` — Git Status
- [2] `<leader>gs` — 📊 Git Status
### <leader>gx
- [1] `<leader>gx` — Close Git Diff
### <leader>h
- [1] `<leader>h` — Harpoon Menu
### <leader>hR
- [1] `<leader>hR` — Reset buffer
### <leader>hS
- [1] `<leader>hS` — Stage buffer
### <leader>hd
- [1] `<leader>hd` — Diff this
### <leader>hp
- [1] `<leader>hp` — Preview hunk
### <leader>hr
- [1] `<leader>hr` — Reset hunk
### <leader>hs
- [1] `<leader>hs` — Stage hunk
### <leader>hu
- [1] `<leader>hu` — Undo stage hunk
### <leader>ji
- [1] `<leader>ji` — Jump forward in jumplist
### <leader>jo
- [1] `<leader>jo` — Jump backward in jumplist
### <leader>lp
- [1] `<leader>lp` — Toggle Python LSP only
### <leader>lt
- [1] `<leader>lt` — Toggle LSP servers
### <leader>mC
- [1] `<leader>mC` — Multi-cursor at End
### <leader>mc
- [1] `<leader>mc` — Multi-cursor at Match
- [2] `<leader>mc` — Multi-cursor at Every Match
### <leader>o
- [1] `<leader>o` — 📁 Open Oil
### <leader>qq
- [1] `<leader>qq` — Quit All
### <leader>rI
- [1] `<leader>rI` — 
### <leader>rb
- [1] `<leader>rb` — Build Project
- [2] `<leader>rb` — 
### <leader>rbf
- [1] `<leader>rbf` — 
### <leader>rc
- [1] `<leader>rc` — Close Tasks
### <leader>re
- [1] `<leader>re` — 
### <leader>rf
- [1] `<leader>rf` — 
### <leader>ro
- [1] `<leader>ro` — Open Tasks
- [2] `<leader>ro` — Open tasks
### <leader>rr
- [1] `<leader>rr` — Run Task
- [2] `<leader>rr` — Run task
### <leader>rt
- [1] `<leader>rt` — Toggle Tasks
- [2] `<leader>rt` — Toggle tasks
### <leader>rv
- [1] `<leader>rv` — 
### <leader>sD
- [1] `<leader>sD` — Delete Snapshot
### <leader>sR
- [1] `<leader>sR` — Restore Snapshot
### <leader>sS
- [1] `<leader>sS` — Save Snapshot
### <leader>sd
- [1] `<leader>sd` — Delete Session
### <leader>se
- [1] `<leader>se` — Make windows equal size
### <leader>sf
- [1] `<leader>sf` — Replace in File
- [2] `<leader>sf` — Replace in File
### <leader>sh
- [1] `<leader>sh` — Split window horizontally
### <leader>sl
- [1] `<leader>sl` — List/Search Sessions
### <leader>so
- [1] `<leader>so` — Symbols Outline (Aerial)
### <leader>sr
- [1] `<leader>sr` — Replace in Project
- [2] `<leader>sr` — Replace Selection
- [3] `<leader>sr` — Replace in Project
- [4] `<leader>sr` — 
### <leader>ss
- [1] `<leader>ss` — Save Session
### <leader>st
- [1] `<leader>st` — Todo
### <leader>sv
- [1] `<leader>sv` — Split window vertically
### <leader>sx
- [1] `<leader>sx` — Close current window
### <leader>tb
- [1] `<leader>tb` — Toggle line blame
### <leader>td
- [1] `<leader>td` — Toggle deleted
### <leader>tf
- [1] `<leader>tf` — Open current buffer in new tab
### <leader>tn
- [1] `<leader>tn` — Go to next tab
- [2] `<leader>tn` — Toggle line numbers
### <leader>to
- [1] `<leader>to` — Open new tab
### <leader>tp
- [1] `<leader>tp` — Go to previous tab
### <leader>tr
- [1] `<leader>tr` — Toggle relative numbers
### <leader>ts
- [1] `<leader>ts` — Toggle spell check
### <leader>tw
- [1] `<leader>tw` — Toggle word wrap
### <leader>tx
- [1] `<leader>tx` — Close current tab
### <leader>uc
- [1] `<leader>uc` — Toggle Colorizer
### <leader>um
- [1] `<leader>um` — Toggle Minimap
### <leader>un
- [1] `<leader>un` — Toggle Line Numbers
### <leader>ur
- [1] `<leader>ur` — Toggle Relative Numbers
### <leader>us
- [1] `<leader>us` — Toggle Spell Check
### <leader>ut
- [1] `<leader>ut` — 🎆 Switch themes
### <leader>uw
- [1] `<leader>uw` — Toggle Word Wrap
### <leader>uz
- [1] `<leader>uz` — Zen Mode
### <leader>w
- [1] `<leader>w` — Window commands
### <leader>wS
- [1] `<leader>wS` — Workspace: Sessions in current
### <leader>wa
- [1] `<leader>wa` — 
### <leader>wd
- [1] `<leader>wd` — Workspace: Delete
### <leader>wl
- [1] `<leader>wl` — Workspace: List/Open
### <leader>wn
- [1] `<leader>wn` — 
### <leader>wo
- [1] `<leader>wo` — Workspace: Open by name
### <leader>wr
- [1] `<leader>wr` — Workspace: Rename
- [2] `<leader>wr` — 
### <leader>xX
- [1] `<leader>xX` — 
- [2] `<leader>xX` — Buffer Diagnostics (Trouble)
### <leader>xe
- [1] `<leader>xe` — Show Diagnostics
### <leader>xl
- [1] `<leader>xl` — 
- [2] `<leader>xl` — Location List (Trouble)
### <leader>xq
- [1] `<leader>xq` — 
- [2] `<leader>xq` — Quickfix List (Trouble)
### <leader>xx
- [1] `<leader>xx` — 
- [2] `<leader>xx` — Diagnostics (Trouble)
### >
- [1] `>` — Indent right and reselect
### K
- [1] `K` — Hover Documentation
- [2] `K` — 
### N
- [1] `N` — 
### Q
- [1] `Q` — 
### S",
- [1] `S", mode = { "n` — 
### [b
- [1] `[b` — Previous Buffer
- [2] `[b` — Previous Buffer
### [d
- [1] `[d` — Prev Diagnostic
- [2] `[d` — 
### [h
- [1] `[h` — Prev Hunk
### [t
- [1] `[t` — Previous Todo
### ]b
- [1] `]b` — Next Buffer
- [2] `]b` — Next Buffer
### ]d
- [1] `]d` — Next Diagnostic
- [2] `]d` — 
### ]h
- [1] `]h` — Next Hunk
### ]t
- [1] `]t` — Next Todo
### ]t",
- [1] `]t", function() require("todo-comments").jump_next() end, desc = "Next Todo" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev Todo" },
    { "<leader>st` — Todo (Telescope)
### gD
- [1] `gD` — Go to Declaration
- [2] `gD` — 
### gI
- [1] `gI` — 
### gK
- [1] `gK` — 
### gT
- [1] `gT` — Previous tab
### gc",
- [1] `gc", mode = "x", desc = "Comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "Comment toggle current block" },
        { "gb", mode = { "n` — 
### gcc",
- [1] `gcc", mode = "n", desc = "Comment toggle current line" },
        { "gc", mode = { "n` — 
### gd
- [1] `gd` — Go to Definition
- [2] `gd` — 
### gi
- [1] `gi` — Go to Implementation
### gr
- [1] `gr` — Go to References
- [2] `gr` — 
### gt
- [1] `gt` — Go to Type Definition
- [2] `gt` — Next tab
### gy
- [1] `gy` — 
### jj
- [1] `jj` — Exit insert mode
### jk
- [1] `jk` — Exit insert mode
### n
- [1] `n` — 
- [2] `n` — 
- [3] `n` — 
- [4] `n` — 
- [5] `n` — 
- [6] `n` — 
- [7] `n` — 
- [8] `n` — 
- [9] `n` — 
- [10] `n` — 
- [11] `n` — 
- [12] `n` — 
- [13] `n` — 
- [14] `n` — 
- [15] `n` — 
- [16] `n` — 
- [17] `n` — 
- [18] `n` — 
- [19] `n` — 
- [20] `n` — 
- [21] `n` — 
- [22] `n` — 
- [23] `n` — 
- [24] `n` — 
- [25] `n` — 
- [26] `n` — 
- [27] `n` — 
- [28] `n` — 
- [29] `n` — 
- [30] `n` — 
- [31] `n` — 
- [32] `n` — 
- [33] `n` — 
- [34] `n` — 
- [35] `n` — 
- [36] `n` — 
- [37] `n` — 
### o
- [1] `o` — Treesitter Search
### p
- [1] `p` — 
### q
- [1] `q` — 
- [2] `q` — Close window
- [3] `q` — Quit buffer
### r
- [1] `r` — Remote Flash
### r",
- [1] `r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o` — 
### s",
- [1] `s", mode = { "n` — 
### v
- [1] `v` — 
- [2] `v` — 
- [3] `v` — 
- [4] `v` — 
- [5] `v` — 
- [6] `v` — 
- [7] `v` — 
- [8] `v` — 
- [9] `v` — 
### x
- [1] `x` — Flash
- [2] `x` — Flash Treesitter
- [3] `x` — 
- [4] `x` — Increment number
- [5] `x` — Decrement number
- [6] `x` — 
- [7] `x` — 
- [8] `x` — Copy to system clipboard
- [9] `x` — Paste from system clipboard
- [10] `x` — 
- [11] `x` — 
- [12] `x` — Go to first non-blank
- [13] `x` — Go to end of line
- [14] `x` — Select hunk