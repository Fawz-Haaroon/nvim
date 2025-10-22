-- ═══════════════════════════════════════════════════════════════════════════════
--  🪟 TRANSPARENCY TOGGLE - Glassmorphic Neovim (runtime toggle)
-- ═══════════════════════════════════════════════════════════════════════════════

local M = {}

local state = {
  enabled = false,
  orig = {
    winblend = nil,
    pumblend = nil,
  },
}

-- Highlight groups to make transparent when enabled
local transparent_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "LineNr",
  "CursorLine",
  "CursorLineNr",
  "EndOfBuffer",
  "FoldColumn",
  "VertSplit",
  "WinSeparator",
  -- Floating and popups
  "NormalFloat",
  "FloatBorder",
  "FloatTitle",
  "Pmenu",
  "PmenuSel",
  "PmenuSbar",
  "PmenuThumb",
  -- Popular plugin UIs
  "TelescopeNormal",
  "TelescopeBorder",
  "TelescopePromptNormal",
  "TelescopePromptBorder",
  "WhichKeyFloat",
  "WhichKeyBorder",
  "BufferLineFill",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeEndOfBuffer",
  "NoiceCmdlinePopup",
  "NoiceCmdlinePopupBorder",
}

local function set_bg_none()
  for _, group in ipairs(transparent_groups) do
    pcall(vim.api.nvim_set_hl, 0, group, { bg = "none" })
  end
end

-- Return a stable, low-contrast separator color (same vibe as your screenshot 1)
local function get_separator_fg()
  local ok, palettes = pcall(require, "catppuccin.palettes")
  if ok and palettes and palettes.get_palette then
    local p = palettes.get_palette("mocha")
    if p and p.surface1 then
      return p.surface1 -- typically #45475a
    end
  end
  return "#45475a" -- safe fallback if palette is unavailable
end

local function apply_transparent_overrides()
  set_bg_none()
  local sep = get_separator_fg()
  -- Catppuccin palette (when available) for consistent greys
  local p
  do
    local ok, palettes = pcall(require, "catppuccin.palettes")
    if ok and palettes and palettes.get_palette then
      p = palettes.get_palette("mocha")
    end
  end
  local ln_fg  = (p and p.overlay0) or "#6c7086" -- dull grey for line numbers
  local cln_fg = (p and p.overlay1) or "#7f849c" -- slightly brighter for current line number

  -- Keep split lines subtle and consistent across themes
  pcall(vim.api.nvim_set_hl, 0, "WinSeparator", { fg = sep, bg = "none", default = false })
  pcall(vim.api.nvim_set_hl, 0, "VertSplit",    { fg = sep, bg = "none", default = false })

  -- Dull line numbers in transparent mode
  pcall(vim.api.nvim_set_hl, 0, "LineNr",        { fg = ln_fg,  bg = "none", default = false })
  pcall(vim.api.nvim_set_hl, 0, "LineNrAbove",   { fg = ln_fg,  bg = "none", default = false })
  pcall(vim.api.nvim_set_hl, 0, "LineNrBelow",   { fg = ln_fg,  bg = "none", default = false })
  pcall(vim.api.nvim_set_hl, 0, "CursorLineNr",  { fg = cln_fg, bg = "none", bold = true, default = false })

  -- keep floats glassy but not overly bright
  pcall(vim.api.nvim_set_hl, 0, "NormalFloat", { bg = "none" })
  pcall(vim.api.nvim_set_hl, 0, "FloatBorder", { bg = "none", fg = sep })
  pcall(vim.api.nvim_set_hl, 0, "Pmenu",       { bg = "none" })
end

local function catppuccin_setup_transparent(enabled)
  local ok, cat = pcall(require, "catppuccin")
  if not ok or type(cat) ~= "table" or type(cat.setup) ~= "function" then
    return
  end
  -- Reconfigure catppuccin transparency and reapply colorscheme
  -- Note: we only toggle transparency to avoid clobbering the user's full options.
  cat.setup({ transparent_background = enabled })
  pcall(vim.cmd.colorscheme, "catppuccin-mocha")
end

function M.enable()
  if state.enabled then return end
  state.orig.winblend = vim.o.winblend
  state.orig.pumblend = vim.o.pumblend

  -- No blur/fog: keep full opacity for popups
  vim.o.winblend = 0
  vim.o.pumblend = 0

  -- Ask theme to be transparent when possible (only applies if catppuccin is in use)
  catppuccin_setup_transparent(true)

  -- Apply our stable overrides
  apply_transparent_overrides()

  state.enabled = true
  vim.g.nvim_transparency_enabled = true
  -- no success notification
end

function M.disable()
  if not state.enabled then return end

  -- Restore blends (keep crisp)
  if state.orig.winblend ~= nil then vim.o.winblend = state.orig.winblend end
  if state.orig.pumblend ~= nil then vim.o.pumblend = state.orig.pumblend end

  -- Ask theme to remove transparency and reapply highlights
  catppuccin_setup_transparent(false)
  -- Reapply current colorscheme (Tokyonight by default)
  pcall(vim.cmd.colorscheme, "tokyonight-storm")
  do
    local ok_hl, hl = pcall(require, "ui.highlights")
    if ok_hl and type(hl) == "table" and type(hl.setup) == "function" then
      hl.setup()
    end
  end

  state.enabled = false
  vim.g.nvim_transparency_enabled = false
  -- no success notification
end

function M.toggle()
  if state.enabled then
    M.disable()
  else
    M.enable()
  end
end

function M.setup()
  -- Capture initial blends
  state.orig.winblend = vim.o.winblend
  state.orig.pumblend = vim.o.pumblend

  -- Reapply on ColorScheme if still enabled
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("TransparencyReapply", { clear = true }),
    callback = function()
      if state.enabled then
        -- Schedule to run after themes finish tweaking highlights
        vim.schedule(apply_transparent_overrides)
      end
    end,
  })

  -- User command
  vim.api.nvim_create_user_command("NvimTransparencyToggle", function()
    M.toggle()
  end, { desc = "Toggle Neovim UI transparency" })
end

-- Don't load this as a lazy.nvim plugin - it's a utility module
-- It gets loaded manually by other modules that need it
if vim.g._loading_lazy_plugins then
  return {}
end

return M
