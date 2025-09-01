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
local host_py = (vim.g.python3_host_prog and vim.fn.executable(vim.g.python3_host_prog) == 1) and vim.g.python3_host_prog or "python3"
vim.keymap.set("n", "<leader>pr", function()
  vim.cmd("!" .. vim.fn.fnameescape(host_py) .. " %")
end, vim.tbl_extend("force", opts, { desc = "Run Python file" }))
vim.keymap.set("n", "<leader>pi", function()
  vim.cmd("!" .. vim.fn.fnameescape(host_py) .. " -i %")
end, vim.tbl_extend("force", opts, { desc = "Run Python interactive" }))
vim.keymap.set("n", "<leader>pt", function()
  vim.cmd("!" .. vim.fn.fnameescape(host_py) .. " -m pytest")
end, vim.tbl_extend("force", opts, { desc = "Run pytest" }))
