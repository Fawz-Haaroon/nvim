-- ═══════════════════════════════════════════════════════════════════════════════
--  🌙 LUA FILETYPE SETTINGS - Tailored for Lua Development
-- ═══════════════════════════════════════════════════════════════════════════════

-- Lua-specific settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

-- Auto-format on save for Lua files
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = 0,
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- Lua-specific keymaps
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "<leader>lr", "<cmd>luafile %<CR>", vim.tbl_extend("force", opts, { desc = "Run Lua file" }))
vim.keymap.set("n", "<leader>ll", "<cmd>source %<CR>", vim.tbl_extend("force", opts, { desc = "Source Lua file" }))
