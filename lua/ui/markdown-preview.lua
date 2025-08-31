-- ═══════════════════════════════════════════════════════════════════════════════
--  📝 MARKDOWN-PREVIEW.NVIM - Live Markdown Preview (no yarn/npm required)
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  -- Install prebuilt app without requiring Node/Yarn (synchronous, no UI)
  build = function()
    vim.fn["mkdp#util#install_sync"](1)
  end,
  init = function()
    -- Limit activation to markdown files
    vim.g.mkdp_filetypes = { "markdown" }
    -- Allow commands to be used from any buffer to avoid E464 outside markdown
    vim.g.mkdp_command_for_global = 1
  end,
}

