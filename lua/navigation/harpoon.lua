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
        { "<C-n>", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
        { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
    },
    config = function()
        require("harpoon"):setup()
    end,
}
