-- ═══════════════════════════════════════════════════════════════════════════════
--  🧘 ZEN MODE - Distraction-free editing
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>zm", "<cmd>ZenMode<cr>", desc = "🧘 Zen Mode (Legacy)" },
  },
  opts = {
    window = { width = 0.8, options = { number = false, relativenumber = false } },
    plugins = { options = { laststatus = 3 } },
  },
}
