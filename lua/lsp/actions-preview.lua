return {
  "aznhe21/actions-preview.nvim",
  event = "LspAttach",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { "<leader>cA", function() require("actions-preview").code_actions() end, desc = "Code Action (Preview)" },
  },
  opts = function()
    local ok, themes = pcall(require, "telescope.themes")
    return { telescope = ok and themes.get_dropdown({}) or nil }
  end,
}
