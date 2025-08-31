return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        plugins = { spelling = true },
        defaults = {},
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>c", group = "code" },
                { "<leader>e", group = "🌳 neo-tree" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git" },
                { "<leader>i", group = "🖼️ image" },
                { "<leader>q", group = "quit/session" },
                { "<leader>s", group = "search" },
                { "<leader>t", group = "toggle" },
                { "<leader>u", group = "ui" },
                { "<leader>x", group = "diagnostics/quickfix" },
                { "[]", group = "prev" },
                { "][]", group = "next" },
                { "g", group = "goto" },
                { "gs", group = "surround" },
            },
        },
    },
}
