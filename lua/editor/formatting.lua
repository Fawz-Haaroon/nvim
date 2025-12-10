-- ═══════════════════════════════════════════════════════════════════════════════
--  🧼 Conform.nvim - Format-on-save with zero bloat (manual formatting only)
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = true,
    stop_after_first = true, -- new recommended option

    -- Ensure clang-format reads your ~/.clang-format or project .clang-format
    formatters = {
      clang_format = {
        prepend_args = { "-style=file" },
      },
    },

    formatters_by_ft = {
      -- Web
      javascript = { "prettier", "prettierd" },
      javascriptreact = { "prettier", "prettierd" },
      typescript = { "prettier", "prettierd" },
      typescriptreact = { "prettier", "prettierd" },
      vue = { "prettier", "prettierd" },
      svelte = { "prettier", "prettierd" },
      css = { "prettier", "prettierd" },
      scss = { "prettier", "prettierd" },
      html = { "prettier", "prettierd" },
      json = { "prettier", "prettierd" },
      jsonc = { "prettier", "prettierd" },
      yaml = { "prettier", "prettierd" },
      markdown = { "prettier", "prettierd" },
      graphql = { "prettier", "prettierd" },

      -- Lua
      lua = { "stylua" },

      -- Python (disabled)
      -- python = { "isort", "black" },

      -- Go
      go = { "gofumpt", "goimports" },

      -- Rust
      rust = { "rustfmt" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },

      -- Terraform
      terraform = { "terraform_fmt" },

      -- C/C++
      c = { "clang_format" },
      cpp = { "clang_format" },
    },

    -- Disable automatic format on save
    format_on_save = false,
  },

  config = function(_, opts)
    require("conform").setup(opts)

    -- Manual formatting command
    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, {})

    -- Manual formatting keybind
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format with Conform" })
  end,
}
