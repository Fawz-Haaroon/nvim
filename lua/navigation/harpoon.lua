return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", function() require("harpoon"):list():append() end, desc = "Harpoon file" },
        { "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
        { "<C-1>", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
        { "<C-2>", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
        { "<C-3>", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
        { "<C-4>", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
        { "<C-n>", function()
            local buf = vim.api.nvim_get_current_buf()
            if vim.bo[buf].buftype == "" and vim.bo[buf].modifiable and vim.bo[buf].modified then pcall(vim.cmd.write) end
            require("harpoon"):list():next()
        end, desc = "Harpoon next" },
        { "<C-p>", function()
            local buf = vim.api.nvim_get_current_buf()
            if vim.bo[buf].buftype == "" and vim.bo[buf].modifiable and vim.bo[buf].modified then pcall(vim.cmd.write) end
            require("harpoon"):list():prev()
        end, desc = "Harpoon prev" },
    },
    config = function()
        require("harpoon"):setup({ settings = { save_on_toggle = true, sync_on_ui_close = true } })
        -- Ensure hidden buffers allowed to avoid E37 on switch
        vim.opt.hidden = true
        vim.opt.confirm = true
    end,
}
