-- ═══════════════════════════════════════════════════════════════════════════════
--  🛢️  OIL NEXUS - Ultra-Modern Directory Editor
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "stevearc/oil.nvim",
    enabled = true,
    lazy = true,
    cmd = { "Oil" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        columns = {
            "icon",
            {
                "permissions",
                highlight = "OilPermissions",
            },
            {
                "size", 
                highlight = "OilSize",
            },
            {
                "mtime",
                highlight = "OilMtime", 
                format = "%b %d %H:%M",
            },
        },
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
            timeout_ms = 1000,
            autosave_changes = false,
        },
        constrain_cursor = "editable",
        experimental_watch_for_changes = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
            -- 🖼️ Image-specific keymaps
            ["gI"] = {
                function()
                    local oil = require("oil")
                    local entry = oil.get_cursor_entry()
                    if entry and entry.type == "file" then
                        local filename = entry.name
                        local ext = filename:match("%.([^%.]+)$")
                        if ext and vim.tbl_contains({"png", "jpg", "jpeg", "gif", "webp", "avif"}, ext:lower()) then
                            -- Open image in new buffer with image viewing enabled
                            local full_path = oil.get_current_dir() .. filename
                            vim.cmd("edit " .. vim.fn.fnameescape(full_path))
                        else
                            vim.notify("🖼️ Not an image file", vim.log.levels.WARN, { title = "Image Viewer" })
                        end
                    end
                end,
                desc = "🖼️ View image file",
            },
        },
        use_default_keymaps = true,
        view_options = {
            show_hidden = false,
            natural_order = true,
            is_always_hidden = function(name, bufnr)
                return false
            end,
        },
        float = {
            padding = 2,
            max_width = 0,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
        preview = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = 0.9,
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
        },
        progress = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            width = nil,
            max_height = { 10, 0.9 },
            min_height = { 5, 0.1 },
            height = nil,
            border = "rounded",
            minimized_border = "none",
            win_options = {
                winblend = 0,
            },
        },
    },
    keys = {
        { "-", function()
            -- Only open oil if we're not in a special buffer
            local ft = vim.bo.filetype
            if ft ~= 'snacks_dashboard' and ft ~= 'dashboard' and ft ~= 'snacks_explorer' then
                require("oil").open()
            end
        end, desc = "Open parent directory" },
        { "<leader>fo", function()
            local ft = vim.bo.filetype
            if ft ~= 'snacks_dashboard' and ft ~= 'dashboard' then
                require("oil").open()
            end
        end, desc = "Open directory editor (Oil)" },
        { "<leader>fO", function()
            local ft = vim.bo.filetype
            if ft ~= 'snacks_dashboard' and ft ~= 'dashboard' then
                require("oil").open_float()
            end
        end, desc = "Open floating directory editor (Oil)" },
    },
}
