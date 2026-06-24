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
                if type(on_attach) == "function" then
                    pcall(on_attach, client, bufnr)
                end
                local ok, navic = pcall(require, "nvim-navic")
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
                    filetypes = {
                        "html",
                        "css",
                        "scss",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                    },
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

                -- 🔵 Go (Optional - uncomment if you work with Go)
                -- gopls = {
                --     settings = {
                --         gopls = {
                --             experimentalPostfixCompletions = true,
                --             analyses = {
                --                 unusedparams = true,
                --                 shadow = true,
                --             },
                --             staticcheck = true,
                --             gofumpt = true,
                --         },
                --     },
                -- },

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
        local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), {
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
        })

        -- 🚀 Enhanced on_attach function
        local function on_attach(client, bufnr)
            -- 🚫 Disable LSP formatting for servers where Conform should take priority
            local servers_no_formatting = {
                "ts_ls",
                "eslint",
                "html",
                "cssls",
                "jsonls",
                "yamlls",
                "lua_ls",
                "pyright",
                "gopls",
                "rust_analyzer",
                "clangd",
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
            map("n", "]d", function() vim.diagnostic.jump({ count = 1, severity = { min = vim.diagnostic.severity.WARN } }) end, "Next Diagnostic (≥ Warning)")
            map("n", "[d", function() vim.diagnostic.jump({ count = -1, severity = { min = vim.diagnostic.severity.WARN } }) end, "Prev Diagnostic (≥ Warning)")
            map("n", "]D", function() vim.diagnostic.jump({ count = 1 }) end, "Next Diagnostic (all)")
            map("n", "[D", function() vim.diagnostic.jump({ count = -1 }) end, "Prev Diagnostic (all)")
            map("n", "]e", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, "Next Error")
            map("n", "[e", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, "Prev Error")
            map("n", "]w", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN }) end, "Next Warning")
            map("n", "[w", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN }) end, "Prev Warning")
            map("n", "]h", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.HINT }) end, "Next Hint")
            map("n", "[h", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.HINT }) end, "Prev Hint")
            map("n", "]i", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.INFO }) end, "Next Info")
            map("n", "[i", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.INFO }) end, "Prev Info")

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
        vim.lsp.handlers["textDocument/documentHighlight"] = function() end

        -- 🎯 Global: all diagnostics picker (works from any buffer)
        local function diag_picker(severity, label)
            local opts = { bufnr = nil }
            if severity then
                opts.severity = severity
            end
            require("telescope.builtin").diagnostics(opts)
        end

        vim.keymap.set("n", "<leader>cD", function()
            vim.ui.select(
                { "All", "Errors", "Warnings", "Info", "Hints" },
                { prompt = "Filter diagnostics by severity:" },
                function(choice)
                    if not choice then return end
                    local sev_map = {
                        All      = nil,
                        Errors   = vim.diagnostic.severity.ERROR,
                        Warnings = vim.diagnostic.severity.WARN,
                        Info     = vim.diagnostic.severity.INFO,
                        Hints    = vim.diagnostic.severity.HINT,
                    }
                    diag_picker(sev_map[choice], choice)
                end
            )
        end, { desc = "All Diagnostics — filter by severity (Telescope)" })

        vim.keymap.set("n", "<leader>cDE", function()
            diag_picker(vim.diagnostic.severity.ERROR, "Errors")
        end, { desc = "Diagnostics: Errors only (Telescope)" })

        vim.keymap.set("n", "<leader>cDW", function()
            diag_picker(vim.diagnostic.severity.WARN, "Warnings")
        end, { desc = "Diagnostics: Warnings only (Telescope)" })

        vim.keymap.set("n", "<leader>cDI", function()
            diag_picker(vim.diagnostic.severity.INFO, "Info")
        end, { desc = "Diagnostics: Info only (Telescope)" })

        vim.keymap.set("n", "<leader>cDH", function()
            diag_picker(vim.diagnostic.severity.HINT, "Hints")
        end, { desc = "Diagnostics: Hints only (Telescope)" })

        -- 📋 LSP Keymaps cheatsheet command
        vim.api.nvim_create_user_command("LspKeymaps", function()
            local lines = {
                "╔══════════════════════════════════════════════════════════╗",
                "║              LSP Keymaps Cheatsheet                     ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  🔍 NAVIGATION                                          ║",
                "║  gd   → Go to Definition                                ║",
                "║  gr   → Go to References                                ║",
                "║  gI   → Go to Implementation                            ║",
                "║  gy   → Go to Type Definition                           ║",
                "║  gD   → Go to Declaration                               ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  📚 DOCUMENTATION                                       ║",
                "║  K      → Hover Documentation                           ║",
                "║  gK     → Signature Help                                ║",
                "║  <C-k>  → Signature Help (insert mode)                  ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  🔧 CODE ACTIONS                                        ║",
                "║  <leader>ca  → Code Action (normal + visual)            ║",
                "║  <leader>cc  → Run Codelens                             ║",
                "║  <leader>cC  → Refresh Codelens                         ║",
                "║  <leader>cr  → Rename Symbol                            ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  🎯 DIAGNOSTICS                                         ║",
                "║  <leader>cd   → Line Diagnostics (float)                ║",
                "║  <leader>cD   → All Diagnostics — pick severity first   ║",
                "║  <leader>cDE  → Errors only  (Telescope)                ║",
                "║  <leader>cDW  → Warnings only (Telescope)               ║",
                "║  <leader>cDI  → Info only     (Telescope)               ║",
                "║  <leader>cDH  → Hints only    (Telescope)               ║",
                "║  <leader>cl  → LSP Info                                 ║",
                "║  <leader>cR  → Restart LSP                              ║",
                "║  ]d / [d     → Next/Prev Diagnostic (≥ Warning)         ║",
                "║  ]D / [D     → Next/Prev Diagnostic (all severities)    ║",
                "║  ]e / [e     → Next/Prev Error                          ║",
                "║  ]w / [w     → Next/Prev Warning                        ║",
                "║  ]h / [h     → Next/Prev Hint                           ║",
                "║  ]i / [i     → Next/Prev Info                           ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  🔍 WORKSPACE                                           ║",
                "║  <leader>wa  → Add Workspace Folder                     ║",
                "║  <leader>wr  → Remove Workspace Folder                  ║",
                "║  <leader>wl  → List Workspace Folders                   ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  💅 FORMAT                                              ║",
                "║  <leader>cf  → Format Document / Range                  ║",
                "╠══════════════════════════════════════════════════════════╣",
                "║  💡 INLAY HINTS                                         ║",
                "║  <leader>ch  → Toggle Inlay Hints                       ║",
                "╚══════════════════════════════════════════════════════════╝",
                "  Press q or <Esc> to close",
            }

            local buf = vim.api.nvim_create_buf(false, true)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
            vim.bo[buf].modifiable = false
            vim.bo[buf].filetype = "lsp-keymaps"

            local width = 62
            local height = #lines
            local win = vim.api.nvim_open_win(buf, true, {
                relative = "editor",
                width = width,
                height = height,
                row = math.floor((vim.o.lines - height) / 2),
                col = math.floor((vim.o.columns - width) / 2),
                style = "minimal",
                border = "none",
                title = " LSP Keymaps ",
                title_pos = "center",
            })
            vim.wo[win].cursorline = false

            for _, key in ipairs({ "q", "<Esc>" }) do
                vim.keymap.set("n", key, function()
                    vim.api.nvim_win_close(win, true)
                end, { buffer = buf, nowait = true })
            end

            -- Syntax highlighting (theme-agnostic, links to built-in groups)
            vim.api.nvim_set_hl(0, "LspKeysBorder",        { link = "SpecialComment", default = true })
            vim.api.nvim_set_hl(0, "LspKeysSectionHeader", { link = "Title",          default = true })
            vim.api.nvim_set_hl(0, "LspKeysKey",           { link = "Keyword",        default = true })
            vim.api.nvim_set_hl(0, "LspKeysArrow",         { link = "Comment",        default = true })

            local ns = vim.api.nvim_create_namespace("lsp_keymaps_hl")
            for i, line in ipairs(lines) do
                local lnum = i - 1
                if line:match("^╔") or line:match("^╠") or line:match("^╚") then
                    -- Box borders and section separators → muted accent
                    vim.api.nvim_buf_add_highlight(buf, ns, "LspKeysBorder", lnum, 0, -1)
                elseif line:match("^║") and not line:match("→") then
                    -- Title row and section header rows (emoji + caps) → accent
                    vim.api.nvim_buf_add_highlight(buf, ns, "LspKeysSectionHeader", lnum, 0, -1)
                elseif line:match("→") then
                    -- Keymap entry line: highlight key name and separator arrow separately.
                    -- "║" is 3 UTF-8 bytes; the two spaces that follow add 2 more → key starts at byte 5.
                    local key_part = line:match("^║  (.-)%s+→")
                    if key_part then
                        vim.api.nvim_buf_add_highlight(buf, ns, "LspKeysKey", lnum, 5, 5 + #key_part)
                    end
                    -- "→" (U+2192) is 3 UTF-8 bytes; line:find returns 1-indexed byte offset.
                    local arrow_byte = line:find("→")
                    if arrow_byte then
                        vim.api.nvim_buf_add_highlight(buf, ns, "LspKeysArrow", lnum, arrow_byte - 1, arrow_byte + 2)
                    end
                end
            end
        end, { desc = "Show LSP keymap cheatsheet" })

        -- 🗂️ which-key groups for ] / [ diagnostic jump prefixes
        local ok, wk = pcall(require, "which-key")
        if ok then
            wk.add({
                { "]d", desc = "Next Diagnostic (≥ Warning)" },
                { "[d", desc = "Prev Diagnostic (≥ Warning)" },
                { "]D", desc = "Next Diagnostic (all)" },
                { "[D", desc = "Prev Diagnostic (all)" },
                { "]e", desc = "Next Error" },
                { "[e", desc = "Prev Error" },
                { "]w", desc = "Next Warning" },
                { "[w", desc = "Prev Warning" },
                { "]h", desc = "Next Hint" },
                { "[h", desc = "Prev Hint" },
                { "]i", desc = "Next Info" },
                { "[i", desc = "Prev Info" },
            })
        end

        -- LSP configured silently
    end,
}
