-- ═══════════════════════════════════════════════════════════════════════════════
--  🌈 LEXITRON CUSTOM COLORSCHEME - Ultra Personalized Theme
-- ═══════════════════════════════════════════════════════════════════════════════

-- Reset colors
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

-- Set theme name
vim.g.colors_name = "lexitron"

-- Color palette inspired by your aesthetic preferences
local colors = {
    -- Base colors
    bg = "#1a1a2e",
    fg = "#eee6ff",
    
    -- Ultra vibrant accents
    purple = "#bb9af7",
    blue = "#7aa2f7", 
    cyan = "#7dcfff",
    green = "#9ece6a",
    yellow = "#e0af68",
    orange = "#ff9e64",
    red = "#f7768e",
    pink = "#ff7a93",
    
    -- UI colors
    gray = "#565f89",
    dark_gray = "#414868",
    light_gray = "#c0caf5",
}

-- Apply highlight groups
local function highlight(group, color)
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""
    
    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp
    vim.cmd(hl)
end

-- Editor highlights
highlight("Normal", { fg = colors.fg, bg = colors.bg })
highlight("Comment", { fg = colors.gray, style = "italic" })
highlight("Keyword", { fg = colors.purple, style = "bold" })
highlight("String", { fg = colors.green, style = "italic" })
highlight("Function", { fg = colors.blue, style = "bold" })
highlight("Type", { fg = colors.yellow, style = "bold" })
highlight("Number", { fg = colors.orange, style = "bold" })
highlight("Boolean", { fg = colors.orange, style = "bold" })
highlight("Operator", { fg = colors.cyan, style = "bold" })

-- UI highlights
highlight("CursorLine", { bg = "#2a2a3e" })
highlight("Visual", { bg = "#3e3e5e", style = "bold" })
highlight("Search", { bg = colors.yellow, fg = colors.bg, style = "bold" })
highlight("LineNr", { fg = colors.dark_gray })
highlight("CursorLineNr", { fg = colors.purple, style = "bold" })

-- This is a template - the main theme is still Catppuccin
vim.notify("🎨 Lexitron custom theme template loaded", vim.log.levels.INFO)
