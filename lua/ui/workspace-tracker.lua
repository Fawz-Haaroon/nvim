-- ═══════════════════════════════════════════════════════════════════════════
--  🧭 WORKSPACE TRACKER - small helper for bufferline/tabline components
-- ═══════════════════════════════════════════════════════════════════════════

local M = {}

local cached = ''

local function compute()
  local ok_tabs, total_tabs = pcall(vim.fn.tabpagenr, '$')
  if not ok_tabs then total_tabs = 1 end
  local cur_tab = vim.fn.tabpagenr()
  local wins = 0
  pcall(function() wins = #vim.api.nvim_tabpage_list_wins(0) end)
  cached = string.format('%d/%d • %d', cur_tab, total_tabs, wins)
end

function M.get_bufferline_component()
  return cached or ''
end

function M.setup()
  compute()
  local aug = vim.api.nvim_create_augroup('WorkspaceTracker', { clear = true })
  vim.api.nvim_create_autocmd({ 'TabEnter', 'WinEnter', 'BufEnter' }, {
    group = aug,
    callback = function()
      compute()
    end,
  })
end

return M
