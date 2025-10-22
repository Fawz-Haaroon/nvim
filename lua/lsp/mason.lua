-- ═══════════════════════════════════════════════════════════════════════════════
--  🔧 MASON CONFIG - LSP Server Management
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
            border = "rounded",
        },
        max_concurrent_installers = 10,
    },
    config = function(_, opts)
        require("mason").setup(opts)
        
        -- 🚀 Auto-install LSP servers
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                -- 🌐 Web Development
                "ts_ls",
                "eslint",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                
                -- 🐍 Python (minimal setup)
                "pyright",
                -- "ruff", -- DISABLED: Style warnings
                
                -- ⚡ Rust
                "rust_analyzer",
                
                -- 🔵 Go
                "gopls",
                
                -- ☕ Java
                "jdtls",
                
                -- 🧊 C/C++
                "clangd",
                
                -- 🎯 C#
                "omnisharp",
                
                -- 💎 Ruby
                "solargraph",
                
                -- 🔥 Lua
                "lua_ls",
                
                -- 🐘 PHP
                "phpactor",
                
                -- ⚛️ Framework-specific
                "svelte",
                
                -- 📊 Data & Config
                "jsonls",
                "yamlls",
                
                -- 📝 Markup & Documentation
                "marksman",
                
                -- 🐳 DevOps & Infrastructure
                "dockerls",
                "bashls",
                "terraformls",
            },
            automatic_installation = true,
        })
        
        -- 🛠️ Auto-install additional tools
        local mason_tool_installer = require("mason-tool-installer")
        mason_tool_installer.setup({
            ensure_installed = {
                -- 🎨 Formatters (minimal Python)
                "prettier",
                -- "black", -- DISABLED: Style conflicts
                -- "isort", -- DISABLED: Style conflicts 
                "rustfmt",
                "gofumpt",
                "goimports",
                "stylua",
                "shfmt",
                
                -- 🔍 Linters (minimal Python linting)
                "eslint_d",
                -- "flake8", -- DISABLED: Style warnings  
                -- "pylint", -- DISABLED: Style warnings
                "shellcheck",
                "hadolint",
                "markdownlint",
                "yamllint",
                
                -- 🐛 Debuggers
                "debugpy",
                "codelldb",
                "delve",
                "js-debug-adapter",
            },
            auto_update = false,
            run_on_start = true,
        })
        
        -- Silent load: notify only on error
    end,
}
