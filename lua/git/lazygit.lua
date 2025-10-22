-- ═══════════════════════════════════════════════════════════════════════════════
--  🦥 LAZYGIT - Terminal Git UI
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>glg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>glc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
        { "<leader>glf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Filter" },
    },
    config = function()
        -- LazyGit uses your system's lazygit installation
        -- Install with: sudo pacman -S lazygit (Arch)
        -- Or: https://github.com/jesseduffield/lazygit#installation
        
        vim.g.lazygit_floating_window_winblend = 0
        vim.g.lazygit_floating_window_scaling_factor = 0.9
        vim.g.lazygit_floating_window_border_chars = {'─','│','─','│','╭','╮','╯','╰'}
        vim.g.lazygit_floating_window_use_plenary = 0
        vim.g.lazygit_use_neovim_remote = 1
        vim.g.lazygit_use_custom_config_file_path = 0
    end,
}
