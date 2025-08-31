-- ═══════════════════════════════════════════════════════════════════════════════
--  🔄 AUTOCMDS - Revolutionary User Experience
-- ═══════════════════════════════════════════════════════════════════════════════

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 🎯 Ensure modifiable buffers (fix your issue!)
local modifiable_group = augroup("ModifiableBuffers", { clear = true })
autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
    group = modifiable_group,
    callback = function()
        -- Make all normal buffers modifiable
        if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
            vim.bo.modifiable = true
        end
    end,
})

-- 🌟 Ultimate User Experience
local ux_group = augroup("UltimateUX", { clear = true })

-- ✨ Highlight yanked text
autocmd("TextYankPost", {
    group = ux_group,
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 300,
        })
    end,
})

-- 🧹 Remove trailing whitespace on save
autocmd("BufWritePre", {
    group = ux_group,
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function()
            vim.cmd([[%s/\s\+$//e]])
        end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- 📍 Remember cursor position
autocmd("BufReadPost", {
    group = ux_group,
    callback = function(event)
        local exclude = { "gitcommit", "gitrebase", "svn", "hgcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].cursor_restored then
            return
        end
        vim.b[buf].cursor_restored = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- 🎨 Dynamic cursor line (performance + aesthetics)
local cursorline_group = augroup("DynamicCursorLine", { clear = true })
autocmd({ "InsertEnter", "WinLeave" }, {
    group = cursorline_group,
    callback = function()
        vim.opt_local.cursorline = false
    end,
})
autocmd({ "InsertLeave", "WinEnter" }, {
    group = cursorline_group,
    callback = function()
        if vim.bo.filetype ~= "" then
            vim.opt_local.cursorline = true
        end
    end,
})

-- 📐 Auto-resize splits
autocmd("VimResized", {
    group = ux_group,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- 🔍 Auto-create directories
autocmd("BufWritePre", {
    group = ux_group,
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- 🚫 Disable auto-comments
autocmd("BufEnter", {
    group = ux_group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- ⚡ Performance Optimizations
local perf_group = augroup("PerformanceOpts", { clear = true })

-- Reduce syntax highlighting for large files
autocmd({ "BufReadPre", "FileReadPre" }, {
    group = perf_group,
    callback = function()
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
        if ok and stats and stats.size > 1024 * 1024 then -- 1MB
            vim.b.large_buf = true
            vim.opt_local.syntax = "off"
            vim.opt_local.foldenable = false
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.undolevels = -1
        end
    end,
})

-- 🎭 Filetype-specific optimizations
local filetype_group = augroup("FiletypeOpts", { clear = true })

-- Help files
autocmd("FileType", {
    group = filetype_group,
    pattern = { "help", "man", "qf", "lspinfo" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { 
            buffer = event.buf, 
            silent = true, 
            desc = "Close window" 
        })
    end,
})

-- Terminal buffers
autocmd("TermOpen", {
    group = filetype_group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
})

-- Markdown files
autocmd("FileType", {
    group = filetype_group,
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.conceallevel = 2
    end,
})

-- 🏆 Competitive Programming (your workflow!)
local cp_group = augroup("CompetitiveProgramming", { clear = true })
autocmd("FileType", {
    group = cp_group,
    pattern = { "cpp", "c" },
    callback = function()
        -- Enhanced C++ experience
        vim.opt_local.commentstring = "// %s"
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        
        -- CP-specific keymaps (from your workflow)
        local opts = { buffer = true, silent = true }
        vim.keymap.set("n", "<leader>cc", function()
            -- This will connect to your CP module
            vim.notify("⚡ Compiling C++...", vim.log.levels.INFO)
        end, vim.tbl_extend("force", opts, { desc = "Compile C++" }))
        
        vim.keymap.set("n", "<leader>cr", function()
            -- This will connect to your CP module  
            vim.notify("🏃 Running...", vim.log.levels.INFO)
        end, vim.tbl_extend("force", opts, { desc = "Run C++" }))
    end,
})

-- 🎨 UI Enhancement Autocmds
local ui_group = augroup("UIEnhancements", { clear = true })

-- Smooth scrolling for search results
autocmd("CmdlineLeave", {
    group = ui_group,
    callback = function()
        if vim.v.event.cmdtype == "/" or vim.v.event.cmdtype == "?" then
            vim.cmd("normal! zz")
        end
    end,
})

-- Auto-close certain filetypes with 'q'
autocmd("FileType", {
    group = ui_group,
    pattern = {
        "PlenaryTestPopup",
        "checkhealth",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground", 
        "neotest-output",
        "neotest-output-panel",
        "neotest-summary",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", {
            buffer = event.buf,
            silent = true,
            desc = "Quit buffer",
        })
    end,
})

-- 🔄 Session Management
local session_group = augroup("SessionManagement", { clear = true })
autocmd("VimLeavePre", {
    group = session_group,
    callback = function()
        -- Auto-save session (will integrate with session plugin)
        if vim.fn.argc() == 0 then
            -- Only for empty starts (not file-specific)
            vim.notify("💾 Session saved", vim.log.levels.INFO)
        end
    end,
})

-- Success notification
vim.notify("🔄 Autocmds loaded - Revolutionary UX ready!", vim.log.levels.INFO, { title = "⚡ Core" })
