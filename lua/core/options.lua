-- ═══════════════════════════════════════════════════════════════════════════════
--  ⚙️ CORE OPTIONS - Ultimate IDE Settings
-- ═══════════════════════════════════════════════════════════════════════════════

local opt = vim.opt
local g = vim.g

-- 🔑 Leader Keys (set early)
g.mapleader = " "
g.maplocalleader = "\\"

-- 🎨 Ultimate Visual Experience
opt.termguicolors = true           -- 24-bit RGB colors
opt.background = "dark"            -- Dark theme
opt.signcolumn = "yes:2"           -- Always show signcolumn (2 chars wide)
opt.number = true                  -- Line numbers
opt.relativenumber = true          -- Relative line numbers
opt.numberwidth = 4                -- Width of number column
opt.cursorline = true              -- Highlight cursor line
opt.cursorlineopt = "both"         -- Highlight both line and number
opt.colorcolumn = "100"            -- Highlight column at 100 chars
opt.conceallevel = 0               -- Don't conceal characters
opt.cmdheight = 0                  -- Hide command line when not used
opt.pumheight = 15                 -- Max items in popup menu
opt.pumwidth = 30                  -- Min width of popup menu
opt.pumblend = 10                  -- Popup transparency
opt.winblend = 0                   -- Window transparency
opt.showmode = false               -- Don't show mode (in statusline)
opt.showcmd = false                -- Don't show partial commands
opt.ruler = false                  -- Don't show ruler (in statusline)
opt.laststatus = 3                 -- Global statusline

-- 📏 Indentation & Formatting
local indent_size = 4
opt.tabstop = indent_size          -- Tab width
opt.shiftwidth = indent_size       -- Indent width
opt.softtabstop = indent_size      -- Soft tab width
opt.expandtab = true               -- Use spaces instead of tabs
opt.smartindent = true             -- Smart indentation
opt.autoindent = true              -- Auto indentation
opt.shiftround = true              -- Round indent to shiftwidth
opt.smarttab = true                -- Smart tab behavior

-- 🔍 Search & Replace
opt.ignorecase = true              -- Ignore case in search
opt.smartcase = true               -- Override ignorecase if uppercase
opt.hlsearch = true                -- Highlight search results
opt.incsearch = true               -- Incremental search
opt.wrapscan = true                -- Search wraps around

-- ⚡ Performance & Behavior  
opt.updatetime = 250               -- CursorHold delay
opt.timeout = true                 -- Enable timeouts
opt.timeoutlen = 500               -- Key sequence timeout
opt.ttimeoutlen = 10               -- Key code timeout
opt.redrawtime = 10000             -- Time to redraw screen
opt.ttyfast = true                 -- Faster terminal
opt.lazyredraw = false             -- Don't redraw during macros (disabled for better UX)
opt.synmaxcol = 1000               -- Max column for syntax highlighting

