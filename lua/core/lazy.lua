-- ═══════════════════════════════════════════════════════════════════════════════
--  📦 LAZY.NVIM - Ultimate Plugin Manager Bootstrap
-- ═══════════════════════════════════════════════════════════════════════════════

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim if not installed
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- ⚡ Ultimate Performance Settings
vim.loader.enable() -- Enable native module loader (Neovim 0.9+)

    -- 🎯 Plugin Categories (Professional Organization)
local plugin_categories = {
    -- 🎨 UI & Theming (Load First - Highest Priority)
    "ui.tokyo-enhanced", -- 🌙 Enhanced Tokyo Night Storm (Default)
    "ui.themes",
    "ui.themes-enhanced", -- 🌈 Additional vibrant & glowing themes
    "ui.which-key",
    "ui.devicons",
    "ui.snacks-dashboard",
    "ui.lualine",
    "ui.comfy-tabline",
    "ui.indent-blankline",
    "ui.noice",
    "ui.notify",
    "ui.dressing",
    "ui.rainbow-delimiters",
    "ui.colorizer",
    "ui.image",
    "ui.markdown-preview",
    "ui.minimap",
    "ui.zen-mode",
    "ui.folds",
    
    -- ⚡ Core Functionality (High Priority)
    "completion.blink-enhanced",
    "completion.copilot",
    "editor.treesitter-ultimate",
    "editor.autopairs",
    "editor.surround",
    "editor.comment",
    "editor.formatting",
    
    -- 🧭 Navigation (High Priority) 
    "navigation.telescope-fixed",
    "navigation.harpoon",
    "navigation.flash",
    "navigation.neo-tree-enhanced",
    "navigation.oil",
    "navigation.aerial",
    
    -- 🔧 LSP & Development (High Priority)
    "lsp.lspconfig-ultimate",
    "lsp.mason",
    "lsp.trouble",
    "lsp.actions-preview",
    "ui.breadcrumbs",
    
    -- 🌳 Git Integration (Medium Priority)
    "git.lazygit",
    "git.gitsigns", 
    "git.neogit",
    "git.diffview",
    
    -- ✏️ Advanced Editing (Medium Priority)
    "editor.multicursor",
    "editor.refactoring",
    "editor.spectre",
    "editor.dial",
    "editor.todo-comments",
    
    -- 🐞 Debugging (Medium Priority)
    "debugging.dap",
    "debugging.dap-ui",
    "debugging.neotest",
    
    -- 🎯 Utilities (Lower Priority)
    -- NOTE: Plugin configs moved to plugin-specific locations (which-key in plugin folder, etc.)
    
    -- 🍿 SNACKS DASHBOARD ONLY (All other snacks modules DISABLED to prevent conflicts)
    -- "utils.snacks-utilities",      -- DISABLED: Conflicts with dashboard
    -- "utils.snacks-terminal",       -- DISABLED: Conflicts with dashboard
    -- "utils.snacks-advanced",       -- DISABLED: Conflicts with dashboard
    -- "ui.snacks-enhancements",      -- DISABLED: Conflicts with dashboard
    -- "navigation.snacks-picker",    -- DISABLED: Conflicts with dashboard
}

-- 🚀 Lazy.nvim Configuration
require("lazy").setup({
    -- Load plugins from categories
    spec = vim.tbl_map(function(category)
        return { import = category }
    end, plugin_categories),
    
    -- 🎛️ Ultimate Performance Settings
    defaults = {
        lazy = true, -- Make all plugins lazy by default
        version = false, -- Use main branch for latest features
    },
    
    -- 🎨 Beautiful UI
    ui = {
        size = { width = 0.9, height = 0.85 },
        wrap = false,
        border = "rounded",
        backdrop = 60,
        title = " 🚀 Plugin Manager ",
        title_pos = "center",
        pills = true,
        icons = {
            cmd = " ",
            config = "",
            event = " ",
            ft = " ",
            init = " ",
            import = " ",
            keys = " ",
            lazy = "󰒲 ",
            loaded = "●",
            not_loaded = "○",
            plugin = " ",
            runtime = " ",
            require = "󰢱 ",
            source = " ",
            start = " ",
            task = "✔ ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
        browser = nil,
        throttle = 20,
        custom_keys = {
            ["<localleader>d"] = {
                function(plugin)
                    dd(plugin)
                end,
                desc = "Debug plugin",
            },
        },
    },
    
    -- ⚡ Performance Optimizations
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen", 
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    
    -- 📦 Installation Settings
    install = {
        missing = true,
        colorscheme = { "tokyonight-storm", "catppuccin-mocha", "habamax" },
    },
    
    -- 🔍 Checker Settings (Non-intrusive)
    checker = {
        enabled = true,
        notify = false,
        frequency = 3600, -- Check once per hour
        check_pinned = false,
    },
    
    -- 🔄 Change Detection
    change_detection = {
        enabled = true,
        notify = false,
    },
    
    -- 🚨 Error Handling  
    dev = {
        path = "~/projects",
        patterns = {},
        fallback = false,
    },
    
    -- 📊 Profiling
    profiling = {
        loader = false,
        require = false,
    },
})

-- Silent: no success notifications on LazyDone

-- 🔥 Keybindings
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "🚀 Open Lazy.nvim" })
vim.keymap.set("n", "<leader>Lu", "<cmd>Lazy update<cr>", { desc = "🔄 Update plugins" })
vim.keymap.set("n", "<leader>Ls", "<cmd>Lazy sync<cr>", { desc = "🔄 Sync plugins" })
vim.keymap.set("n", "<leader>Lc", "<cmd>Lazy clean<cr>", { desc = "🧹 Clean plugins" })
vim.keymap.set("n", "<leader>Lp", "<cmd>Lazy profile<cr>", { desc = "📊 Profile plugins" })

-- Lazy.nvim configured silently
