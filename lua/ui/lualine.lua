-- ═══════════════════════════════════════════════════════════════════════════
--  ✨ TOKYONIGHT LUALINE - Arrow separators, breadcrumbs, progress & location
-- ═══════════════════════════════════════════════════════════════════════════

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Colors from tokyonight (fallbacks provided)
    local ok, tn = pcall(require, 'tokyonight.colors')
    local palette = ok and tn.setup() or {}
    local bg       = palette.bg or '#1a1b26'
    local fg       = palette.fg or '#c0caf5'
    local yellow   = palette.yellow or '#e0af68'
    local orange   = palette.orange or '#ff9e64'
    local purple   = palette.purple or '#9d7cd8'
    local blue     = palette.blue or '#7aa2f7'
    local cyan     = palette.cyan or '#7dcfff'
    local green    = palette.green or '#9ece6a'
    local red      = palette.red or '#f7768e'
    local teal     = palette.teal or '#1abc9c'
    local lavender = palette.magenta or '#bb9af7'

    -- Helper: accurate filesize (KB/MB with two decimals)
    local function pretty_filesize()
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname == '' then return '' end
      local ok, stat = pcall(vim.loop.fs_stat, bufname)
      if not ok or not stat or not stat.size then return '' end
      local size = tonumber(stat.size)
      if size < 1024 then
        return tostring(size) .. ' B'
      end
      local units = { 'KB', 'MB', 'GB', 'TB' }
      local s = size / 1024
      local i = 1
      while s >= 1024 and i < #units do
        s = s / 1024
        i = i + 1
      end
      return string.format('%.2f %s', s, units[i])
    end

local navic_ok, navic = pcall(require, 'nvim-navic')

require('lualine').setup {
      options = {
        theme = 'tokyonight',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { 'snacks_dashboard', 'dashboard' } },
      },

      sections = {
        -- Left-most: logo + mode
        lualine_a = {
          { function() return '' end, padding = { left = 1, right = 1 } },
          { 'mode' },
        },

        -- Git + diagnostics
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },

        -- CENTER: Filename block (yellow) + breadcrumbs
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' },
            color = { fg = bg, bg = yellow },
            separator = { right = '' },
            padding = { left = 1, right = 1 },
          },
          {
            function()
              if navic_ok and navic.is_available() then
                return navic.get_location()
              end
              return ''
            end,
            cond = function()
              return navic_ok and navic.is_available()
            end,
            color = { fg = fg, bg = bg },
          },
        },

        -- RIGHT: encoding (purple) + filesize (orange)
        lualine_x = {
          {
            'encoding',
            color = { fg = bg, bg = purple },
            separator = { left = '' },
            padding = { left = 1, right = 1 },
          },
          {
            pretty_filesize,
            color = { fg = bg, bg = orange },
            separator = { left = '' },
            padding = { left = 1, right = 1 },
          },
        },

        -- Time + Linux logo
        lualine_y = {
          { function() return os.date("%a %b %d %I:%M %p") end, icon = '' },
        },

        -- Progress (percent) + row:col
        lualine_z = {
          { 'progress', color = { gui = 'bold' } },
          { 'location' },
        },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },

      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { 'neo-tree' },
    }
  end
}
