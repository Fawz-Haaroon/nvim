-- ═══════════════════════════════════════════════════════════════════════════
--  🎆 ULTIMATE THEME COLLECTION - Epic Colorschemes & Theme Switcher
-- ═══════════════════════════════════════════════════════════════════════════

return {
  -- 🌟 1. CATPPUCCIN - Pastel perfection
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      styles = {
        comments = { "italic" },
        keywords = { "italic", "bold" },
        functions = { "bold" },
      },
    },
  },

  -- 🌙 2. TOKYONIGHT - Cyberpunk perfection
  {
    "folke/tokyonight.nvim",
    priority = 900,
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "night",
        light_style = "day",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent",
          floats = "transparent",
        },
        sidebars = { "qf", "help", "terminal" },
        day_brightness = 0.3,
        dim_inactive = false,
        lualine_bold = true,
        cache = true,
      })
      -- Apply as default colorscheme
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- 🌺 3. ROSE-PINE - Elegant and sophisticated
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 800,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- auto, main, moon, or dawn
        dark_variant = "main",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
    end,
  },

  -- 🔥 4. GRUVBOX - Retro and warm
  {
    "ellisonleao/gruvbox.nvim",
    priority = 700,
    opts = {
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true,
      contrast = "hard", -- hard, soft, or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    },
  },

  -- 🧛‍♀️ 5. DRACULA - Legendary vampire theme
  {
    "Mofiqul/dracula.nvim",
    priority = 650,
    config = function()
      require("dracula").setup({
        colors = {
          bg = "#282A36",
          fg = "#F8F8F2",
          selection = "#44475A",
          comment = "#6272A4",
          red = "#FF5555",
          orange = "#FFB86C",
          yellow = "#F1FA8C",
          green = "#50fa7b",
          purple = "#BD93F9",
          cyan = "#8BE9FD",
          pink = "#FF79C6",
          bright_red = "#FF6E6E",
          bright_green = "#69FF94",
          bright_yellow = "#FFFFA5",
          bright_blue = "#D6ACFF",
          bright_magenta = "#FF92DF",
          bright_cyan = "#A4FFFF",
          bright_white = "#FFFFFF",
          menu = "#21222C",
          visual = "#3E4452",
          gutter_fg = "#4B5263",
          nontext = "#3B4048",
        },
        show_end_of_buffer = true,
        transparent_bg = true,
        lualine_bg_color = "#44475a",
        italic_comment = true,
      })
    end,
  },

  -- 🌈 6. FLUOROMACHINE - Retro neon synthwave
  {
    "maxmx03/fluoromachine.nvim",
    priority = 640,
    config = function()
      require('fluoromachine').setup({
        glow = false,
        theme = 'fluoromachine',
        transparent = true,
      })
    end,
  },

  -- ⚡ 7. OXOCARBON - IBM's sleek theme
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 600,
  },

  -- 🎨 8. KANAGAWA - Japanese aesthetics
  {
    "rebelot/kanagawa.nvim",
    priority = 500,
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = { bold = true },
      keywordStyle = { italic = true, bold = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = true,
      terminalColors = true,
      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus"
      },
    },
  },

  -- 🌌 9. SYNTHWAVE84 - Pure cyberpunk neon glow
  {
    "lunarvim/synthwave84.nvim",
    priority = 640,
    config = function()
      local ok, synth = pcall(require, "synthwave84")
      if ok and type(synth) == "table" and type(synth.setup) == "function" then
        synth.setup({
          glow = {
            enabled = false,
            -- style = "hard", -- uncomment if supported for stronger glow
          },
          italic_comments = true,
          transparent = true,
        })
      end
    end,
  },


  -- 💫 11. MATERIAL - Google's Material Design
  {
    "marko-cerovac/material.nvim",
    priority = 290,
    config = function()
      require('material').setup({
        contrast = {
          terminal = false,
          sidebars = false,
          floating_windows = false,
          cursor_line = false,
          non_current_windows = false,
          filetypes = {},
        },
        styles = {
          comments = { italic = true },
          strings = { bold = true },
          keywords = { underline = true },
          functions = { bold = true, undercurl = true },
          variables = {},
          operators = {},
          types = {},
        },
        plugins = {
          "dap",
          "dashboard",
          "gitsigns",
          "hop",
          "indent-blankline",
          "lspsaga",
          "mini",
          "neogit",
          "neorg",
          "nvim-cmp",
          "nvim-navic",
          "nvim-tree",
          "nvim-web-devicons",
          "telescope",
          "trouble",
          "which-key",
        },
        disable = {
          colored_cursor = false,
          borders = false,
          background = true,
          term_colors = false,
          eob_lines = false
        },
        high_visibility = {
          lighter = false,
          darker = true
        },
        lualine_style = "stealth",
        async_loading = true,
        custom_colors = nil,
        custom_highlights = {},
      })
    end,
  },

  -- 🌊 12. AQUARIUM - Underwater paradise
  {
    "FrenzyExists/aquarium-vim",
    priority = 280,
  },

  -- 🎃 13. MONOKAI PRO - Sublime Text vibes
  {
    "loctvl842/monokai-pro.nvim",
    priority = 270,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        inc_search = "background", -- underline | background
        background_clear = {
          "float_win",
          "toggleterm",
          "telescope",
          "which-key",
          "renamer",
          "notify",
          "nvim-tree",
          "neo-tree",
          "bufferline",
        },
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "default",
            context_start_underline = false,
          },
        },
      })
    end,
  },

  -- 🌃 14. NIGHTFOX - Highly customizable with multiple variants
  {
    "EdenEast/nightfox.nvim",
    priority = 260,
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
        dim_inactive = true,
        module_default = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    },
  },

  -- ❄️ 15. NORD - Arctic, north-bluish theme
  {
    "shaunsingh/nord.nvim",
    priority = 250,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_bold = true
    end,
  },

  -- 🌲 16. EVERFOREST - Comfortable green forest theme
  {
    "sainnhe/everforest",
    priority = 240,
    config = function()
      vim.g.everforest_background = "hard" -- hard, medium, soft
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_transparent_background = 2
    end,
  },

  -- 🌅 17. AYU - Light, Mirage, and Dark variants
  {
    "Shatur/neovim-ayu",
    priority = 230,
    config = function()
      require('ayu').setup({
        mirage = true,
        terminal = true,
        overrides = {},
      })
    end,
  },

  -- 🎭 18. ONEDARKPRO - OneDark with extras
  {
    "olimorris/onedarkpro.nvim",
    priority = 220,
    opts = {
      colors = {},
      highlights = {},
      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
      options = {
        transparency = true,
      },
    },
  },

  -- 🌐 19. CYBERDREAM - Modern cyberpunk theme
  {
    "scottmckendry/cyberdream.nvim",
    priority = 210,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = false,
      borderless_telescope = true,
      terminal_colors = true,
    },
  },

  -- 🌺 20. SONOKAI - Monokai evolution
  {
    "sainnhe/sonokai",
    priority = 200,
    config = function()
      vim.g.sonokai_style = "atlantis" -- default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_enable_italic = 1
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- 🎨 21. GRUVBOX MATERIAL - Enhanced Gruvbox
  {
    "sainnhe/gruvbox-material",
    priority = 190,
    config = function()
      vim.g.gruvbox_material_background = "hard" -- hard, medium, soft
      vim.g.gruvbox_material_foreground = "material" -- material, mix, original
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
    end,
  },

  -- 🌈 22. ENFOCADO - Focus on what matters
  {
    "wuelnerdotexe/vim-enfocado",
    priority = 180,
    config = function()
      vim.g.enfocado_style = "neon" -- nature or neon
    end,
  },

  -- 🌟 23. MELANGE - Warm, cozy colorscheme
  {
    "savq/melange-nvim",
    priority = 170,
  },

  -- 🎯 THEME SWITCHER CONFIGURATION
  {
    "zaldih/themery.nvim",
    priority = 200,
    cmd = "Themery",
    config = function()
      require('themery').setup({
        themes = {
          {
            name = "☕ Catppuccin Macchiato - Warm Coffee Paradise",
            colorscheme = "catppuccin-macchiato",
          },
          {
            name = "🌃 Tokyo Night - Midnight Coding Bliss",
            colorscheme = "tokyonight-night",
          },
          {
            name = "🌙 Rose Pine Moon - Moonlight Elegance",
            colorscheme = "rose-pine-moon",
          },
          {
            name = "🔥 Gruvbox - Retro Warm Vibes",
            colorscheme = "gruvbox",
          },
          {
            name = "🧛‍♀️ Dracula - Legendary Vampire Theme",
            colorscheme = "dracula",
            before = [[
              require("dracula").setup({})
            ]],
          },
          {
            name = "🌈 Fluoromachine - Neon Synthwave Magic",
            colorscheme = "fluoromachine",
            before = [[
              require('fluoromachine').setup({ glow = false, transparent = true })
            ]],
          },
          {
            name = "⚡ Oxocarbon - IBM's Sleek Minimalism",
            colorscheme = "oxocarbon",
          },
          {
            name = "🎨 Kanagawa - Japanese Zen Aesthetics",
            colorscheme = "kanagawa-wave",
          },
          {
            name = "🌌 Synthwave84 - Neon Glow",
            colorscheme = "synthwave84",
            before = [[
              local ok, synth = pcall(require, 'synthwave84')
              if ok and synth and synth.setup then
                synth.setup({ glow = { enabled = false }, transparent = true })
              end
            ]],
          },
          {
            name = "💫 Material Deep Ocean - Google's Design",
            colorscheme = "material",
            before = [[
              vim.g.material_style = "deep ocean"
            ]],
          },
          {
            name = "🌊 Aquarium - Underwater Paradise",
            colorscheme = "aquarium",
          },
          {
            name = "🎃 Monokai Pro - Sublime Perfection",
            colorscheme = "monokai-pro",
            before = [[
              require("monokai-pro").setup({})
            ]],
          },
          {
            name = "🌃 Nightfox - Highly Customizable",
            colorscheme = "nightfox",
          },
          {
            name = "❄️ Nord - Arctic Blue Minimalism",
            colorscheme = "nord",
          },
          {
            name = "🌲 Everforest - Comfortable Green Forest",
            colorscheme = "everforest",
          },
          {
            name = "🌅 Ayu Mirage - Sublime Elegance",
            colorscheme = "ayu-mirage",
          },
          {
            name = "🎭 OneDark Pro - Enhanced OneDark",
            colorscheme = "onedark",
          },
          {
            name = "🌐 Cyberdream - Modern Cyberpunk",
            colorscheme = "cyberdream",
          },
          {
            name = "🌺 Sonokai Atlantis - Monokai Evolution",
            colorscheme = "sonokai",
          },
          {
            name = "🎨 Gruvbox Material - Enhanced Retro",
            colorscheme = "gruvbox-material",
          },
          {
            name = "🌈 Enfocado Neon - Focus Mode",
            colorscheme = "enfocado",
          },
          {
            name = "🌟 Melange - Warm & Cozy",
            colorscheme = "melange",
          },
        },
        livePreview = true,
      })
    end,
  },

}