-- 💾 Files & Persistence
opt.hidden = true                  -- Keep buffers loaded when abandoned (don't auto-close)
opt.autoread = true                -- Auto reload files
opt.autowrite = true               -- Auto save before commands
opt.confirm = true                 -- Confirm before closing unsaved
opt.backup = false                 -- No backup files
opt.writebackup = false            -- No backup before write
opt.swapfile = false               -- No swap files
opt.undofile = true                -- Persistent undo
opt.undolevels = 10000             -- Max undo levels
opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Undo directory

-- 📋 Clipboard & Selection
opt.clipboard = "unnamedplus"      -- Use system clipboard
opt.selection = "exclusive"        -- Selection behavior

-- 🪟 Windows & Splits
opt.splitbelow = true              -- Horizontal splits below
opt.splitright = true              -- Vertical splits right
opt.splitkeep = "cursor"           -- Keep cursor position on split
opt.equalalways = false            -- Don't resize all windows
opt.winminwidth = 10               -- Min window width
opt.winminheight = 1               -- Min window height
opt.winheight = 30                 -- Preferred window height
opt.helpheight = 20                -- Help window height

-- 📜 Scrolling & Movement
opt.scrolloff = 8                  -- Lines above/below cursor
opt.sidescrolloff = 8              -- Columns left/right of cursor
opt.smoothscroll = true            -- Smooth scrolling (Neovim 0.10+)
opt.wrap = false                   -- Don't wrap lines
opt.linebreak = true               -- Break at word boundaries
opt.breakindent = true             -- Preserve indentation on wrap
opt.showbreak = "↪ "              -- Show wrapped line indicator

-- 📝 Editing Behavior
opt.virtualedit = "block"          -- Virtual editing in visual block
opt.inccommand = "split"           -- Live preview for substitution
opt.completeopt = "menu,menuone,noselect,preview" -- Completion options
opt.shortmess:append("c")          -- Don't show completion messages
opt.formatoptions:remove("cro")    -- Don't auto-comment new lines
opt.iskeyword:append("-")          -- Treat dash as part of word

-- 🔤 Characters & Display
opt.list = true                    -- Show invisible characters
opt.listchars = {                  -- Define invisible characters
    tab = "→ ",
    trail = "·",
    nbsp = "␣",
    extends = "❯",
    precedes = "❮",
    eol = "↴",
}

opt.fillchars = {                  -- Characters for UI elements
    eob = " ",                     -- Empty lines at end of buffer
    fold = " ",                    -- Fold fill
    foldopen = "-",                -- Fold open
    foldsep = " ",                 -- Fold separator  
    foldclose = "+",               -- Fold close
    diff = "╱",                    -- Diff fill
    msgsep = "▔",                  -- Message separator
    horiz = "━",                   -- Horizontal separator
    horizup = "┻",                 -- Horizontal up
    horizdown = "┳",               -- Horizontal down
    vert = "┃",                    -- Vertical separator
    vertleft = "┫",                -- Vertical left
    vertright = "┣",               -- Vertical right
    verthoriz = "╋",               -- Vertical horizontal
}

-- 🔗 Folding
opt.foldmethod = "expr"            -- Use expression for folding
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Treesitter folding
opt.foldlevel = 99                 -- Don't fold by default
opt.foldlevelstart = 99            -- Start with folds open
opt.foldenable = true              -- Enable folding
opt.foldcolumn = "1"               -- Show fold column

-- 🌍 Language & Locale
opt.spell = false                  -- Disable spell check by default  
opt.spelllang = "en_us"           -- Spell check language
opt.spellsuggest = "best,9"       -- Spell suggestions

-- 🖱️ Mouse Support
opt.mouse = "a"                    -- Enable mouse in all modes
opt.mousefocus = false             -- Don't focus window on mouse hover
opt.mousescroll = "ver:3,hor:6"   -- Mouse scroll behavior

-- 🔊 Audio & Visual Feedback
opt.errorbells = false             -- No error bells
opt.visualbell = false             -- No visual bell
opt.belloff = "all"               -- Disable all bells

-- 📐 Session Options
opt.sessionoptions = {
    "blank",                       -- Empty windows
    "buffers",                     -- Hidden and unloaded buffers
    "curdir",                      -- Current directory
    "folds",                       -- Folds
    "help",                        -- Help windows
    "tabpages",                    -- Tab pages
    "winsize",                     -- Window sizes
    "winpos",                      -- Window positions
    "terminal",                    -- Terminal windows
    "localoptions",                -- Local options
}

-- 🔍 Search Options
opt.path:append("**")              -- Search down into subfolders
opt.wildmenu = true                -- Command line completion
opt.wildmode = "longest:full,full" -- Completion mode
opt.wildignore:append({
    "*.o", "*.obj", "*.dylib", "*.bin", "*.dll", "*.exe",
    "*/.git/*", "*/.svn/*", "*/.DS_Store",
    "*/node_modules/*", "*/target/*", "*/.vscode/*",
    "*.jpg", "*.png", "*.jpeg", "*.gif", "*.ico", "*.pdf",
    "*.pyc", "*.pyo", "*.pyd", "__pycache__",
    "*.class", "*.jar", "*.war", "*.ear"
})

-- 💼 Professional Defaults
opt.title = true                   -- Set window title
opt.titlestring = "%t - Neovim"   -- Title format

-- 🎯 Make everything modifiable by default
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter"}, {
    callback = function()
        -- Ensure buffer is modifiable unless it's a special buffer
        if vim.bo.buftype == "" then
            vim.bo.modifiable = true
        end
    end,
})

-- ✨ Aesthetic improvements
if vim.fn.has("nvim-0.10") == 1 then
    opt.smoothscroll = true        -- Smooth scrolling
    opt.foldtext = ""             -- Use default fold text (better performance)
end
