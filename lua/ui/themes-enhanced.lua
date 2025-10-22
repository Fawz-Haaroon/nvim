-- ═══════════════════════════════════════════════════════════════════════════════
--  🎨 ENHANCED THEMES - Vibrant, Glowing & Aesthetic Collection
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  -- 🌙 Tokyo Night - Multiple variants with different vibes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm", -- storm, night, moon, day
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
      sidebars = { "qf", "help", "neo-tree" },
      day_brightness = 0.3,
      hide_inactive_statusline = true,
      dim_inactive = false,
      lualine_bold = true,
      
      -- Make it more vibrant
      on_colors = function(colors)
        colors.border = "#7aa2f7"
        colors.fg_gutter = "#3b4261"
      end,
      
      on_highlights = function(hl, c)
        hl.LineNr = { fg = c.dark5 }
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.Visual = { bg = c.dark3 }
      end,
    },
  },

  -- 🌸 Catppuccin - Warm coffee palette (already have this, but with enhancements)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        neo_tree = true,
        telescope = { enabled = true },
        notify = true,
        mini = false,
        noice = true,
        which_key = true,
        treesitter = true,
        dashboard = true,
        dap = { enabled = true },
      },
    },
  },

  -- 🌺 Rose Pine - Elegant moonlight theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "moon", -- auto, main, moon, dawn
      dark_variant = "moon",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
      highlight_groups = {
        CursorLine = { bg = "surface" },
        Visual = { bg = "highlight_med" },
      },
    },
  },

  -- 🎨 Nightfox - Vibrant fox-inspired themes
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "bold",
        },
        inverse = {
          match_paren = true,
        },
        modules = {
          telescope = true,
          notify = true,
          neo_tree = true,
        },
      },
      -- Variants: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
    },
  },

  -- 🌌 Cyberdream - Neon cyberpunk aesthetic
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
    },
  },

  -- ⚡ Kanagawa - Japanese aesthetics with wave variant
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = { bold = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      theme = "wave", -- wave, dragon, lotus
    },
  },

  -- 🔥 Gruvbox - Retro warm vibes with material variant
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium" -- hard, medium, soft
      vim.g.gruvbox_material_foreground = "material" -- material, mix, original
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_visual = "reverse"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_better_performance = 1
    end,
  },

  -- 🎆 Everforest - Comfortable green forest theme
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "medium" -- hard, medium, soft
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
    end,
  },

  -- 🌊 Sonokai - Vibrant high contrast
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = "andromeda" -- default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- 🎭 Dracula - Classic vibrant theme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_bg = false,
      italic_comment = true,
      colors = {
        bg = "#282A36",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        cyan = "#8BE9FD",
        green = "#50FA7B",
        orange = "#FFB86C",
        pink = "#FF79C6",
        purple = "#BD93F9",
        red = "#FF5555",
        yellow = "#F1FA8C",
      },
    },
  },

  -- 💫 Ayu - Three variants (dark, mirage, light)
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require('ayu').setup({
        mirage = true,
        overrides = {},
      })
    end,
  },

  -- 🌃 Material - Google's Material Design
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = false,
        filetypes = {},
      },
      styles = {
        comments = { italic = true },
        strings = {},
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
      plugins = {
        telescope = true,
        neotree = true,
        gitsigns = true,
        nvim_cmp = true,
        which_key = true,
      },
      disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false,
      },
      lualine_style = "default",
      async_loading = true,
    },
  },

  -- 🎨 Monokai Pro - Professional vibrant theme
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = false,
      terminal_colors = true,
      devicons = true,
      styles = {
        comment = { italic = true },
        keyword = { italic = true },
        type = { italic = true },
        storageclass = { italic = true },
        structure = { italic = true },
        parameter = { italic = true },
        annotation = { italic = true },
        tag_attribute = { italic = true },
      },
      filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    },
  },

  -- 🌠 Nord - Arctic, bluish theme
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = true
      vim.g.nord_bold = true
    end,
  },

  -- 🔮 Oxocarbon - IBM's sleek dark theme
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },

  -- 🌈 Synthwave84 - Neon glow retro vibes
  {
    "lunarvim/synthwave84.nvim",
    lazy = false,
    priority = 1000,
  },

  -- ✨ One Dark Pro - VSCode's beloved theme
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = "italic",
        keywords = "bold",
        functions = "NONE",
        strings = "NONE",
        variables = "NONE",
      },
      options = {
        cursorline = true,
        transparency = false,
        terminal_colors = true,
        lualine_transparency = false,
      },
    },
  },
  
  -- 🎇 Fluoromachine - Neon glow aesthetic
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      glow = true,
      theme = "fluoromachine", -- fluoromachine, retrowave, delta
      transparent = false,
    },
  },
}
