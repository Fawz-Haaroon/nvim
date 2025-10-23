-- ═══════════════════════════════════════════════════════════════════════════════
--  🎯 FUNCTIONAL KEYMAPS - Actually Working Keybindings!
-- ═══════════════════════════════════════════════════════════════════════════════

local M = {}

function M.setup()
    local map = vim.keymap.set
    
    -- 🚀 TELESCOPE - Find & Search (These should work!)
    map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers" })
    map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
    map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find Word" })
    map("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Find Marks" })
    map("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
    map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find Keymaps" })
    map("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
    
    -- 🎯 HARPOON - Quick Navigation
    local harpoon_ok, harpoon = pcall(require, "harpoon")
    if harpoon_ok then
        map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon File" })
        map("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
        -- Harpoon quick access
        map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
        map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
        map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
        map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
    else
        -- Fallback bindings
        map("n", "<leader>a", "<cmd>echo 'Harpoon not available'<cr>", { desc = "Harpoon File" })
        map("n", "<leader>h", "<cmd>echo 'Harpoon not available'<cr>", { desc = "Harpoon Menu" })
    end
    
    -- 📁 FILE EXPLORER
    -- <leader>e -> Snacks Explorer, <leader>o -> Oil
    map("n", "<leader>e", function()
      local ok, s = pcall(require, "snacks")
      if ok and s.explorer then s.explorer() else vim.cmd("Oil") end
    end, { desc = "Explorer (Snacks)" })
    map("n", "<leader>E", function()
      local ok, s = pcall(require, "snacks")
      if ok and s.explorer then s.explorer({ cwd = vim.fn.getcwd() }) else vim.cmd("Oil") end
    end, { desc = "Explorer (CWD)" })
    -- Git status: keep Neogit shortcut
    map("n", "<leader>ge", "<cmd>Neogit kind=split<cr>", { desc = "🔀 Git Status" })

    -- 🗂️ WORKSPACES
    map("n", "<leader>wn", "<cmd>WorkspaceNew<cr>", { desc = "Workspace: New (save current)" })
    map("n", "<leader>ws", function()
      vim.ui.input({ prompt = 'Workspace name (blank = cwd-derived): ' }, function(name)
        if name and name ~= '' then
          vim.cmd('WorkspaceSave ' .. name)
        else
          vim.cmd('WorkspaceSave')
        end
      end)
    end, { desc = "Workspace: Save to name" })
    map("n", "<leader>wl", "<cmd>WorkspaceList<cr>", { desc = "Workspace: List/Open" })
    map("n", "<leader>wo", "<cmd>WorkspaceOpen<cr>", { desc = "Workspace: Open by name" })
    map("n", "<leader>wd", "<cmd>WorkspaceDelete<cr>", { desc = "Workspace: Delete" })
    map("n", "<leader>wr", "<cmd>WorkspaceRename<cr>", { desc = "Workspace: Rename" })
    map("n", "<leader>wS", "<cmd>WorkspaceSessions<cr>", { desc = "Workspace: Sessions in current" })
    
    -- 📁 OIL - Directory Editor 
    map("n", "<leader>o", "<cmd>Oil<cr>", { desc = "📁 Open Oil" })
    
-- 💾 SESSIONS (tmux-style)
    map("n", "<leader>ss", "<cmd>SaveSession<cr>", { desc = "Save Session" })
    map("n", "<leader>sl", "<cmd>SessionList<cr>", { desc = "List/Search Sessions" })
    map("n", "<leader>sd", "<cmd>DeleteSession<cr>", { desc = "Delete Session" })
    map("n", "<leader>sS", "<cmd>SessionSnapshotSave<cr>", { desc = "Save Snapshot" })
    map("n", "<leader>sR", "<cmd>SessionSnapshotList<cr>", { desc = "Restore Snapshot" })
    map("n", "<leader>sD", "<cmd>SessionSnapshotDelete<cr>", { desc = "Delete Snapshot" })
    map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
    
    -- 🔧 CODE ACTIONS & LSP
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    map("n", "<leader>cd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
    map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
    map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
    map("n", "<leader>cS", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
    map("n", "<leader>cW", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
    
    -- Go to definitions
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
    map("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
    map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
    map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
    
    -- 🌿 GIT OPERATIONS
    -- Helper function to check if in git repo
    local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
    end
    
    local function safe_git_cmd(cmd, fallback_msg)
        return function()
            if is_git_repo() then
                vim.cmd(cmd)
            else
                vim.notify(fallback_msg or "Not in a git repository", vim.log.levels.WARN)
            end
        end
    end
    
    -- LazyGit (primary git UI)
    map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
    
    -- Neogit (alternative)
    map("n", "<leader>gn", safe_git_cmd("Neogit"), { desc = "Neogit" })
    map("n", "<leader>gs", safe_git_cmd("Neogit kind=split"), { desc = "Git Status" })
    map("n", "<leader>gc", safe_git_cmd("Neogit commit"), { desc = "Git Commit" })
    map("n", "<leader>gp", safe_git_cmd("Neogit push"), { desc = "Git Push" })
    map("n", "<leader>gP", safe_git_cmd("Neogit pull"), { desc = "Git Pull" })
    
    -- Telescope git commands (only in git repos)
    map("n", "<leader>gb", safe_git_cmd("Telescope git_branches"), { desc = "Git Branches" })
    map("n", "<leader>gf", safe_git_cmd("Telescope git_files"), { desc = "Git Files" })
    map("n", "<leader>gC", safe_git_cmd("Telescope git_commits"), { desc = "Git Commits" })
    map("n", "<leader>gB", safe_git_cmd("Telescope git_bcommits"), { desc = "Buffer Commits" })
    
    -- Diffview
    map("n", "<leader>gh", safe_git_cmd("DiffviewFileHistory"), { desc = "Git History" })
    map("n", "<leader>gd", safe_git_cmd("DiffviewOpen"), { desc = "Git Diff" })
    map("n", "<leader>gx", "<cmd>DiffviewClose<cr>", { desc = "Close Git Diff" })
    
    -- GitSigns
    map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next Hunk" })
    map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Prev Hunk" })
    map("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage Hunk" })
    map("n", "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo Stage Hunk" })
    map("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset Hunk" })
    map("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview Hunk" })
    map("n", "<leader>ghb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame Line" })
    
    
    -- 🐛 DEBUGGING
    local dap_ok, dap = pcall(require, "dap")
    if dap_ok then
        map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        map("n", "<leader>dc", dap.continue, { desc = "Continue" })
        map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
        map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
        map("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
        map("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
        map("n", "<leader>ds", dap.session, { desc = "Session" })
        map("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
    end
    
    local dapui_ok, dapui = pcall(require, "dapui")
    if dapui_ok then
        map("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
        map("n", "<leader>de", dapui.eval, { desc = "Eval" })
    end
    
    -- 👁 DIAGNOSTICS & TROUBLE
    map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
    map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
    map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
    map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
    
    -- Navigation (note: ]d and [d already defined in core keymaps)
    map("n", "<leader>xe", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
    
    -- 🎨 UI TOGGLES
    map("n", "<leader>uz", "<cmd>ZenMode<cr>", { desc = "Zen Mode" })
    map("n", "<leader>um", "<cmd>MinimapToggle<cr>", { desc = "Toggle Minimap" })
    map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "Toggle Word Wrap" })
    map("n", "<leader>un", "<cmd>set number!<cr>", { desc = "Toggle Line Numbers" })
    map("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "Toggle Relative Numbers" })
    map("n", "<leader>us", "<cmd>set spell!<cr>", { desc = "Toggle Spell Check" })
    map("n", "<leader>uc", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer" })
    
    -- 📦 BUFFER OPERATIONS
    map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
    map("n", "<leader>bD", "<cmd>%bdelete|edit#|normal `\"<cr>", { desc = "Delete All But Current" })
    
    -- Buffer navigation
    -- Note: <S-h> and <S-l> are already defined in core keymaps
    map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
    map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
    
    -- 🔍 SEARCH & REPLACE
    map("n", "<leader>sr", "<cmd>Spectre<cr>", { desc = "Replace in Project" })
    map("n", "<leader>sf", "<cmd>Spectre open_file_search<cr>", { desc = "Replace in File" })
    map("v", "<leader>sr", "<cmd>Spectre open_visual<cr>", { desc = "Replace Selection" })
    
    -- 🎯 LAZY.NVIM & MASON
    -- Note: <leader>L already defined in core keymaps
    map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" })
    
    -- 📝 TODO COMMENTS
    map("n", "]t", "<cmd>TodoNext<cr>", { desc = "Next Todo" })
    map("n", "[t", "<cmd>TodoPrev<cr>", { desc = "Previous Todo" })
    map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
    
    -- 🎪 FLASH - Teleport Navigation  
    local flash_ok, flash = pcall(require, "flash")
    if flash_ok then
        map({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
        map({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash Treesitter" })
        map({ "o" }, "r", flash.remote, { desc = "Remote Flash" })
        map({ "x", "o" }, "R", flash.treesitter_search, { desc = "Treesitter Search" })
        map({ "c" }, "<c-s>", flash.toggle, { desc = "Toggle Flash Search" })
    end
    
    -- 🎮 MULTICURSOR
    local mc_ok, mc = pcall(require, "multicursors")
    if mc_ok then
        map("n", "<leader>mc", mc.new_cursor_at_nearest_match, { desc = "Multi-cursor at Match" })
        map("v", "<leader>mc", mc.new_cursor_at_every_match, { desc = "Multi-cursor at Every Match" })
        map("n", "<leader>mC", mc.new_cursor_at_end_of_match, { desc = "Multi-cursor at End" })
    end
    
    -- 🔄 REFACTORING
    local refactor_ok, refactor = pcall(require, "refactoring")
    if refactor_ok then
        map("x", "<leader>re", refactor.refactor("Extract Function"), { desc = "Extract Function" })
        map("x", "<leader>rf", refactor.refactor("Extract Function To File"), { desc = "Extract Function to File" })
        map("x", "<leader>rv", refactor.refactor("Extract Variable"), { desc = "Extract Variable" })
        map("n", "<leader>rI", refactor.refactor("Inline Function"), { desc = "Inline Function" })
        map({"n", "x"}, "<leader>ri", refactor.refactor("Inline Variable"), { desc = "Inline Variable" })
        map("n", "<leader>rb", refactor.refactor("Extract Block"), { desc = "Extract Block" })
        map("n", "<leader>rbf", refactor.refactor("Extract Block To File"), { desc = "Extract Block to File" })
    end
    
    -- 💡 Additional Utilities
    -- Note: <leader>R and <leader><leader> already defined in core keymaps
    
    -- Silent load: notify only on error
end

return M
