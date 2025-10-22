-- ═══════════════════════════════════════════════════════════════════════════════
--  🗝️ WHICH-KEY - Keybinding Discovery Menu
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "classic",
      delay = 200,
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
      },
      win = {
        no_overlap = true,
        padding = { 1, 1 },
        title = false,
        border = "rounded",
        zindex = 1000,
      },
      layout = {
        width = { min = 20, max = 50 },
        height = { min = 5, max = 30 },
        spacing = 2,
        align = "left",
      },
      show_help = true,
      show_keys = true,
    })
  end,
}
