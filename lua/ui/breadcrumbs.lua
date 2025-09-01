-- ═══════════════════════════════════════════════════════════════════════════════
--  🍞 BREADCRUMBS - nvim-navic integration
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "SmiteshP/nvim-navic",
  event = "LspAttach",
  opts = {
    highlight = true,
    separator = "  ",
    depth_limit = 5,
    safe_output = true,
  },
  config = function(_, opts)
    local navic = require("nvim-navic")
    navic.setup(opts)

    local function set_navic_colors()
      local ok, cat = pcall(require, "catppuccin.palettes")
      local c = ok and cat.get_palette("mocha") or {
        yellow = "#FFFF00", sky = "#89DCEB", red = "#F38BA8", green = "#A6E3A1",
        peach = "#FAB387", mauve = "#CBA6F7", sapphire = "#74C7EC", pink = "#F5C2E7",
      }
      local set = vim.api.nvim_set_hl
      set(0, "NavicText", { fg = c.yellow, bold = true })
      set(0, "NavicSeparator", { fg = c.sky })
      local kinds = {
        { "Class", c.mauve }, { "Function", c.green }, { "Method", c.green },
        { "Variable", c.peach }, { "Property", c.yellow }, { "Field", c.yellow },
        { "Module", c.sapphire }, { "Namespace", c.sky }, { "Interface", c.pink },
        { "Enum", c.red }, { "Struct", c.sky }, { "Constant", c.peach },
      }
      for _, k in ipairs(kinds) do
        set(0, "NavicIcons" .. k[1], { fg = k[2], bold = true })
      end
    end
    set_navic_colors()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_navic_colors })
  end,
}
