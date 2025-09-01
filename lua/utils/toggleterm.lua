-- ═══════════════════════════════════════════════════════════════════════════════
--  🧪 TOGGLETEAM (toggleterm) - Integrated terminal
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", function() require("toggleterm").toggle() end, desc = "Toggle terminal" },
  },
  opts = {
    size = 14,
    open_mapping = [[<c-\>]],
    shade_terminals = true,
    shading_factor = 2,
    direction = "float",
    float_opts = { border = "rounded", winblend = 0 },
  },
}
