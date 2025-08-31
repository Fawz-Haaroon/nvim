-- ═══════════════════════════════════════════════════════════════════════════════
--  🧼 Conform.nvim - Format-on-save with zero bloat
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = true,
    -- Ensure clang-format reads your ~/.clang-format or project .clang-format
    formatters = {
      clang_format = {
        prepend_args = { "-style=file" },
      },
    },
    formatters_by_ft = {
      -- Web
      javascript = { { "prettier", "prettierd" } },
      javascriptreact = { { "prettier", "prettierd" } },
      typescript = { { "prettier", "prettierd" } },
      typescriptreact = { { "prettier", "prettierd" } },
      vue = { { "prettier", "prettierd" } },
      svelte = { { "prettier", "prettierd" } },
      css = { { "prettier", "prettierd" } },
      scss = { { "prettier", "prettierd" } },
      html = { { "prettier", "prettierd" } },
      json = { { "prettier", "prettierd" } },
      jsonc = { { "prettier", "prettierd" } },
      yaml = { { "prettier", "prettierd" } },
      markdown = { { "prettier", "prettierd" } },
      graphql = { { "prettier", "prettierd" } },

      -- Lua
      lua = { "stylua" },

      -- Python
      python = { "isort", "black" },

      -- Go
      go = { "gofumpt", "goimports" },

      -- Rust
      rust = { "rustfmt" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },

      -- Terraform
      terraform = { "terraform_fmt" },

      -- C/C++ (leave to clangd by default; can use clang-format if desired)
       c = { "clang_format" },
       cpp = { "clang_format" },
    },

    -- Format on save conservatively and quickly
    format_on_save = function(bufnr)
      -- Skip very large files for performance
      local max = 200 * 1024 -- 200KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
      if ok and stats and stats.size > max then
        return
      end
      return { lsp_fallback = true, timeout_ms = 1000 }
    end,
  },
  config = function(_, opts)
    require("conform").setup(opts)
    -- Optional command and keymap for manual formatting
    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, {})

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format with Conform" })
  end,
}

