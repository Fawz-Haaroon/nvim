return {
  "nvim-pack/nvim-spectre",
  cmd = { "Spectre" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>sr", "<cmd>Spectre<cr>", desc = "Replace in Project" },
    { "<leader>sf", "<cmd>Spectre open_file_search<cr>", desc = "Replace in File" },
    { "<leader>sr", "<esc><cmd>Spectre open_visual<cr>", mode = "v", desc = "Replace Selection" },
  },
  opts = { open_cmd = "vnew" },
}
