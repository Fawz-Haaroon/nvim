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
    local function palette_tokyonight()
      local ok, tn = pcall(require, "tokyonight.colors")
      if ok then
        local t = tn.setup()
        return {
          yellow = t.yellow,
          sky = t.blue2 or t.blue,
          red = t.red,
          green = t.green,
          peach = t.orange,
          mauve = t.purple,
          sapphire = t.cyan,
          pink = t.magenta,
        }
      end
    end
    local function palette_catppuccin()
      local ok, cat = pcall(require, "catppuccin.palettes")
      if ok then
        local c = cat.get_palette("mocha")
        return {
          yellow = c.yellow, sky = c.sky, red = c.red, green = c.green,
          peach = c.peach, mauve = c.mauve, sapphire = c.sapphire, pink = c.pink,
        }
      end
    end
    local function set_aerial_colors()
      local colors_name = vim.g.colors_name or ""
      local c = (colors_name:match("^tokyonight")) and palette_tokyonight() or palette_catppuccin() or {
        yellow = "#E0AF68", sky = "#7AA2F7", red = "#F7768E", green = "#9ECE6A",
        peach = "#FF9E64", mauve = "#BB9AF7", sapphire = "#7DCFFF", pink = "#F7768E",
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
