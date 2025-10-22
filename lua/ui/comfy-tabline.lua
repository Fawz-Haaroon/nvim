-- ═══════════════════════════════════════════════════════════════════════════════
--  🗂️  COMFYLINE-INSPIRED BUFFERLINE - Custom Tabline for Neovim
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  -- Anchor on devicons so Lazy can run our init at startup without adding a new plugin
  "nvim-tree/nvim-web-devicons",
  -- do not set lazy/event here; ui/devicons already controls load (lazy=false, high priority)
  keys = {
    { "<leader>bd", function() CloseBuffer(vim.api.nvim_get_current_buf()) end, desc = "Delete Buffer" },
    { "<leader>bD", function() CloseAllButCurrent() end,             desc = "Delete All But Current" },
    { "<leader>bl", function() CloseLeft() end,                      desc = "Delete Buffers to Left" },
    { "<leader>br", function() CloseRight() end,                     desc = "Delete Buffers to Right" },
    { "<leader>bp", function() PickBuffer() end,                     desc = "Pick Buffer" },
    { "<leader>bo", function() CloseOthers() end,                    desc = "Delete Other Buffers" },
    { "<S-h>",      "<Cmd>bprevious<CR>",                           desc = "Previous Buffer" },
    { "<S-l>",      "<Cmd>bnext<CR>",                               desc = "Next Buffer" },
    { "[b",         "<Cmd>bprevious<CR>",                           desc = "Previous Buffer" },
    { "]b",         "<Cmd>bnext<CR>",                               desc = "Next Buffer" },
    { "<leader>1",  function() GoToBuffer(1) end,                    desc = "Go to Buffer 1" },
    { "<leader>2",  function() GoToBuffer(2) end,                    desc = "Go to Buffer 2" },
    { "<leader>3",  function() GoToBuffer(3) end,                    desc = "Go to Buffer 3" },
    { "<leader>4",  function() GoToBuffer(4) end,                    desc = "Go to Buffer 4" },
    { "<leader>5",  function() GoToBuffer(5) end,                    desc = "Go to Buffer 5" },
    { "<leader>6",  function() GoToBuffer(6) end,                    desc = "Go to Buffer 6" },
    { "<leader>7",  function() GoToBuffer(7) end,                    desc = "Go to Buffer 7" },
    { "<leader>8",  function() GoToBuffer(8) end,                    desc = "Go to Buffer 8" },
    { "<leader>9",  function() GoToBuffer(9) end,                    desc = "Go to Buffer 9" },
    -- Dashboard toggle is now handled in snacks-dashboard.lua keymaps
    -- { "<leader>0",  function() ... end, desc = "Go to Dashboard" },
  },
  init = function()
    -- Colors
    local colors = {
      crust = "#11111b", mantle = "#181825",
      host_b = "#b3b5fb", host_f = "#4a4b87",
      user_b = "#f8bbe5", user_f = "#874c80",
      dir_b  = "#e1bff2", dir_f  = "#844189",
      git_b  = "#f6b3b3", git_f  = "#d95353",
      venv_b = "#a8ddf9", venv_f = "#0066a4",
      bat_b  = "#b3b5fb", bat_f  = "#4a4b87",
      date_b = "#f8bbe5", date_f = "#874c80",
      time_b = "#e1bff2", time_f = "#844189",
    }

    -- Highlights
    local function define_highlights()
      vim.api.nvim_set_hl(0, 'ComfyFill', { bg = colors.crust, fg = colors.mantle })
      local function set_pair(name, bg, fg)
        vim.api.nvim_set_hl(0, 'Comfy'..name,            { bg = bg, fg = fg })
        vim.api.nvim_set_hl(0, 'Comfy'..name..'Selected',{ bg = bg, fg = fg, bold = true })
        vim.api.nvim_set_hl(0, 'Comfy'..name..'Arrow',   { fg = bg, bg = colors.crust })
      end
      set_pair('Host', colors.host_b, colors.host_f)
      set_pair('User', colors.user_b, colors.user_f)
      set_pair('Dir',  colors.dir_b,  colors.dir_f)
      set_pair('Git',  colors.git_b,  colors.git_f)
      set_pair('Venv', colors.venv_b, colors.venv_f)
      set_pair('Bat',  colors.bat_b,  colors.bat_f)
      set_pair('Date', colors.date_b, colors.date_f)
      set_pair('Time', colors.time_b, colors.time_f)
      -- Logo style (reuse Host palette)
      vim.api.nvim_set_hl(0, 'ComfyLogo',       { bg = colors.host_b, fg = colors.host_f })
      vim.api.nvim_set_hl(0, 'ComfyLogoArrow',  { fg = colors.host_b, bg = colors.crust })
    end
    define_highlights()

    -- Separators
    local sep_rev = '' -- left rounded
    local sep     = '' -- right rounded

    local color_cycle = { 'Host', 'User', 'Dir', 'Git', 'Venv' }
    local sort_mode = nil

    -- Debounced redraw helper to avoid UI thrash
    local redraw_pending = false
    local function request_redraw()
      if redraw_pending then return end
      redraw_pending = true
      vim.defer_fn(function()
        redraw_pending = false
        if vim.bo.filetype ~= 'snacks_dashboard' and vim.bo.filetype ~= 'dashboard' then
          pcall(vim.cmd, 'redrawtabline')
        end
      end, 60)
    end

    local function get_listed_buffers()
      local bufs = vim.fn.getbufinfo({ buflisted = 1 })
      local out = {}
      for _, b in ipairs(bufs) do
        local bt = vim.api.nvim_buf_get_option(b.bufnr, 'buftype')
        local ft = vim.api.nvim_buf_get_option(b.bufnr, 'filetype')
        if bt == '' and ft ~= 'snacks_dashboard' and ft ~= 'dashboard' and ft ~= 'qf' and ft ~= 'help' and ft ~= 'gitcommit' then
          table.insert(out, b)
        end
      end
      if sort_mode == 'directory' then
        table.sort(out, function(a,b) return vim.fn.fnamemodify(a.name, ':h') < vim.fn.fnamemodify(b.name, ':h') end)
      elseif sort_mode == 'extension' then
        table.sort(out, function(a,b) return vim.fn.fnamemodify(a.name, ':e') < vim.fn.fnamemodify(b.name, ':e') end)
      elseif sort_mode == 'relative' then
        table.sort(out, function(a,b) return vim.fn.fnamemodify(a.name, ':.') < vim.fn.fnamemodify(b.name, ':.') end)
      end
      return out
    end

    local function close_buffer_action(bufnr, force)
      local listed = get_listed_buffers()
      if #listed <= 1 then
        vim.cmd((force and 'bdelete! ' or 'bdelete ') .. bufnr)
        vim.schedule(function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks.dashboard then
            snacks.dashboard()
          end
        end)
      else
        vim.cmd((force and 'bdelete! ' or 'bdelete ') .. bufnr)
      end
    end

    function CloseBuffer(bufnr)
      if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then return end
      local modified = vim.api.nvim_buf_get_option(bufnr, 'modified')
      if modified then
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':t')
        if filename == '' then filename = '[No Name]' end
        vim.ui.select({ 'Save and close', 'Close without saving', 'Cancel' }, {
          prompt = '"'..filename..'" has unsaved changes:',
          format_item = function(item)
            if item == 'Save and close' then return '💾 '..item
            elseif item == 'Close without saving' then return '🗑️  '..item
            else return '❌ '..item end
          end,
        }, function(choice)
          if choice == 'Save and close' then
            vim.cmd('w')
            close_buffer_action(bufnr, false)
          elseif choice == 'Close without saving' then
            close_buffer_action(bufnr, true)
          end
        end)
      else
        close_buffer_action(bufnr, false)
      end
    end

    function CloseAllButCurrent()
      request_redraw()
      local curr = vim.api.nvim_get_current_buf()
      for _, b in ipairs(get_listed_buffers()) do
        if b.bufnr ~= curr then vim.cmd('bdelete '..b.bufnr) end
      end
    end

    function CloseOthers()
      request_redraw()
      local curr = vim.api.nvim_get_current_buf()
      for _, b in ipairs(get_listed_buffers()) do
        if b.bufnr ~= curr then CloseBuffer(b.bufnr) end
      end
    end

    function CloseLeft()
      request_redraw()
      local listed = get_listed_buffers()
      local curr = vim.api.nvim_get_current_buf()
      local idx = 0
      for i, b in ipairs(listed) do if b.bufnr == curr then idx = i; break end end
      for i = 1, idx - 1 do CloseBuffer(listed[i].bufnr) end
    end

    function CloseRight()
      request_redraw()
      local listed = get_listed_buffers()
      local curr = vim.api.nvim_get_current_buf()
      local idx = 0
      for i, b in ipairs(listed) do if b.bufnr == curr then idx = i; break end end
      for i = idx + 1, #listed do CloseBuffer(listed[i].bufnr) end
    end

    function GoToBuffer(n)
      local listed = get_listed_buffers()
      if n <= #listed then vim.api.nvim_set_current_buf(listed[n].bufnr) end
      request_redraw()
    end

    -- Buffer picker overlay
    function PickBuffer()
      local listed = get_listed_buffers()
      if #listed == 0 then return end
      local labels = "asdfghjkl;qweruiopzxcvbn m"
      local label_list = {}
      for i = 1, #labels do label_list[i] = labels:sub(i, i) end
      if #listed > #label_list then
        vim.notify("Too many buffers to pick", vim.log.levels.WARN)
        return
      end
      local label_map = {}
      _G.ComfyPickTabline = function()
        local s = ''
        for i, b in ipairs(listed) do
          local label = label_list[i]
          label_map[label] = b.bufnr
          local cname = color_cycle[((i - 1) % #color_cycle) + 1]
          local ahl = 'Comfy'..cname..'Arrow'
          local hl  = 'Comfy'..cname
          s = s .. '%#'..ahl..'#' .. ''
          s = s .. '%#'..hl..'# ' .. label .. ' '
          if i == #listed then s = s .. '%#'..ahl..'#' .. '' end
          s = s .. '%#ComfyFill# '
        end
        s = s .. '%#ComfyFill#%=' .. get_right_string()
        return s
      end
      local old = vim.o.tabline
      vim.o.tabline = '%!v:lua.ComfyPickTabline()'
      vim.cmd('redraw')
      local ch = vim.fn.getcharstr()
      vim.o.tabline = old
      local target = label_map[ch]
      if target then vim.api.nvim_set_current_buf(target) end
      request_redraw()
    end

    -- Cache battery info to avoid shelling out on every redraw
    local _bat_cache, _bat_ts = '', 0
    local function calcbat()
      local now = os.time()
      if now - _bat_ts < 20 then return _bat_cache end
      _bat_ts = now
      local BAT, uname = '', (vim.loop.os_uname().sysname or '')
      if uname == 'Linux' then
        -- Read /sys directly without spawning shells
        local sysfs = '/sys/class/power_supply/'
        local p = io.popen('ls '..sysfs..' 2>/dev/null')
        if p then
          local list = p:read('*a') or ''
          p:close()
          for dir in list:gmatch('([%w%-_]+)\n') do
            if dir:match('^BAT') then
              local capf = io.open(sysfs..dir..'/capacity','r')
              local statf = io.open(sysfs..dir..'/status','r')
              local cap = capf and capf:read('*l') or ''
              if capf then capf:close() end
              local stat = statf and statf:read('*l') or ''
              if statf then statf:close() end
              local icon = ''
              if stat == 'Charging' then icon = '⚡️'
              elseif stat == 'Discharging' then
                local c = tonumber(cap) or 0
                if c > 90 then icon = '󰁹' elseif c < 15 then icon = '󰂃' else icon = '󰁽' end
              elseif stat == 'Full' or stat == 'Unknown' or stat == '' then icon = '󰁹' else icon = '󰁹' end
              BAT = BAT .. (cap or '') .. '% ' .. icon .. ' '
            end
          end
        end
      elseif uname == 'Darwin' then
        local h = io.popen('pmset -g batt')
        local r = h and h:read('*a') or ''
        if h then h:close() end
        local cap = r:match('(%d+)%%') or ''
        local icon = r:match('charged') and '󰁹' or (r:match('AC Power') and '⚡️' or '󰁽')
        BAT = cap .. '% ' .. icon
      end
      _bat_cache = BAT
      return BAT
    end

    local function get_right_string()
      -- User requested: no right-side segments (battery/date/time/workspace)
      return ''
    end

    local function comfy_tabline()
      local s = ''
      local listed = get_listed_buffers()
      local current_buf = vim.api.nvim_get_current_buf()
      -- Left logo bubble (Arch or Vim icon)
      local logo = ''  -- Arch Linux icon; change to '' for Vim
      s = s .. '%#ComfyLogoArrow#' .. sep_rev .. '%#ComfyLogo#  ' .. logo .. '  ' .. '%#ComfyLogoArrow#' .. sep .. '%#ComfyFill# '
      -- Buffers
      for i, b in ipairs(listed) do
        local selected = (b.bufnr == current_buf)
        local cname = color_cycle[((i - 1) % #color_cycle) + 1]
        local hl = 'Comfy'..cname..(selected and 'Selected' or '')
        local ahl = 'Comfy'..cname..'Arrow'
        s = s .. '%#'..ahl..'#'..sep_rev
        s = s .. '%' .. b.bufnr .. '@v:lua.SwitchBuf@'
        -- Icon and name
        s = s .. '%#'..hl..'#'
        local icon = ''
        local ok_dev, dev = pcall(require, 'nvim-web-devicons')
        if ok_dev then
          local name = vim.fn.fnamemodify(b.name, ':t')
          local ext  = vim.fn.fnamemodify(b.name, ':e')
          icon = (dev.get_icon(name, ext, { default = true })) or ''
        end
        s = s .. ' ' .. icon
        local name = vim.fn.fnamemodify(b.name, ':t'); if name == '' then name = '[No Name]' end
        s = s .. ' ' .. name
        if b.changed == 1 then s = s .. ' ●' end
        -- Keep diagnostics off the buffer capsule to reduce clutter
        s = s .. ' %' .. b.bufnr .. '@v:lua.CloseBuf@%T'
        s = s .. ' %T'
        s = s .. '%#'..ahl..'#'..sep .. '%#ComfyFill# '
      end
      s = s .. '%#ComfyFill#%=' .. get_right_string()
      return s
    end

    -- Click handlers
    _G.SwitchBuf = function(minwid, _c, _b, _m)
      if type(minwid) == 'number' then vim.api.nvim_set_current_buf(minwid) end
    end
    _G.CloseBuf = function(minwid, _c, _b, _m)
      if type(minwid) == 'number' then CloseBuffer(minwid) end
    end
    _G.ComfyTabline = comfy_tabline

    vim.o.tabline = '%!v:lua.ComfyTabline()'
    vim.o.showtabline = 2

    vim.api.nvim_create_user_command('BufferLineOrderByDirectory', function() sort_mode = 'directory'; request_redraw() end, {})
    vim.api.nvim_create_user_command('BufferLineOrderByExtension', function() sort_mode = 'extension'; request_redraw() end, {})
    vim.api.nvim_create_user_command('BufferLineOrderByRelativeDirectory', function() sort_mode = 'relative'; request_redraw() end, {})

    -- Reapply our Comfy highlight groups after any colorscheme change
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        define_highlights()
        request_redraw()
      end,
    })

    -- Always show tabline except on dashboard
    vim.o.showtabline = 2  -- Always show by default
    
    vim.api.nvim_create_autocmd('FileType', {
      pattern = {'snacks_dashboard', 'dashboard'},
      callback = function()
        vim.o.showtabline = 0
      end,
    })
    -- Hard-restore tabline when entering any non-dashboard buffer
    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function()
        local ft = vim.bo.filetype
        if ft ~= 'snacks_dashboard' and ft ~= 'dashboard' then
          vim.o.showtabline = 2
        end
      end,
    })
    
    vim.api.nvim_create_autocmd('BufLeave', {
      callback = function()
        local ft = vim.bo.filetype
        if ft == 'snacks_dashboard' or ft == 'dashboard' then
          vim.o.showtabline = 2  -- Restore when leaving dashboard
        end
      end,
    })
    vim.api.nvim_create_autocmd({ 'WinEnter', 'TabEnter', 'BufEnter', 'BufAdd', 'BufDelete', 'BufWritePost', 'VimResized' }, {
      callback = function()
        request_redraw()
      end,
    })

    -- Diagnostics change can be very chatty; debounce separately
    vim.api.nvim_create_autocmd('DiagnosticChanged', {
      callback = function()
        request_redraw()
      end,
    })

  end,
}

