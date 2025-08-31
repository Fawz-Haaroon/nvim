-- ═══════════════════════════════════════════════════════════════════════════════
--  🎯 ENHANCED COMMAND-LINE - Ultimate completion with dropdown menus
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  {
    "gelguy/wilder.nvim",
    event = "CmdlineEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    build = ":UpdateRemotePlugins",
    config = function()
      -- Check if wilder is available
      local ok, wilder = pcall(require, "wilder")
      if not ok then
        vim.notify("Wilder not available", vim.log.levels.WARN)
        return
      end
      
      local colors = require("catppuccin.palettes").get_palette("mocha")
      
      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = "<Tab>",
        previous_key = "<S-Tab>",
        accept_key = "<CR>",
        reject_key = "<C-c>",
      })
      
      -- Enhanced pipeline with safe fuzzy matching (no Python dependency)
      -- NOTE: Use cmdline_getcompletion_pipeline instead of cmdline_pipeline to
      -- avoid invoking user-defined command completions. This prevents errors like
      -- "Ambiguous use of user-defined command" when typing partial commands
      -- (e.g. :Lsp matching LspInstall/LspUninstall).
      wilder.set_option("pipeline", {
        wilder.branch(
          require('wilder.shim').call('wilder#cmdline#getcompletion_pipeline', {
            language = 'vim',
            fuzzy = 1,
          }),
          wilder.vim_search_pipeline({
            fuzzy = 1,
          })
        ),
      })
      
      -- 🎨 Beautiful dropdown renderer with colors
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(
          wilder.popupmenu_palette_theme({
            -- 'single', 'double', 'rounded', 'solid'
            border = "rounded",
            max_height = "75%",
            min_height = 0,
            prompt_position = "top",
            reverse = 0,
            
            -- Highlighting
            highlights = {
              default = wilder.make_hl("WilderMenu", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = colors.text, background = colors.surface0 } }),
              selected = wilder.make_hl("WilderMenuSelected", "PmenuSel", { { a = 1 }, { a = 1 }, { foreground = colors.base, background = colors.blue } }),
              accent = wilder.make_hl("WilderMenuAccent", "PmenuSel", { { a = 1 }, { a = 1 }, { foreground = colors.pink, background = colors.surface0 } }),
              selected_accent = wilder.make_hl("WilderMenuSelectedAccent", "PmenuSel", { { a = 1 }, { a = 1 }, { foreground = colors.base, background = colors.pink } }),
            },
            
            -- Left and right icons
            left = { " ", wilder.popupmenu_devicons() },
            right = { " ", wilder.popupmenu_scrollbar() },
            
            -- Apply highlighting to the prompt
            apply_incsearch_fix = true,
          })
        )
      )
      
      vim.notify("🎯 Enhanced command-line completion loaded!", vim.log.levels.INFO, { title = "✨ UI" })
    end,
  },
  
}
