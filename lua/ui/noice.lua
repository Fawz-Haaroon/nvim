-- ═══════════════════════════════════════════════════════════════════════════════
--  🔮 NOICE - Revolutionary UI Experience
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            -- Hide noisy written/yank messages
            {
                filter = { event = "msg_show", any = {
                    { find = "%d+L, %d+B" },
                    { find = "; after #%d+" },
                    { find = "; before #%d+" },
                    { find = "search hit BOTTOM" },
                    { find = "search hit TOP" },
                    { find = "Pattern not found" },
                }},
                view = "mini",
            },
            -- Route warnings and errors to snacks when available
            {
                filter = { 
                    event = "notify",
                    find = "warn",
                },
                opts = { skip = true },
                cond = function()
                    -- Let snacks handle warnings/errors if available
                    return pcall(require, "snacks.notifier")
                end,
            },
            {
                filter = { 
                    event = "notify",
                    find = "error",
                },
                opts = { skip = true },
                cond = function()
                    -- Let snacks handle warnings/errors if available
                    return pcall(require, "snacks.notifier")
                end,
            },
            -- Show LSP progress in mini view
            {
                filter = { event = "lsp", kind = "progress" },
                opts = { skip = false },
            },
            -- Keep important system messages
            {
                filter = { 
                    event = "msg_show",
                    any = {
                        { find = "E%d+:" },
                        { find = "Error" },
                        { find = "Warning" },
                    },
                },
                view = "notify",
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
