-- ═══════════════════════════════════════════════════════════════════════════════
--  📏 INDENT BLANKLINE - Beautiful Indentation Guides
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = {
            show_start = false,
            show_end = false,
        },
        exclude = {
            filetypes = {
                "help",
                "snacks_dashboard",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
        },
    },
}
