-- ═══════════════════════════════════════════════════════════════════════════════
--  ⚡ BLINK ENHANCED - VS Code-like Completion Experience
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        "onsails/lspkind.nvim",
        "folke/lazydev.nvim",
        "moyiz/blink-emoji.nvim",
    },
    opts = function()
        local colors = require("catppuccin.palettes").get_palette("mocha")
        
        return {
            -- 🚀 Enhanced Keymap Configuration
            keymap = {
                preset = "default",
                ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide" },
                ["<C-y>"] = { "accept" },
                ["<Enter>"] = { "accept", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-j>"] = { "snippet_forward", "fallback" },
                ["<C-k>"] = { "snippet_backward", "fallback" },
            },
            
            -- 🎨 Advanced Appearance with Enhanced Icons
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
                kind_icons = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                    Codeium = "󰘦",
                    TabNine = "󰏚",
                    Supermaven = "",
                    Copilot = "",
                    Emmet = "",
                    Emoji = "󰞅",
                    Calc = "󰃬",
                    Spell = "󰓆",
                    Git = "",
                    Path = "",
                    Buffer = "󰈔",
                },
            },
            
            -- ⚙️ Simplified Sources (fix circular dependency)
            sources = {
                default = {
                    "lazydev",
                    "lsp",
                    "omni",
                    "emoji",
                    "snippets",
                    "path",
                    "buffer"
                },
                providers = {
                    lazydev = {
                        name = "lazydev",
                        enabled = true,
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    lsp = {
                        name = "lsp",
                        enabled = true,
                        module = "blink.cmp.sources.lsp",
                        score_offset = 95,
                    },
                    omni = {
                        name = "omni",
                        enabled = function()
                            return vim.bo.omnifunc ~= "v:lua.vim.lsp.omnifunc"
                        end,
                        module = "blink.cmp.sources.complete_func",
                        score_offset = 90,
                        opts = {
                            complete_func = function()
                                return vim.bo.omnifunc
                            end,
                        },
                    },
                    emoji = {
                        name = "emoji",
                        enabled = true,
                        module = "blink-emoji",
                        score_offset = 85,
                        opts = {
                            insert = true,
                        },
                    },
                    snippets = {
                        name = "snippets",
                        enabled = true,
                        module = "blink.cmp.sources.snippets",
                        score_offset = 80,
                        max_items = 15,
                    },
                    path = {
                        name = "path",
                        enabled = true,
                        module = "blink.cmp.sources.path",
                        score_offset = 10,
                        fallbacks = { "snippets", "buffer" },
                        opts = {
                            trailing_slash = true,
                            label_trailing_slash = true,
                            get_cwd = function(context)
                                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
                            end,
                            show_hidden_files_by_default = true,
                        },
                    },
                    buffer = {
                        name = "buffer",
                        enabled = true,
                        module = "blink.cmp.sources.buffer",
                        score_offset = 5,
                        max_items = 5,
                    },
                },
            },
            
            -- 🔥 Advanced Completion Behavior
            completion = {
                accept = {
                    create_undo_point = true,
                    auto_brackets = {
                        enabled = true,
                        default_brackets = { "(", ")" },
                        override_brackets_for_filetypes = {
                            tex = { "{", "}" },
                            lua = { "(", ")" },
                            python = { "(", ")" },
                        },
                        force_allow_filetypes = {},
                        blocked_filetypes = {},
                        kind_resolution = {
                            enabled = true,
                            blocked_filetypes = { "typescriptreact", "javascriptreact", "vue" },
                        },
                        semantic_token_resolution = {
                            enabled = true,
                            blocked_filetypes = {},
                        },
                    },
                },
                menu = {
                    enabled = true,
                    min_width = 20,
                    max_height = 12,
                    border = "rounded",
                    winblend = 10,
                    winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                    scrolloff = 2,
                    scrollbar = true,
                    direction_priority = { "s", "n" },
                    auto_show = true,
                    draw = {
                        treesitter = { "lsp" },
                        columns = { 
                            { "kind_icon", gap = 1 }, 
                            { "label", "label_description", gap = 1 }, 
                            { "source_name" } 
                        },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx) 
                                    return ctx.kind_icon .. ctx.icon_gap 
                                end,
                                highlight = function(ctx) 
                                    return 'BlinkCmpKind' .. ctx.kind 
                                end,
                            },
                            label = {
                                width = { fill = true, max = 60 },
                                text = function(ctx) 
                                    return ctx.label .. (ctx.label_detail or "")
                                end,
                                highlight = function(ctx)
                                    local highlights = {}
                                    if ctx.deprecated then 
                                        table.insert(highlights, { 
                                            0, #ctx.label, 
                                            group = 'BlinkCmpLabelDeprecated' 
                                        }) 
                                    end
                                    return highlights
                                end,
                            },
                            source_name = {
                                width = { max = 30 },
                                text = function(ctx) 
                                    return '[' .. ctx.source_name .. ']' 
                                end,
                                highlight = 'BlinkCmpSource',
                            },
                        }
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 150,
                    update_delay_ms = 50,
                    treesitter_highlighting = true,
                    window = {
                        min_width = 15,
                        max_width = 80,
                        max_height = 20,
                        border = "rounded",
                        winblend = 10,
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:Visual,Search:None",
                        scrollbar = true,
                    },
                },
                ghost_text = {
                    enabled = true,
                },
                trigger = {
                    show_on_keyword = true,
                    show_on_trigger_character = true,
                },
            },
            
            -- 📝 Enhanced Signature Help
            signature = {
                enabled = true,
                trigger = {
                    blocked_trigger_characters = {},
                    blocked_retrigger_characters = {},
                    show_on_insert_on_trigger_character = true,
                },
                window = {
                    min_width = 1,
                    max_width = 120,
                    max_height = 10,
                    border = "rounded",
                    winblend = 10,
                    winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
                    scrollbar = false,
                    direction_priority = { "n", "s" },
                },
            },
            
            -- ⚡ Enhanced Fuzzy Matching
            fuzzy = {
                implementation = "prefer_rust",
                use_proximity = true,
                sorts = { "score", "sort_text" },
                frecency = {
                    enabled = true,
                },
            },
        }
    end,
    
    config = function(_, opts)
        require("blink.cmp").setup(opts)
        
        -- 💡 Enhanced highlights for VS Code-like appearance
        local function setup_enhanced_highlights()
            local colors = require("catppuccin.palettes").get_palette("mocha")
            
            local highlights = {
                -- Menu styling
                BlinkCmpMenu = { bg = colors.surface0, fg = colors.text },
                BlinkCmpMenuBorder = { fg = colors.blue, bg = colors.surface0 },
                BlinkCmpMenuSelection = { bg = colors.surface1, fg = colors.text, bold = true },
                
                -- Documentation styling
                BlinkCmpDoc = { bg = colors.base, fg = colors.text },
                BlinkCmpDocBorder = { fg = colors.blue, bg = colors.base },
                
                -- Signature help styling
                BlinkCmpSignatureHelp = { bg = colors.base, fg = colors.text },
                BlinkCmpSignatureHelpBorder = { fg = colors.green, bg = colors.base },
                
                -- Source and label styling
                BlinkCmpSource = { fg = colors.overlay0 },
                BlinkCmpLabelDeprecated = { fg = colors.red, strikethrough = true },
                
                -- Enhanced kind highlights with vibrant colors
                BlinkCmpKindText = { fg = colors.green },
                BlinkCmpKindMethod = { fg = colors.blue },
                BlinkCmpKindFunction = { fg = colors.blue },
                BlinkCmpKindConstructor = { fg = colors.yellow },
                BlinkCmpKindField = { fg = colors.teal },
                BlinkCmpKindVariable = { fg = colors.text },
                BlinkCmpKindClass = { fg = colors.peach },
                BlinkCmpKindInterface = { fg = colors.pink },
                BlinkCmpKindModule = { fg = colors.mauve },
                BlinkCmpKindProperty = { fg = colors.teal },
                BlinkCmpKindUnit = { fg = colors.green },
                BlinkCmpKindValue = { fg = colors.red },
                BlinkCmpKindEnum = { fg = colors.peach },
                BlinkCmpKindKeyword = { fg = colors.mauve },
                BlinkCmpKindSnippet = { fg = colors.yellow },
                BlinkCmpKindColor = { fg = colors.red },
                BlinkCmpKindFile = { fg = colors.sky },
                BlinkCmpKindReference = { fg = colors.lavender },
                BlinkCmpKindFolder = { fg = colors.sky },
                BlinkCmpKindEnumMember = { fg = colors.peach },
                BlinkCmpKindConstant = { fg = colors.red },
                BlinkCmpKindStruct = { fg = colors.peach },
                BlinkCmpKindEvent = { fg = colors.pink },
                BlinkCmpKindOperator = { fg = colors.text },
                BlinkCmpKindTypeParameter = { fg = colors.teal },
                BlinkCmpKindEmmet = { fg = colors.flamingo },
                BlinkCmpKindEmoji = { fg = colors.yellow },
                BlinkCmpKindCalc = { fg = colors.sky },
                BlinkCmpKindSpell = { fg = colors.green },
                BlinkCmpKindGit = { fg = colors.peach },
                BlinkCmpKindPath = { fg = colors.sky },
                BlinkCmpKindBuffer = { fg = colors.overlay1 },
            }
            
            for name, opts in pairs(highlights) do
                vim.api.nvim_set_hl(0, name, opts)
            end
        end
        
        -- Apply enhanced highlights
        setup_enhanced_highlights()
        
        -- Reapply on colorscheme change
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = setup_enhanced_highlights,
        })
        
        -- Silent load: notify only on error
    end,
}
