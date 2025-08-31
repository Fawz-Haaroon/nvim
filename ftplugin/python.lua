-- ═══════════════════════════════════════════════════════════════════════════════
--  🐍 PYTHON FILETYPE SETTINGS - Professional Python Development
-- ═══════════════════════════════════════════════════════════════════════════════

-- Python-specific settings (PEP 8 compliance)
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.colorcolumn = "80,120"
vim.opt_local.textwidth = 79

-- Python-specific keymaps
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "<leader>pr", "<cmd>!python3 %<CR>", vim.tbl_extend("force", opts, { desc = "Run Python file" }))
vim.keymap.set("n", "<leader>pi", "<cmd>!python3 -i %<CR>", vim.tbl_extend("force", opts, { desc = "Run Python interactive" }))
vim.keymap.set("n", "<leader>pt", "<cmd>!python3 -m pytest<CR>", vim.tbl_extend("force", opts, { desc = "Run pytest" }))
