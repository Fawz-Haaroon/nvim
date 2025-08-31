-- ═══════════════════════════════════════════════════════════════════════════════
--  ⌨️ CORE KEYMAPS - Professional Workflow
-- ═══════════════════════════════════════════════════════════════════════════════

local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local expr_opts = { silent = true, noremap = true, expr = true }

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🚀 ESSENTIAL MAPPINGS
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🔥 Better escape (from your workflow)
map("i", "jj", "<ESC>", { desc = "Exit insert mode", silent = true })
map("i", "jk", "<ESC>", { desc = "Exit insert mode", silent = true })

-- 🎯 Terminal escape
map("t", "<C-e>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- 💨 Clear search highlights
map("n", "<leader>cs", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 📝 ENHANCED EDITING 
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🔢 Better increment/decrement
map({"n", "x"}, "=", "<C-a>", { desc = "Increment number" })
map({"n", "x"}, "-", "<C-x>", { desc = "Decrement number" })

-- ✂️ Smart deletion (no register pollution)
map({"n", "x"}, "x", '"_x', { desc = "Delete char (no register)" })
map({"n", "x"}, "<leader>d", '"_d', { desc = "Delete (no register)" })
map("x", "p", '"_dP', { desc = "Paste (no register pollution)" })

-- 📐 Better indentation
map("x", "<", "<gv", { desc = "Indent left and reselect" })
map("x", ">", ">gv", { desc = "Indent right and reselect" })

-- 🔄 Move lines up/down
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move line up" })
map("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- 📋 Enhanced copy/paste
map("n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" })
map({"n", "x"}, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({"n", "x"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🧭 NAVIGATION & MOVEMENT
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🎯 Better line navigation
map({"n", "x"}, "j", [[v:count == 0 ? "gj" : "j"]], expr_opts)
map({"n", "x"}, "k", [[v:count == 0 ? "gk" : "k"]], expr_opts)

-- 🏃 Fast horizontal movement  
map({"n", "x"}, "H", "^", { desc = "Go to first non-blank" })
map({"n", "x"}, "L", "$", { desc = "Go to end of line" })

-- 🔍 Better search navigation
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- 📦 Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- 🎯 Ctrl+I for tab navigation between buffers (tabline)
-- Use built-in buffer commands so it works regardless of bufferline plugins
map("n", "<C-i>", "<cmd>bnext<cr>", { desc = "Next buffer (tabline)" })
-- Note: many terminals do not send <C-S-i> distinctly; still define it as best-effort.
map("n", "<C-S-i>", "<cmd>bprevious<cr>", { desc = "Previous buffer (tabline)" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🪟 WINDOW MANAGEMENT
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🔄 Smart window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- ➕ Window creation
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make windows equal size" })
map("n", "<leader>sx", "<C-w>c", { desc = "Close current window" })

-- 📏 Window resizing with Ctrl+Arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 📂 TAB MANAGEMENT
-- ═══════════════════════════════════════════════════════════════════════════════

map("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

-- 🚀 Fast tab switching (like your old workflow)
map("n", "gt", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "gT", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<C-PageDown>", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<C-PageUp>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- 💨 Quick tab access (1-9)
for i = 1, 9 do
    map("n", "<leader>" .. i, i .. "gt", { desc = "Go to tab " .. i })
end

-- ⚡ Restore jumplist functionality (since <C-i> is taken by completion)
map("n", "<C-\\>", "<C-i>", { desc = "Jump forward in jumplist" })
map("n", "<leader>ji", "<C-i>", { desc = "Jump forward in jumplist" })
map("n", "<leader>jo", "<C-o>", { desc = "Jump backward in jumplist" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🎛️ UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🔄 Reload configuration
map("n", "<leader>R", "<cmd>source $MYVIMRC<cr>", { desc = "Reload config" })

-- 💾 SAVE FILES
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("i", "<C-s>", "<Esc><cmd>w<cr>a", { desc = "Save file (insert mode)" })
map("v", "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save file (visual mode)" })

-- 💤 Lazy.nvim
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

-- 🔧 Toggle options
map("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "Toggle word wrap" })
map("n", "<leader>tn", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
map("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })
map("n", "<leader>ts", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })

-- 🎨 Theme switcher (Epic collection!)
map("n", "<leader>ut", "<cmd>Themery<cr>", { desc = "🎆 Switch themes" })
map("n", "<leader>u1", function() vim.cmd('colorscheme catppuccin-mocha') end, { desc = "🌸 Catppuccin Mocha" })
map("n", "<leader>u2", function() vim.cmd('colorscheme tokyonight-night') end, { desc = "🌙 Tokyo Night" })
map("n", "<leader>u3", function() vim.cmd('colorscheme rose-pine') end, { desc = "🌺 Rose Pine" })
map("n", "<leader>u4", function() vim.cmd('colorscheme gruvbox') end, { desc = "🔥 Gruvbox" })
map("n", "<leader>u5", function() vim.cmd('colorscheme oxocarbon') end, { desc = "⚫ Oxocarbon" })
map("n", "<leader>u6", function() vim.cmd('colorscheme kanagawa-wave') end, { desc = "🎋 Kanagawa" })
map("n", "<leader>u7", function() vim.cmd('colorscheme synthwave84') end, { desc = "🌌 Synthwave84" })
map("n", "<leader>u8", function() vim.cmd('colorscheme material') end, { desc = "💫 Material" })

-- 🪟 Transparency toggle (matches Hyprland glass aesthetic)
map("n", "<leader>uT", function()
  require("ui.transparency").toggle()
end, { desc = "🪟 Toggle UI Transparency" })

-- 📍 Diagnostics navigation (for LSP)
map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
map("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Diagnostic quickfix" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🎯 COMPETITIVE PROGRAMMING (from your workflow)
-- ═══════════════════════════════════════════════════════════════════════════════

-- 🏆 CP shortcuts (preserving your existing bindings)
map("n", "<leader>cp", function()
    -- This will be connected to your CP module
    vim.notify("🏆 CP Template - Ready!", vim.log.levels.INFO)
end, { desc = "Copy C++ template" })

map("n", "<leader>cc", function()
    -- This will be connected to your CP module  
    vim.notify("⚡ Compiling...", vim.log.levels.INFO)
end, { desc = "Compile & run C++23" })

map("n", "<leader>sp", function()
    -- This will be connected to your CP module
    vim.notify("📊 Input/Output windows toggled", vim.log.levels.INFO)  
end, { desc = "Toggle input/output windows" })

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🚫 DISABLE PROBLEMATIC DEFAULTS
-- ═══════════════════════════════════════════════════════════════════════════════

-- Disable Ex mode
map("n", "Q", "<nop>", opts)

-- Disable macro recording (can be re-enabled if needed)
-- map("n", "q", "<nop>", opts)

-- Disable command line history
map("c", "<C-p>", "<nop>", opts)
map("c", "<C-n>", "<nop>", opts)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 📱 MOBILE-FRIENDLY ALTERNATIVES
-- ═══════════════════════════════════════════════════════════════════════════════

-- Alternative to Ctrl combinations
map("n", "<leader>w", "<C-w>", { desc = "Window commands" })
map("n", "<leader><leader>", "<C-^>", { desc = "Switch to last buffer" })

-- Success notification
vim.notify("⌨️  Keymaps loaded successfully!", vim.log.levels.INFO, { title = "🎯 Keymaps" })
