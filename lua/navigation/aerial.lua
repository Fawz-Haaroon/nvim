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
  config = function(_, opts)
    require("aerial").setup(opts)

    -- Bright, distinct colors for Aerial kinds (avoid comment-like colors)
    local function set_aerial_colors()
      local ok, cat = pcall(require, "catppuccin.palettes")
      local c = ok and cat.get_palette("mocha") or {
        yellow = "#FFFF00", sky = "#89DCEB", red = "#F38BA8", green = "#A6E3A1",
        peach = "#FAB387", mauve = "#CBA6F7", sapphire = "#74C7EC", pink = "#F5C2E7",
      }
      local set = vim.api.nvim_set_hl
      local kinds = {
        { "Class", c.mauve }, { "Function", c.green }, { "Method", c.green },
        { "Variable", c.peach }, { "Property", c.yellow }, { "Field", c.yellow },
        { "Module", c.sapphire }, { "Namespace", c.sky }, { "Interface", c.pink },
        { "Enum", c.red }, { "Struct", c.sky }, { "Constant", c.peach },
      }
      -- Current line highlight more visible
      set(0, "AerialLine", { bg = "NONE", fg = c.yellow, bold = true })
      set(0, "AerialGuide", { fg = c.sapphire })
      for _, k in ipairs(kinds) do
        set(0, "Aerial" .. k[1], { fg = k[2], bold = true })
        set(0, "Aerial" .. k[1] .. "Icon", { fg = k[2], bold = true })
      end
    end
    set_aerial_colors()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_aerial_colors })
  end,
}
