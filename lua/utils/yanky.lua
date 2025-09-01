-- ═══════════════════════════════════════════════════════════════════════════════
--  📋 YANKY - Clipboard history and smarter yanks
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "gbprod/yanky.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    ring = { history_length = 200 },
    system_clipboard = { sync_with_ring = true },
    highlight = { timer = 150 },
  },
  keys = {
    { "<leader>cy", "<cmd>Telescope yank_history<cr>", desc = "Clipboard history" },
  },
}
