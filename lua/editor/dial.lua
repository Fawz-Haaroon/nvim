return {
  "monaqa/dial.nvim",
  event = "VeryLazy",
  config = function()
    local map = require("dial.map")
    vim.keymap.set("n", "<C-a>", map.inc_normal(), { desc = "Increment" })
    vim.keymap.set("n", "<C-x>", map.dec_normal(), { desc = "Decrement" })
    vim.keymap.set("v", "<C-a>", map.inc_visual(), { desc = "Increment" })
    vim.keymap.set("v", "<C-x>", map.dec_visual(), { desc = "Decrement" })
    vim.keymap.set("v", "g<C-a>", map.inc_gvisual(), { desc = "Increment" })
    vim.keymap.set("v", "g<C-x>", map.dec_gvisual(), { desc = "Decrement" })
  end,
}
