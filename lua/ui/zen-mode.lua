-- ═══════════════════════════════════════════════════════════════════════════════
--  🧘 ZEN MODE - Distraction-free editing
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = { width = 0.8, options = { number = false, relativenumber = false } },
    plugins = { options = { laststatus = 3 } },
  },
}
