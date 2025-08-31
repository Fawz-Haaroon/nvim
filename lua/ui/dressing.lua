-- ═══════════════════════════════════════════════════════════════════════════════
--  👔 DRESSING - Beautiful UI Select & Input
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
        end
        vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
        end
    end,
    opts = {
        input = {
            enabled = true,
            default_prompt = "Input:",
            trim_prompt = true,
            title_pos = "left",
            insert_only = true,
            start_in_insert = true,
            border = "rounded",
            relative = "cursor",
            prefer_width = 40,
            width = nil,
            max_width = { 140, 0.9 },
            min_width = { 20, 0.2 },
            buf_options = {},
            win_options = {
                wrap = false,
                list = true,
                listchars = "precedes:…,extends:…",
                sidescrolloff = 0,
            },
        },
        select = {
            enabled = true,
            backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
            trim_prompt = true,
            telescope = nil,
        },
    },
}
