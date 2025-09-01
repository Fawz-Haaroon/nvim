-- ═══════════════════════════════════════════════════════════════════════════════
--  🧭 AERIAL - Symbols outline sidebar
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle", "AerialOpen", "AerialNavOpen" },
  keys = {
    { "<leader>so", "<cmd>AerialToggle!<cr>", desc = "Symbols Outline (Aerial)" },
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown" },
    layout = { min_width = 30, max_width = { 40, 0.2 }, default_direction = "right" },
    show_guides = true,
    guides = { mid_item = "├", last_item = "└", nested_top = "│", whitespace = "  " },
    attach_mode = "global",
    highlight_on_hover = true,
    nerdfont = true,
    filter_kind = false,
  },
}
