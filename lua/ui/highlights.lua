-- ═══════════════════════════════════════════════════════════════════════════════
--  🎨 NEXUS HIGHLIGHTS - Ultra-Modern Curved UI Cohesive Theme
-- ═══════════════════════════════════════════════════════════════════════════════

local M = {}

local function is_transparent()
    return vim.g.nvim_transparency_enabled == true
end

function M.setup()
    local colors = require("catppuccin.palettes").get_palette("mocha")
    
    -- 🌈 Ultra-Modern Curved UI Highlights
    local highlights = {
        -- 📊 Statusline Curved Elements
        StatusLine = { bg = colors.surface0, fg = colors.text },
        StatusLineNC = { bg = colors.surface0, fg = colors.overlay1 },
        
        -- 🗂️ Bufferline Curved Tabs
        BufferLineFill = { bg = colors.crust },
        BufferLineBackground = { bg = colors.crust, fg = colors.overlay0 },
        BufferLineBufferSelected = { 
            bg = colors.base, 
            fg = colors.lavender, 
            bold = true,
            italic = false 
        },
        BufferLineBufferVisible = { bg = colors.mantle, fg = colors.text },
        BufferLineSeparator = { bg = colors.crust, fg = colors.crust },
        BufferLineSeparatorSelected = { bg = colors.crust, fg = colors.crust },
        BufferLineSeparatorVisible = { bg = colors.crust, fg = colors.crust },
        
        -- 🌳 Neo-tree Modern Aesthetics
        NeoTreeNormal = { bg = is_transparent() and "none" or colors.mantle, fg = colors.text },
        NeoTreeNormalNC = { bg = is_transparent() and "none" or colors.mantle, fg = colors.text },
        NeoTreeVertSplit = { bg = colors.mantle, fg = colors.surface0 },
        NeoTreeWinSeparator = { bg = colors.mantle, fg = colors.surface0 },
        NeoTreeEndOfBuffer = { bg = colors.mantle, fg = colors.mantle },
        NeoTreeRootName = { fg = colors.lavender, bold = true },
        NeoTreeDirectoryName = { fg = colors.blue },
        NeoTreeDirectoryIcon = { fg = colors.blue },
        NeoTreeFileNameOpened = { fg = colors.green },
        NeoTreeFloatBorder = { bg = colors.mantle, fg = colors.blue },
        NeoTreeFloatTitle = { bg = colors.mantle, fg = colors.lavender, bold = true },
        NeoTreeTitleBar = { bg = colors.surface0, fg = colors.lavender, bold = true },
        
        -- 🛢️ Oil Directory Editor
        OilDir = { fg = colors.blue, bold = true },
        OilLink = { fg = colors.teal },
        OilSize = { fg = colors.overlay1 },
        OilMtime = { fg = colors.overlay0 },
        OilPermissionRead = { fg = colors.green },
        OilPermissionWrite = { fg = colors.yellow },
        OilPermissionExecute = { fg = colors.red },
        
        -- 🔍 Telescope Modern Curved Borders
        TelescopeNormal = { bg = is_transparent() and "none" or colors.base, fg = colors.text },
        TelescopeBorder = { bg = is_transparent() and "none" or colors.base, fg = colors.blue },
        TelescopePromptNormal = { bg = colors.surface0, fg = colors.text },
        TelescopePromptBorder = { bg = colors.surface0, fg = colors.blue },
        TelescopePromptTitle = { bg = colors.blue, fg = colors.base, bold = true },
        TelescopeResultsTitle = { bg = colors.lavender, fg = colors.base, bold = true },
        TelescopePreviewTitle = { bg = colors.green, fg = colors.base, bold = true },
        TelescopeSelection = { bg = colors.surface1, fg = colors.text },
        TelescopeSelectionCaret = { fg = colors.lavender },
        TelescopeMultiSelection = { bg = colors.surface2, fg = colors.text },
        TelescopeMatching = { fg = colors.peach, bold = true },
        
        -- 🎭 Which-key Modern Popup
        WhichKey = { fg = colors.lavender, bold = true },
        WhichKeyDesc = { fg = colors.text },
        WhichKeyGroup = { fg = colors.blue },
        WhichKeySeperator = { fg = colors.overlay1 },
        WhichKeyFloat = { bg = colors.mantle },
        WhichKeyBorder = { bg = colors.mantle, fg = colors.blue },
        
        -- ⚡ Notification Modern Styling
        NotifyERRORBorder = { fg = colors.red },
        NotifyWARNBorder = { fg = colors.yellow },
        NotifyINFOBorder = { fg = colors.blue },
        NotifyDEBUGBorder = { fg = colors.overlay1 },
        NotifyTRACEBorder = { fg = colors.lavender },
        NotifyERRORIcon = { fg = colors.red },
        NotifyWARNIcon = { fg = colors.yellow },
        NotifyINFOIcon = { fg = colors.blue },
        NotifyDEBUGIcon = { fg = colors.overlay1 },
        NotifyTRACEIcon = { fg = colors.lavender },
        NotifyERRORTitle = { fg = colors.red, bold = true },
        NotifyWARNTitle = { fg = colors.yellow, bold = true },
        NotifyINFOTitle = { fg = colors.blue, bold = true },
        NotifyDEBUGTitle = { fg = colors.overlay1, bold = true },
        NotifyTRACETitle = { fg = colors.lavender, bold = true },
        
        -- 🌈 Completion Menu Curved Styling
        CmpNormal = { bg = colors.surface0, fg = colors.text },
        CmpBorder = { bg = colors.surface0, fg = colors.blue },
        CmpDocumentation = { bg = colors.mantle, fg = colors.text },
        CmpDocumentationBorder = { bg = colors.mantle, fg = colors.blue },
        CmpItemAbbr = { fg = colors.text },
        CmpItemAbbrMatch = { fg = colors.peach, bold = true },
        CmpItemAbbrMatchFuzzy = { fg = colors.peach, bold = true },
        CmpItemKind = { fg = colors.lavender },
        CmpItemMenu = { fg = colors.overlay1 },
        
        -- 🎯 LSP Curved Borders
        LspInfoBorder = { fg = colors.blue },
        DiagnosticFloatingError = { fg = colors.red },
        DiagnosticFloatingWarn = { fg = colors.yellow },
        DiagnosticFloatingInfo = { fg = colors.blue },
        DiagnosticFloatingHint = { fg = colors.teal },
        
        -- 🍿 Snacks Dashboard Modern Styling
        SnacksDashboardKey = { fg = colors.peach, bold = true },
        SnacksDashboardHeader = { fg = colors.lavender },
        SnacksDashboardHeaderLabel = { fg = colors.blue },
        SnacksDashboardDesc = { fg = colors.green },
        SnacksDashboardIcon = { fg = colors.green },
        SnacksDashboardFooter = { fg = colors.overlay1 },
        SnacksDashboardStats = { fg = colors.blue, bold = true },
        SnacksDashboardStatsText = { fg = colors.text },
        SnacksDashboardWorkspaceHint = { fg = colors.overlay1, italic = true },
        
        -- 🎨 Window Separators (Curved appearance)
        WinSeparator = { fg = colors.surface1 },
        VertSplit = { fg = colors.surface1 },
        
        -- 🌟 Float Window Unified Styling
        FloatBorder = { bg = is_transparent() and "none" or colors.base, fg = colors.blue },
        NormalFloat = { bg = is_transparent() and "none" or colors.base, fg = colors.text },
        
        -- 🔲 Indent Blankline Modern Curved
        IblIndent = { fg = colors.surface1 },
        IblScope = { fg = colors.surface2 },
        
        -- 🎪 Trouble Modern Error List
        TroubleNormal = { bg = colors.base, fg = colors.text },
        TroubleBorder = { bg = colors.base, fg = colors.blue },
        TroubleFile = { fg = colors.lavender, bold = true },
        TroubleSource = { fg = colors.overlay1 },
        TroubleCode = { fg = colors.text },
        TroubleCount = { fg = colors.peach, bold = true },
        
        -- 🚀 Lazy Plugin Manager
        LazyNormal = { bg = is_transparent() and "none" or colors.base, fg = colors.text },
        LazyBorder = { bg = is_transparent() and "none" or colors.base, fg = colors.blue },
        LazyButton = { bg = colors.surface0, fg = colors.text },
        LazyButtonActive = { bg = colors.surface1, fg = colors.lavender, bold = true },
        LazyH1 = { fg = colors.lavender, bold = true },
        LazyH2 = { fg = colors.blue, bold = true },
        LazyProperty = { fg = colors.peach },
        LazyValue = { fg = colors.text },
        LazyUrl = { fg = colors.teal, underline = true },
        LazyCommit = { fg = colors.green },
        LazyReason = { fg = colors.overlay1 },
        
        -- 🎭 Mason Modern Installer
        MasonNormal = { bg = is_transparent() and "none" or colors.base, fg = colors.text },
        MasonBorder = { bg = is_transparent() and "none" or colors.base, fg = colors.blue },
        MasonHeader = { bg = colors.lavender, fg = colors.base, bold = true },
        MasonHeaderSecondary = { bg = colors.blue, fg = colors.base, bold = true },
        MasonHighlight = { fg = colors.peach, bold = true },
        MasonHighlightBlock = { bg = colors.peach, fg = colors.base, bold = true },
        MasonHighlightBlockBold = { bg = colors.peach, fg = colors.base, bold = true },
        MasonMuted = { fg = colors.overlay1 },
        MasonMutedBlock = { bg = colors.surface0, fg = colors.overlay1 },
        
        -- 🎯 Git Signs Modern Styling
        GitSignsAdd = { fg = colors.green },
        GitSignsChange = { fg = colors.yellow },
        GitSignsDelete = { fg = colors.red },
        GitSignsTopdelete = { fg = colors.red },
        GitSignsChangedelete = { fg = colors.yellow },
        GitSignsUntracked = { fg = colors.blue },
        GitSignsAddInline = { bg = colors.green, fg = colors.base },
        GitSignsDeleteInline = { bg = colors.red, fg = colors.base },
        GitSignsChangeInline = { bg = colors.yellow, fg = colors.base },
        
        -- 🌈 TreeSitter Enhanced Context
        TreesitterContext = { bg = colors.surface0 },
        TreesitterContextLineNumber = { bg = colors.surface0, fg = colors.overlay1 },
        TreesitterContextSeparator = { fg = colors.surface2 },
        
        -- 🔥 Custom Curved Borders for All Floats
        CurvedBorder = { fg = colors.blue },
        CurvedBorderBG = { bg = colors.base, fg = colors.blue },
        
        -- 🎨 Enhanced Cursor Line
        CursorLine = { bg = colors.surface0 },
        CursorLineNr = { fg = colors.lavender, bold = true },
        
        -- 💎 Selection and Visual Mode
        Visual = { bg = colors.surface1 },
        VisualNOS = { bg = colors.surface1 },
        
        -- ⚡ Search Modern Highlighting
        Search = { bg = colors.peach, fg = colors.base },
        IncSearch = { bg = colors.red, fg = colors.base },
        CurSearch = { bg = colors.red, fg = colors.base },
        
        -- 🎪 Popup Menu Modern Styling
        Pmenu = { bg = colors.surface0, fg = colors.text },
        PmenuSel = { bg = colors.surface1, fg = colors.lavender, bold = true },
        PmenuSbar = { bg = colors.surface1 },
        PmenuThumb = { bg = colors.overlay0 },
        PmenuBorder = { bg = colors.surface0, fg = colors.blue },
        
        -- 🌟 Tab Line Modern Curved
        TabLine = { bg = colors.crust, fg = colors.overlay1 },
        TabLineFill = { bg = colors.crust },
        TabLineSel = { bg = colors.base, fg = colors.lavender, bold = true },
        
        -- 🎭 Command Line Modern
        MsgArea = { fg = colors.text },
        ModeMsg = { fg = colors.lavender, bold = true },
        MoreMsg = { fg = colors.green },
        ErrorMsg = { fg = colors.red, bold = true },
        WarningMsg = { fg = colors.yellow, bold = true },
    }
    
    -- Apply all highlights
    for name, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, opts)
    end
end

-- Auto-setup highlights
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        M.setup()
    end,
})

-- Setup on load
vim.defer_fn(M.setup, 100)

-- Don't load this as a lazy.nvim plugin - it's a utility module
if vim.g._loading_lazy_plugins then
  return {}
end

return M
