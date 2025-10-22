-- ═══════════════════════════════════════════════════════════════════════════════
--  🌳 NEO-TREE - Enhanced UI with curved aesthetics
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false, -- DISABLED: Using snacks.explorer instead
  branch = "v3.x",
  cmd = "Neotree",
  keys = {
    { "<leader>ge", "<cmd>Neotree float git_status<cr>", desc = "🔀 Git Status" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = function()
    local colors = require("catppuccin.palettes").get_palette("mocha")
    
    return {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      enable_normal_mode_for_inputs = false,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 2,
          padding = 1, 
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = nil,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          -- Bigger, bolder icons for directories
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
          default = "󰈚",
          highlight = "NeoTreeFileIcon",
          provider = function(icon, node, state)
            if node.type == "file" or node.type == "terminal" then
              local ok, dev = pcall(require, "nvim-web-devicons")
              local name = node.type == "terminal" and "terminal" or node.name
              if ok then
                local glyph, hl = dev.get_icon(name, nil, { default = true })
                icon.text = glyph or icon.text
                icon.highlight = hl or icon.highlight
              end
            end
          end,
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added     = "",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
        file_size = {
          enabled = true,
          required_width = 64,
        },
        type = {
          enabled = true,
          required_width = 122,
        },
        last_modified = {
          enabled = true,
          required_width = 88,
        },
        created = {
          enabled = true,
          required_width = 110,
        },
      },
      
      -- 🎨 Enhanced window settings
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = {
            "toggle_node",
            nowait = false,
          },
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["a"] = {
            "add",
            config = {
              show_path = "none"
            }
          },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        }
      },
      
      -- moved: custom components and renderers are defined per-source under `filesystem`

      -- 📂 Filesystem settings
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            "node_modules"
          },
          hide_by_pattern = {
            "*.meta",
            "*/src/*/tsconfig.json",
          },
          always_show = {
            ".gitignore"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db"
          },
          never_show_by_pattern = {
            ".null-ls_*",
          },
        },
        bind_to_cwd = false,
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,

        -- Custom components are per-source in Neo-tree v3
        components = {
          colored_name = function(config, node, state)
            local colors = require("catppuccin.palettes").get_palette("mocha")
            local accents = {
              colors.mauve, colors.blue, colors.sapphire, colors.sky,
              colors.teal, colors.green, colors.yellow, colors.peach,
              colors.pink, colors.lavender,
            }
            local depth = (node.get_depth and node:get_depth()) or node.level or 1
            local idx = (depth - 1) % #accents + 1
            local fg = accents[idx]
            local is_dir = node.type == "directory"
            local group = ("NeoTreeColoredNameDepth%d%s"):format(idx, is_dir and "Dir" or "File")
            -- ensure the highlight group exists (safe to call repeatedly)
            pcall(vim.api.nvim_set_hl, 0, group, { fg = fg, bold = is_dir })
            return {
              text = node.name,
              highlight = group, -- pass a highlight group string for Nui
            }
          end,
        },

        -- Renderers that use the custom component
        renderers = {
          directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
              "container",
              content = {
                { "colored_name", zindex = 10 },
                { "clipboard", zindex = 10 },
                { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
              },
            },
          },
          file = {
            { "indent" },
            { "icon" },
            {
              "container",
              content = {
                { "colored_name", zindex = 10 },
                { "clipboard", zindex = 10 },
                { "bufnr", zindex = 10 },
                { "modified", zindex = 20, align = "right" },
                { "diagnostics",  zindex = 20, align = "right", hide_when_expanded = true },
                { "git_status", zindex = 20, align = "right" },
              },
            },
          },
        },

        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
        },
      },
      
      -- 🔀 Git status settings
      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"]  = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
          }
        }
      },
      
      -- 🎨 Enhanced visual settings 
      source_selector = {
        winbar = false,
        statusline = false,
        show_scrolled_off_parent_node = false,
        sources = {
          { source = "filesystem", display_name = " 󰉋 Files " },
          { source = "buffers", display_name = " 󰈚 Buffers " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
        content_layout = "start",
        tabs_layout = "equal",
        separator = { left = "▏", right = "▕" },
        separator_active = { left = "▎", right = "▍" },
        show_separator_on_edge = false,
        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparator",
        highlight_separator_active = "NeoTreeTabSeparator",
      }
    }
  end,
  
  config = function(_, opts)
    require("neo-tree").setup(opts)
    
    -- 🎨 Enhanced Neo-tree highlights to match curved statusline
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local colors = require("catppuccin.palettes").get_palette("mocha")
        local transparent = vim.g.nvim_transparency_enabled == true
        local bg_main = transparent and "none" or colors.base
        
        -- Custom highlights for enhanced visual appeal
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = bg_main, fg = colors.text })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = bg_main, fg = colors.overlay1 })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = bg_main, fg = colors.surface0 })
        
        -- Directory and file colors
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = colors.blue, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = colors.blue })
        vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.text })
        vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = colors.subtext1 })
        
        -- Git status colors
        vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.green })
        vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.yellow })
        vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = colors.red })
        vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.pink })
        vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = colors.overlay0 })
        
        -- Indent guides with curved theme
        vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.surface1 })
        vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = colors.mauve, bold = true })
        
        -- Root folder highlight
        vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.flamingo, bold = true })
        
        -- Tab styling
        vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bg = colors.blue, fg = colors.base, bold = true })
        vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = colors.surface0, fg = colors.overlay1 })
        vim.api.nvim_set_hl(0, "NeoTreeTabSeparator", { fg = colors.surface0 })
        
        -- Floating window border
        vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = colors.blue, bg = bg_main })
        vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = colors.flamingo, bg = bg_main, bold = true })
      end,
    })
    
    -- Trigger the highlight setup
    vim.cmd("doautocmd ColorScheme")
    
    -- Neo-tree configured silently
  end,
}
