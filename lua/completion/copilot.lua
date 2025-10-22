-- ═══════════════════════════════════════════════════════════════════════════════
--  🤖 COPILOT - AI-powered code completion
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "right", -- top, bottom, left, right
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<M-l>",        -- Alt+l to accept
        accept_word = false,
        accept_line = false,
        next = "<M-]>",          -- Alt+] next suggestion
        prev = "<M-[>",          -- Alt+[ previous suggestion
        dismiss = "<C-]>",       -- Ctrl+] dismiss
      },
    },
    filetypes = {
      ["*"] = true, -- Enable for all file types
    },
    copilot_node_command = "node", -- Node.js version must be > 18.x
    server_opts_overrides = {},
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    
    -- The plugin creates its own :Copilot command
    -- We add convenience commands on top
    
    -- Track global copilot state
    local copilot_enabled = true
    
    -- Toggle Copilot globally (all buffers)
    vim.api.nvim_create_user_command("CopilotToggle", function()
      local suggestion = require("copilot.suggestion")
      if copilot_enabled then
        suggestion.dismiss()
        vim.cmd("Copilot disable")
        copilot_enabled = false
        vim.notify("Copilot OFF", vim.log.levels.WARN)
      else
        vim.cmd("Copilot enable")
        copilot_enabled = true
        vim.notify("Copilot ON", vim.log.levels.INFO)
      end
    end, { desc = "Toggle Copilot ON/OFF globally" })
    
    vim.api.nvim_create_user_command("CopilotStatus", function()
      -- Check if copilot is running
      local status = vim.fn.exists(':Copilot')
      if status > 0 then
        vim.notify("Copilot is loaded. Use :Copilot to see subcommands", vim.log.levels.INFO)
      else
        vim.notify("Copilot is not loaded", vim.log.levels.WARN)
      end
    end, { desc = "Check Copilot status" })
    
    -- Keybindings
    vim.keymap.set("n", "<leader>cp", function()
      vim.cmd("Copilot panel")
    end, { desc = "Copilot Panel" })
    vim.keymap.set("n", "<leader>ct", "<cmd>CopilotToggle<cr>", { desc = "Toggle Copilot ON/OFF" })
    vim.keymap.set("n", "<leader>cs", "<cmd>CopilotStatus<cr>", { desc = "Copilot Status" })
    
    -- URL opener (gx) since netrw is disabled
    vim.keymap.set("n", "gx", function()
      local url = vim.fn.expand("<cfile>")
      if url:match("^https?://") then
        vim.fn.jobstart({"xdg-open", url}, {detach = true})
        vim.notify("Opening: " .. url, vim.log.levels.INFO)
      else
        vim.notify("No URL under cursor", vim.log.levels.WARN)
      end
    end, { desc = "Open URL under cursor" })
    
    -- Highlight for suggestions
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6c7a89", italic = true })
        vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = "#6c7a89", italic = true })
      end,
    })
  end,
}
