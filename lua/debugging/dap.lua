return {
  "mfussenegger/nvim-dap",
  dependencies = { "jay-babu/mason-nvim-dap.nvim" },
  opts = {},
  config = function(_, _)
    local mason_dap = require("mason-nvim-dap")
    mason_dap.setup({
      ensure_installed = { "python", "codelldb", "delve", "js" },
      automatic_installation = true,
      handlers = {},
    })
  end,
}
