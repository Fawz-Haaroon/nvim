-- ═══════════════════════════════════════════════════════════════════════════
--  🚀 NEON ARCADE LUALINE (filename = YELLOW w/ arrow, filesize moved & recolored)
-- ═══════════════════════════════════════════════════════════════════════════

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Colors
    local bg      = '#050510' -- deep base
    local fg      = '#EAEAEA' -- neutral text

    local cyan    = '#00FFFF'
    local magenta = '#FF00FF'
    local green   = '#39FF14'
    local yellow  = '#F5FF00' -- filename block
    local orange  = '#FF5F1F' -- filesize block
    local blue    = '#1F51FF'
    local purple  = '#9D00FF' -- encoding / utf-8 block
    local red     = '#FF073A'

    -- Mode theme
    local neon = {
      normal = {
        a = { fg = bg, bg = cyan, gui = 'bold' },
        b = { fg = bg, bg = blue },
        c = { fg = fg, bg = bg },
        x = { fg = bg, bg = purple },
        y = { fg = bg, bg = green },
        z = { fg = bg, bg = magenta },
      },
      insert = {
        a = { fg = bg, bg = green, gui = 'bold' },
        b = { fg = bg, bg = cyan },
        c = { fg = fg, bg = bg },
        x = { fg = bg, bg = yellow },
        y = { fg = bg, bg = orange },
        z = { fg = bg, bg = red },
      },
      visual = {
        a = { fg = bg, bg = magenta, gui = 'bold' },
        b = { fg = bg, bg = purple },
        c = { fg = fg, bg = bg },
        x = { fg = bg, bg = blue },
        y = { fg = bg, bg = cyan },
        z = { fg = bg, bg = orange },
      },
      replace = {
        a = { fg = bg, bg = red, gui = 'bold' },
        b = { fg = bg, bg = orange },
        c = { fg = fg, bg = bg },
        x = { fg = bg, bg = yellow },
        y = { fg = bg, bg = green },
        z = { fg = bg, bg = cyan },
      },
      inactive = {
        a = { fg = fg, bg = bg },
        b = { fg = fg, bg = bg },
        c = { fg = fg, bg = bg },
        x = { fg = fg, bg = bg },
        y = { fg = fg, bg = bg },
        z = { fg = fg, bg = bg },
      },
    }

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

    require('lualine').setup {
      options = {
        theme = neon,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { statusline = { 'alpha' } },
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

        -- CENTER: Only the filepath (colored yellow + right arrow)
        lualine_c = {
          {
            'filename',
            path = 1, -- show path relative to working dir
            symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' },
            color = { fg = bg, bg = yellow }, -- yellow background, text = bg color for contrast
            -- ensure filename ends with a right-pointing arrow of the same yellow color
            separator = { right = '' },
            padding = { left = 1, right = 1 },
          },
        },

        -- RIGHT: encoding (purple) then filesize (orange), then time/logo
        lualine_x = {
          -- encoding block (purple) with left arrow to merge from filename and right arrow to next
          {
            'encoding',
            color = { fg = bg, bg = purple },
            separator = { left = '' },
            padding = { left = 1, right = 1 },
          },

          -- filesize now accurate and distinct color (orange). left arrow merges from encoding.
          {
            pretty_filesize,
            color = { fg = bg, bg = orange },
            separator = { left = '' },
            padding = { left = 1, right = 1 },
          },
        },

        -- time
        lualine_y = {
          { function() return os.date("%a %b %d %I:%M %p") end, icon = '' },
        },

        -- linux logo
        lualine_z = {
          { function() return '' end, padding = { left = 1, right = 1 }, color = { fg = '#FFFFFF' } },
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
