-- ═══════════════════════════════════════════════════════════════════════════════
--  🧪 NEOTEST - Run tests inside Neovim with beautiful UI
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Language-specific adapters
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-vitest", 
    "marilari88/neotest-vitest",
    "haydenmeade/neotest-jest",
    "rouge8/neotest-rust",
    "alfaix/neotest-gtest",
  },
  keys = {
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
    { "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all tests in file" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug nearest test" },
    { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop test" },
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show test output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
    { "<leader>tS", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
    { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Toggle test watch mode" },
  },
  opts = function()
    return {
      adapters = {
        -- Python: pytest, unittest  
        require("neotest-python")({
          dap = { justMyCode = false },
          args = {"--log-level", "DEBUG"},
          runner = "pytest",
          python = function()
            -- Auto-detect venv or use system python
            local cwd = vim.fn.getcwd()
            local venv_paths = {
              cwd .. "/.venv/bin/python",
              cwd .. "/venv/bin/python", 
              cwd .. "/env/bin/python",
              vim.fn.stdpath("config") .. "/.venv/bin/python"
            }
            for _, path in ipairs(venv_paths) do
              if vim.fn.executable(path) == 1 then
                return path
              end
            end
            return "python3"
          end,
        }),
        
        -- JavaScript/TypeScript: Jest, Vitest
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function() return vim.fn.getcwd() end,
        }),
        
        require("neotest-vitest")({
          vitestCommand = "npx vitest",
        }),
        
        -- Rust: cargo test
        require("neotest-rust")({
          args = { "--no-capture" },
        }),
        
        -- C++: Google Test
        require("neotest-gtest").setup({
          args = { "--gtest_brief=1" }
        }),
      },
      
      -- UI Configuration
      discovery = {
        enabled = true,
        concurrent = 1,
      },
      
      running = {
        concurrent = true,
      },
      
      summary = {
        enabled = true,
        animated = true,
        follow = true,
        expand_errors = true,
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          output = "o",
          short = "O",
          attach = "a", 
          jumpto = "i",
          stop = "u",
          run = "r",
          debug = "d",
          mark = "m",
          run_marked = "R",
          debug_marked = "D",
          clear_marked = "M",
          target = "t",
          clear_target = "T",
          next_failed = "J",
          prev_failed = "K",
          watch = "w",
        },
      },
      
      output = {
        enabled = true,
        open_on_run = "short",
      },
      
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      
      quickfix = {
        enabled = false,
      },
      
      state = {
        enabled = true,
      },
      
      status = {
        enabled = true,
        virtual_text = true,
        signs = true,
      },
      
      strategies = {
        integrated = {
          height = 40,
          width = 120,
        },
      },
      
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "✖",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "✓",
        running = "●",
        running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        skipped = "○",
        unknown = "?",
        watching = "👁",
      },
      
      highlights = {
        adapter_name = "NeotestAdapterName",
        border = "NeotestBorder", 
        dir = "NeotestDir",
        expand_marker = "NeotestExpandMarker",
        failed = "NeotestFailed",
        file = "NeotestFile",
        focused = "NeotestFocused",
        indent = "NeotestIndent",
        marked = "NeotestMarked",
        namespace = "NeotestNamespace",
        passed = "NeotestPassed",
        running = "NeotestRunning",
        select_win = "NeotestWinSelect",
        skipped = "NeotestSkipped",
        target = "NeotestTarget",
        test = "NeotestTest",
        unknown = "NeotestUnknown",
        watching = "NeotestWatching",
      },
    }
  end,
  
  config = function(_, opts)
    require("neotest").setup(opts)
    
    -- Enhanced highlights
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local colors = require("catppuccin.palettes").get_palette("mocha")
        vim.api.nvim_set_hl(0, "NeotestPassed", { fg = colors.green, bold = true })
        vim.api.nvim_set_hl(0, "NeotestFailed", { fg = colors.red, bold = true })
        vim.api.nvim_set_hl(0, "NeotestRunning", { fg = colors.yellow, bold = true })
        vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = colors.overlay1, bold = true })
        vim.api.nvim_set_hl(0, "NeotestTest", { fg = colors.blue })
        vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = colors.lavender })
        vim.api.nvim_set_hl(0, "NeotestFocused", { fg = colors.yellow })
        vim.api.nvim_set_hl(0, "NeotestFile", { fg = colors.teal })
        vim.api.nvim_set_hl(0, "NeotestDir", { fg = colors.blue })
        vim.api.nvim_set_hl(0, "NeotestBorder", { fg = colors.surface1 })
        vim.api.nvim_set_hl(0, "NeotestIndent", { fg = colors.surface0 })
        vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = colors.overlay1 })
        vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = colors.purple, bold = true })
        vim.api.nvim_set_hl(0, "NeotestWinSelect", { fg = colors.blue, bold = true })
        vim.api.nvim_set_hl(0, "NeotestMarked", { fg = colors.orange, bold = true })
        vim.api.nvim_set_hl(0, "NeotestTarget", { fg = colors.red, bold = true })
        vim.api.nvim_set_hl(0, "NeotestUnknown", { fg = colors.overlay1 })
        vim.api.nvim_set_hl(0, "NeotestWatching", { fg = colors.cyan, bold = true })
      end,
    })
  end,
}