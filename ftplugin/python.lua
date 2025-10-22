-- ═══════════════════════════════════════════════════════════════════════════════
--  🐍 PYTHON FILETYPE SETTINGS - Professional Python Development
-- ═══════════════════════════════════════════════════════════════════════════════

-- Python-specific settings (PEP 8 compliance)
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.colorcolumn = "" -- remove ruler columns for Python
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

-- Quiet mode for Python: disable diagnostics and detach Python LSPs by default
vim.schedule(function()
  -- Hide diagnostics in this buffer
  pcall(vim.diagnostic.disable, 0)

  -- Detach/stop Python LSP clients if they attached automatically
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.name == "pyright" or client.name == "ruff" or client.name == "pylsp" then
      pcall(vim.lsp.buf_detach_client, 0, client.id)
      if not client.is_stopped() then pcall(vim.lsp.stop_client, client.id) end
    end
  end
end)

-- Easy toggles
vim.keymap.set("n", "<leader>pE", function()
  vim.diagnostic.enable(0)
  vim.cmd("LspStart pyright")
end, vim.tbl_extend("force", opts, { desc = "Enable Python errors (Pyright)" }))

vim.keymap.set("n", "<leader>pD", function()
  vim.diagnostic.disable(0)
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if c.name == "pyright" or c.name == "ruff" or c.name == "pylsp" then
      pcall(vim.lsp.buf_detach_client, 0, c.id)
      if not c.is_stopped() then pcall(vim.lsp.stop_client, c.id) end
    end
  end
end, vim.tbl_extend("force", opts, { desc = "Disable Python diagnostics/LSP" }))
