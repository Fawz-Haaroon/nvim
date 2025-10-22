-- LSP plugins loader
-- Skips utils.lua which is a utility module, not a plugin spec

return {
  { import = "lsp.actions-preview" },
  { import = "lsp.lspconfig-ultimate" },
  { import = "lsp.mason" },
  { import = "lsp.trouble" },
}
