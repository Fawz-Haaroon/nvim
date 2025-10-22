-- ═══════════════════════════════════════════════════════════════════════════════
--  🌙 TOKYO NIGHT ENHANCED - Vibrant Storm with Soothing Lualine Colors
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "storm",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true, bold = true },
      functions = { bold = true },
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = { "qf", "help", "neo-tree", "terminal" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = true,

    -- 🎨 Enhanced vibrant colors
    on_colors = function(c)
      c.bg = "#1a1b26"
      c.bg_dark = "#16161e"
      c.bg_float = "#16161e"
      c.bg_highlight = "#292e42"
      c.bg_popup = "#16161e"
      c.bg_search = "#3d59a1"
      c.bg_sidebar = "#16161e"
      c.bg_statusline = "#16161e"
      c.bg_visual = "#33467c"
      c.border = "#7aa2f7"
      c.fg = "#c0caf5"
      c.fg_dark = "#a9b1d6"
      c.fg_float = "#c0caf5"
      c.fg_gutter = "#3b4261"
      c.fg_sidebar = "#a9b1d6"
      c.terminal_black = "#414868"
      
      -- Enhanced accent colors for more vibrance
      c.blue = "#7aa2f7"
      c.blue0 = "#3d59a1"
      c.blue1 = "#2ac3de"
      c.blue2 = "#0db9d7"
      c.blue5 = "#89ddff"
      c.blue6 = "#b4f9f8"
      c.blue7 = "#394b70"
      c.cyan = "#7dcfff"
      c.green = "#9ece6a"
      c.green1 = "#73daca"
      c.green2 = "#41a6b5"
      c.magenta = "#bb9af7"
      c.magenta2 = "#ff007c"
      c.orange = "#ff9e64"
      c.purple = "#9d7cd8"
      c.red = "#f7768e"
      c.red1 = "#db4b4b"
      c.teal = "#1abc9c"
      c.yellow = "#e0af68"
      
      -- 🌈 Soothing lualine colors (harmonious pastels)
      c.git = {
        add = "#73daca",    -- Soft teal
        change = "#7aa2f7", -- Soft blue
        delete = "#f7768e", -- Soft pink-red
      }
    end,

    on_highlights = function(hl, c)
      -- Line numbers with better visibility
      hl.LineNr = { fg = "#565f89" }
      hl.CursorLineNr = { fg = "#ff9e64", bold = true }
      
      -- Better visual selection
      hl.Visual = { bg = "#33467c" }
      hl.VisualNOS = { bg = "#33467c" }
      
      -- Enhanced search
      hl.Search = { bg = "#3d59a1", fg = "#c0caf5" }
      hl.IncSearch = { bg = "#ff9e64", fg = "#1a1b26", bold = true }
      hl.CurSearch = { bg = "#ff007c", fg = "#c0caf5", bold = true }
      
      -- Better comments
      hl.Comment = { fg = "#565f89", italic = true }
      
      -- Enhanced UI elements
      hl.FloatBorder = { fg = "#7aa2f7", bg = "#16161e" }
      hl.NormalFloat = { bg = "#16161e" }
      hl.Pmenu = { bg = "#16161e", fg = "#c0caf5" }
      hl.PmenuSel = { bg = "#3d59a1", fg = "#c0caf5", bold = true }
      hl.PmenuSbar = { bg = "#1a1b26" }
      hl.PmenuThumb = { bg = "#3b4261" }
      
      -- Better cursor line
      hl.CursorLine = { bg = "#292e42" }
      hl.CursorColumn = { bg = "#292e42" }
      
      -- Enhanced diff colors
      hl.DiffAdd = { bg = "#1e3a20", fg = "#73daca" }
      hl.DiffChange = { bg = "#1e2a3a", fg = "#7aa2f7" }
      hl.DiffDelete = { bg = "#3a1e1e", fg = "#f7768e" }
      hl.DiffText = { bg = "#2a4a5a", fg = "#7dcfff", bold = true }
      
      -- Git signs with soothing colors
      hl.GitSignsAdd = { fg = "#73daca" }
      hl.GitSignsChange = { fg = "#7aa2f7" }
      hl.GitSignsDelete = { fg = "#f7768e" }
      
      -- Better statusline (soothing harmonious colors)
      hl.StatusLine = { bg = "#1e2030", fg = "#a9b1d6" }
      hl.StatusLineNC = { bg = "#16161e", fg = "#565f89" }
      
      -- Lualine mode colors (soothing pastels)
      hl.LualineNormal = { bg = "#7aa2f7", fg = "#1a1b26", bold = true }
      hl.LualineInsert = { bg = "#9ece6a", fg = "#1a1b26", bold = true }
      hl.LualineVisual = { bg = "#bb9af7", fg = "#1a1b26", bold = true }
      hl.LualineReplace = { bg = "#f7768e", fg = "#1a1b26", bold = true }
      hl.LualineCommand = { bg = "#e0af68", fg = "#1a1b26", bold = true }
      
      -- Better telescope
      hl.TelescopeBorder = { fg = "#7aa2f7", bg = "#16161e" }
      hl.TelescopePromptBorder = { fg = "#7aa2f7", bg = "#1e2030" }
      hl.TelescopePromptTitle = { fg = "#1a1b26", bg = "#7aa2f7", bold = true }
      hl.TelescopePreviewTitle = { fg = "#1a1b26", bg = "#9ece6a", bold = true }
      hl.TelescopeResultsTitle = { fg = "#1a1b26", bg = "#bb9af7", bold = true }
      hl.TelescopeSelection = { bg = "#2a2f41", fg = "#c0caf5" }
      hl.TelescopeMatching = { fg = "#ff9e64", bold = true }
      
      -- Neo-tree enhancements
      hl.NeoTreeNormal = { bg = "#16161e", fg = "#a9b1d6" }
      hl.NeoTreeNormalNC = { bg = "#16161e", fg = "#a9b1d6" }
      hl.NeoTreeFloatBorder = { fg = "#7aa2f7", bg = "#16161e" }
      hl.NeoTreeGitAdded = { fg = "#73daca" }
      hl.NeoTreeGitModified = { fg = "#7aa2f7" }
      hl.NeoTreeGitDeleted = { fg = "#f7768e" }
      
      -- Better diagnostics
      hl.DiagnosticError = { fg = "#db4b4b" }
      hl.DiagnosticWarn = { fg = "#e0af68" }
      hl.DiagnosticInfo = { fg = "#0db9d7" }
      hl.DiagnosticHint = { fg = "#1abc9c" }
      
      -- Enhanced syntax highlighting
      hl.Function = { fg = "#7aa2f7", bold = true }
      hl.Keyword = { fg = "#bb9af7", italic = true, bold = true }
      hl.String = { fg = "#9ece6a" }
      hl.Number = { fg = "#ff9e64" }
      hl.Boolean = { fg = "#ff9e64", bold = true }
      hl.Operator = { fg = "#89ddff" }
      hl.Type = { fg = "#2ac3de", bold = true }
      hl.Variable = { fg = "#c0caf5" }
      hl.Constant = { fg = "#ff9e64" }
      
      -- Better fold colors
      hl.Folded = { bg = "#1e2030", fg = "#7aa2f7" }
      hl.FoldColumn = { bg = "#1a1b26", fg = "#565f89" }
      
      -- Tab line
      hl.TabLine = { bg = "#16161e", fg = "#565f89" }
      hl.TabLineFill = { bg = "#16161e" }
      hl.TabLineSel = { bg = "#7aa2f7", fg = "#1a1b26", bold = true }
      
      -- Snacks dashboard
      hl.SnacksDashboardHeader = { fg = "#7aa2f7", bold = true }
      hl.SnacksDashboardDesc = { fg = "#9ece6a" }
      hl.SnacksDashboardIcon = { fg = "#9ece6a" }
      hl.SnacksDashboardKey = { fg = "#ff9e64", bold = true }
      hl.SnacksDashboardFooter = { fg = "#bb9af7", italic = true }
      hl.SnacksDashboardStats = { fg = "#7aa2f7", bold = true }
      hl.SnacksDashboardStatsText = { fg = "#c0caf5" }
      hl.SnacksDashboardWorkspaceHint = { fg = "#565f89", italic = true }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight-storm]])
    
    -- Apply the theme silently
  end,
}
