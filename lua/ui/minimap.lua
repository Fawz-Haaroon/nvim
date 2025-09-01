-- ═══════════════════════════════════════════════════════════════════════════════
--  🗺️ MINIMAP - Code overview
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "gorbit99/codewindow.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    local ok, codewindow = pcall(require, "codewindow")
    if not ok then return end
    codewindow.setup({
      auto_enable = false,
      exclude_filetypes = { "neo-tree", "alpha", "oil", "dashboard", "help" },
      z_index = 30,
      width = 20,
      minimap_width = 10,
      screen_bounds = "background",
      use_treesitter = true,
    })

    -- Provide a familiar command name
    vim.api.nvim_create_user_command("MinimapToggle", function()
      codewindow.toggle_minimap()
    end, { desc = "Toggle minimap" })

    vim.api.nvim_create_user_command("MinimapOpen", function()
      codewindow.open_minimap()
    end, {})

    vim.api.nvim_create_user_command("MinimapClose", function()
      codewindow.close_minimap()
    end, {})
  end,
}
