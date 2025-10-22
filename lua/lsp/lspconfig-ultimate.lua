-- ═══════════════════════════════════════════════════════════════════════════════
--  🚀 ULTIMATE LSP CONFIG - Complete Language Support
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "b0o/schemastore.nvim", -- JSON schemas
        "saghen/blink.cmp",
    },
    opts = function()
        local colors = require("catppuccin.palettes").get_palette("mocha")
        
        -- Attach breadcrumbs (navic) when available
        local function with_navic_on_attach(on_attach)
            return function(client, bufnr)
                if type(on_attach) == 'function' then pcall(on_attach, client, bufnr) end
                local ok, navic = pcall(require, 'nvim-navic')
                if ok and client.server_capabilities.documentSymbolProvider then
                    pcall(navic.attach, client, bufnr)
                end
            end
        end

        return {
            -- 🎨 Enhanced diagnostics
    -- 🎨 Optimized diagnostics with better debouncing and less visual noise
    diagnostics = {
        underline = false,
        update_in_insert = false,
        virtual_text = false, -- Hide inline diagnostic text
        severity_sort = true,
        float = {
            border = "rounded",
            source = "if_many",
            header = "",
            prefix = "",
            focusable = false,
        },
        signs = false, -- Hide sign column diagnostics
    },
            
            -- 🔧 Ultimate server configurations
            servers = {
                -- 🌐 Web Development
                ts_ls = { -- TypeScript/JavaScript
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "all",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                            },
                            suggest = { completeFunctionCalls = true },
                            preferences = {
                                includeCompletionsWithClassMemberSnippets = true,
                                includeCompletionsWithObjectLiteralMethodSnippets = true,
                                quoteStyle = "auto",
                                importModuleSpecifierPreference = "auto",
                            },
                        },
                        javascript = {
                            suggest = { completeFunctionCalls = true },
                            preferences = {
                                includeCompletionsWithClassMemberSnippets = true,
                                includeCompletionsWithObjectLiteralMethodSnippets = true,
                                quoteStyle = "auto",
                                importModuleSpecifierPreference = "auto",
                            },
                        },
                    },
                },
                eslint = {}, -- ESLint
                html = { -- HTML
                    filetypes = { "html", "templ" },
                },
                cssls = {}, -- CSS
                tailwindcss = { -- Tailwind CSS
                    filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
                },
                emmet_ls = {}, -- Emmet
                
                -- 🐍 Python
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                diagnosticMode = "openFilesOnly", -- Less aggressive
                                useLibraryCodeForTypes = true,
                                typeCheckingMode = "off", -- Disable type checking noise
                                autoImportCompletions = true,
                                diagnosticSeverityOverrides = {
                                    reportUnusedImport = "none",
                                    reportUnusedVariable = "none",
                                    reportUnusedFunction = "none",
                                    reportUnusedClass = "none",
                                    reportUnknownArgumentType = "none",
                                    reportUnknownVariableType = "none",
                                    reportUnknownMemberType = "none",
                                    reportMissingImports = "none",
                                    reportMissingModuleSource = "none",
                                    reportGeneralTypeIssues = "none",
                                },
                            },
                        },
                    },
                },
                -- ruff = {}, -- DISABLED: Too many style warnings
                
                -- ⚡ Rust
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                                loadOutDirsFromCheck = true,
                                runBuildScripts = true,
                            },
                            checkOnSave = {
                                allFeatures = true,
                                command = "clippy",
                                extraArgs = { "--no-deps" },
                            },
                            procMacro = {
                                enable = true,
                                ignored = {
                                    leptos_macro = {
                                        "component",
                                        "server",
                                    },
                                },
                            },
                        },
                    },
                },
                
                -- 🔵 Go
                gopls = {
                    settings = {
                        gopls = {
                            experimentalPostfixCompletions = true,
                            analyses = {
                                unusedparams = true,
                                shadow = true,
                            },
                            staticcheck = true,
                            gofumpt = true,
                        },
                    },
                },
                
                -- ☕ Java
                jdtls = {
                    settings = {
                        java = {
                            eclipse = {
                                downloadSources = true,
                            },
                            configuration = {
                                updateBuildConfiguration = "interactive",
                            },
                            maven = {
                                downloadSources = true,
                            },
                            implementationsCodeLens = {
                                enabled = true,
                            },
                            referencesCodeLens = {
                                enabled = true,
                            },
                            format = {
                                enabled = true,
                            },
                        },
                    },
                },
                
                -- 🧊 C/C++
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                    },
                },
                
                -- 🎯 C#
                omnisharp = {
                    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                },
                
                -- 💎 Ruby
                solargraph = {
                    settings = {
                        solargraph = {
                            diagnostics = true,
                        },
                    },
                },
                
                -- 🔥 Lua
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            codeLens = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
                
                -- 🐘 PHP
                phpactor = {},
                
                -- ⚛️ Framework-specific
                svelte = {}, -- Svelte
                -- volar = { -- Vue.js (disabled: not installed)
                --     filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
                -- },
                
                -- 📊 Data & Config
                jsonls = { -- JSON
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
                yamlls = { -- YAML
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                            schemas = require("schemastore").yaml.schemas(),
                        },
                    },
                },
                
                -- 📝 Markup & Documentation
                marksman = {}, -- Markdown
                
                -- 🐳 DevOps & Infrastructure
                dockerls = {}, -- Docker
                -- docker_compose_language_service = {}, -- removed: not provided by lspconfig/mason
                bashls = {}, -- Bash
                terraformls = {}, -- Terraform
                
                -- 📦 Package managers
                -- nil_ls = {}, -- removed to avoid system nix dependency
                
                -- 🎨 Styling
                stylelint_lsp = { -- Stylelint
                    filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" },
                },
            },
        }
    end,
    
    config = function(_, opts)
        -- 📦 Setup neodev first for Neovim API completion
        require("neodev").setup({})
        
        local lspconfig = require("lspconfig")
        
    -- Load LSP utilities for toggle functionality
        require("lsp.utils").setup()

        -- 🎨 Enhanced LSP UI
        vim.diagnostic.config(opts.diagnostics)

        -- 🎯 Enhanced capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            {
                textDocument = {
                    completion = {
                        completionItem = {
                            documentationFormat = { "markdown", "plaintext" },
                            snippetSupport = true,
                            preselectSupport = true,
                            insertReplaceSupport = true,
                            labelDetailsSupport = true,
                            deprecatedSupport = true,
                            commitCharactersSupport = true,
                            tagSupport = { valueSet = { 1 } },
                            resolveSupport = {
                                properties = {
                                    "documentation",
                                    "detail",
                                    "additionalTextEdits",
                                },
                            },
                        },
                    },
                    foldingRange = {
                        dynamicRegistration = false,
                        lineFoldingOnly = true,
                    },
                },
            }
        )
        
        -- 🚀 Enhanced on_attach function
        local function on_attach(client, bufnr)
            -- 🚫 Disable LSP formatting for servers where Conform should take priority
            local servers_no_formatting = {
                "ts_ls", "eslint", "html", "cssls", "jsonls", "yamlls", 
                "lua_ls", "pyright", "gopls", "rust_analyzer", "clangd"
            }
            
            if vim.tbl_contains(servers_no_formatting, client.name) then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end
            
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
            end
            
            -- 🔍 Navigation
            map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
            map("n", "gr", vim.lsp.buf.references, "Go to References")
            map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
            map("n", "gy", vim.lsp.buf.type_definition, "Go to Type Definition")
            map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
            
            -- 📚 Documentation
            map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
            map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
            map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
            
            -- 🔧 Code Actions
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
            map("n", "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
            map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh Codelens")
            map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
            
            -- 🎯 Diagnostics
            map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
            map("n", "<leader>cl", "<cmd>LspInfo<cr>", "LSP Info")
            map("n", "<leader>cR", "<cmd>LspRestart<cr>", "Restart LSP")
            map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
            map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
            
            -- 🔍 Workspace
            map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
            map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
            map("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, "List Workspace Folders")
            
            -- 💅 Format
            if client.server_capabilities.documentFormattingProvider then
                map("n", "<leader>cf", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format Document")
            end
            
            if client.server_capabilities.documentRangeFormattingProvider then
                map("v", "<leader>cf", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format Range")
            end
            
            -- 💡 Inlay hints (Neovim 0.10+)
            if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                map("n", "<leader>ch", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, "Toggle Inlay Hints")
            end
            
            -- 🎨 Highlight symbol under cursor
            if client.server_capabilities.documentHighlightProvider then
                local highlight_group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = bufnr,
                    group = highlight_group,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = bufnr,
                    group = highlight_group,
                    callback = vim.lsp.buf.clear_references,
                })
            end
            
            -- 🔄 Auto-refresh codelens
            if client.server_capabilities.codeLensProvider then
                vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                    buffer = bufnr,
                    callback = vim.lsp.codelens.refresh,
                })
            end
        end
        
        -- 🚀 Setup all servers
        for server, config in pairs(opts.servers) do
            config = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = on_attach,
            }, config)
            
            lspconfig[server].setup(config)
        end
        
        -- LSP configured silently
    end,
}
