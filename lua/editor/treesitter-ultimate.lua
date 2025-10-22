-- ═══════════════════════════════════════════════════════════════════════════════
--  🌳 ULTIMATE TREESITTER - Complete Syntax Highlighting
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "nvim-treesitter/nvim-treesitter-context",
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    opts = {
        -- 🎯 Language parsers installation
        ensure_installed = {
            -- 🌐 Web Technologies  
            "javascript", "typescript", "tsx",
            "html", "css", "scss",
            "vue", "svelte",
            "json", "jsonc", 
            "yaml", "toml",
            "xml",
            
            -- 🐍 Python & Data
            "python",
            "sql",
            
            -- ⚡ Systems Programming
            "rust", "c", "cpp", "zig",
            "go", "gomod",
            
            -- ☕ JVM Languages
            "java", "kotlin", "scala",
            
            -- 🎯 .NET
            "c_sharp",
            
            -- 💎 Scripting
            "ruby", "lua", "vim", "vimdoc",
            "php",
            
            -- 🐚 Shell & System
            "bash", "fish",
            "dockerfile", "make", "cmake",
            
            -- 🎨 Markup & Documentation
            "markdown", "markdown_inline",
            "rst", "latex", "bibtex",
            
            -- 📊 Data Formats
            "csv",
            "graphql",
            
            -- 🔧 Configuration
            "ini",
            "gitignore", "gitcommit",
            
            -- ☁️ Infrastructure & DevOps
            "terraform", "hcl",
            
            -- 🎮 Graphics/Shaders
            "glsl", "wgsl",
            
            -- 📱 Mobile
            "dart", "swift",
            
            -- 🧠 Functional Languages
            "haskell", "ocaml", "elm", "elixir", "erlang",
            "clojure", "scheme",
            
            -- 🔬 Scientific Computing
            "julia", "fortran",
            
            -- 🎪 Misc Languages
            "regex", "diff",
        },
        
        -- 🎨 Syntax highlighting
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        
        -- 🔄 Incremental selection
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = "<C-s>",
                node_decremental = "<M-space>",
            },
        },
        
        -- 🔤 Smart indentation
        indent = {
            enable = true,
            disable = { "yaml", "python" }, -- These have special indentation rules
        },
        
        -- 🎯 Text objects for better navigation
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- Functions
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    -- Classes
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    -- Parameters
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                    -- Blocks
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    -- Conditionals
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    -- Loops
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    -- Comments
                    ["aC"] = "@comment.outer",
                    ["iC"] = "@comment.inner",
                },
            },
            
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]c"] = "@class.outer",
                    ["]o"] = "@loop.*",
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]C"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[[c"] = "@class.outer",
                    ["[o"] = "@loop.*",
                    ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
                    ["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[C"] = "@class.outer",
                },
            },
        },
        
        -- 🔄 Automatic tag closing/renaming
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
            filetypes = {
                "html", "javascript", "typescript", "javascriptreact", "typescriptreact",
                "svelte", "vue", "tsx", "jsx", "rescript",
                "xml", "php", "markdown", "astro", "glimmer", "handlebars", "hbs"
            },
        },
        
        -- 💬 Context-aware commenting
        context_commentstring = {
            enable = true,
            enable_autocmd = false, -- Let Comment.nvim handle this
        },
        
        -- 🎮 Playground for debugging
        -- playground intentionally disabled to avoid early-load errors
        playground = {
            enable = false,
        },
        
        -- 📍 Context display
        context = {
            enable = true,
            max_lines = 3,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 1,
            trim_scope = 'outer',
            mode = 'cursor',
            separator = nil,
            zindex = 20,
            on_attach = function(buf)
                return vim.api.nvim_buf_line_count(buf) < 10000
            end,
        },
    },
    
    config = function(_, opts)
        local ok_configs, configs = pcall(require, "nvim-treesitter.configs")
        if not ok_configs then
            vim.schedule(function()
                vim.notify("Treesitter not yet available; skipping setup.", vim.log.levels.WARN, { title = "🌳 Treesitter" })
            end)
            return
        end
        configs.setup(opts)
        
        -- Setup additional plugins (guarded)
        pcall(function() require("nvim-ts-autotag").setup({}) end)
        pcall(function() require("treesitter-context").setup(opts.context) end)
        pcall(function() require("ts_context_commentstring").setup(opts.context_commentstring) end)
        
        -- 🎨 Enhanced folding with treesitter
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false -- Start with folds open
        vim.opt.foldlevel = 99
        
        -- 📱 Additional filetypes for mobile development
        vim.filetype.add({
            extension = {
                dart = "dart",
                kt = "kotlin",
                kts = "kotlin",
                swift = "swift",
            },
            pattern = {
                [".*%.blade%.php"] = "blade",
                ["Dockerfile.*"] = "dockerfile",
                ["docker-compose.*%.ya?ml"] = "yaml.docker-compose",
            },
        })
        
        -- Silent load: notify only on error
    end,
}
