-- ═══════════════════════════════════════════════════════════════════════════════
--  🖼️ IMAGE.NVIM - Ultimate Image Viewing for Kitty Terminal
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "markdown" },
                })
            end,
        },
    },
    opts = {
        backend = "kitty", -- Kitty terminal backend
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "markdown", "vimwiki" },
            },
            neorg = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = false,
                filetypes = { "norg" },
            },
            html = {
                enabled = false,
            },
            css = {
                enabled = false,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
    config = function(_, opts)
        -- Setup the plugin
        require("image").setup(opts)
        
        -- 🎯 Custom keybindings for image operations
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { desc = "🖼️ " .. desc, silent = true })
        end
        
        -- Toggle image rendering
        map("n", "<leader>ti", function()
            local image = require("image")
            if image.is_enabled() then
                image.disable()
                vim.notify("🚫 Image rendering disabled", vim.log.levels.INFO, { title = "🖼️ Image.nvim" })
            else
                image.enable()
                vim.notify("✅ Image rendering enabled", vim.log.levels.INFO, { title = "🖼️ Image.nvim" })
            end
        end, "Toggle image rendering")
        
        -- Clear all images in current buffer
        map("n", "<leader>ic", function()
            require("image").clear()
            vim.notify("🧹 Images cleared from buffer", vim.log.levels.INFO, { title = "🖼️ Image.nvim" })
        end, "Clear images from buffer")
        
        -- Refresh/reload images in current buffer
        map("n", "<leader>ir", function()
            require("image").clear()
            vim.cmd("edit") -- Reload buffer to re-render images
            vim.notify("🔄 Images refreshed", vim.log.levels.INFO, { title = "🖼️ Image.nvim" })
        end, "Refresh images in buffer")
        
        -- 📁 Open image files directly with image viewer
        vim.api.nvim_create_autocmd("BufReadPre", {
            pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
            callback = function()
                vim.opt_local.filetype = "image"
            end,
        })
        
        -- 🎨 Enhanced image file handling
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "image",
            callback = function()
                -- Set buffer options for image files
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
                vim.opt_local.signcolumn = "no"
                vim.opt_local.foldcolumn = "0"
                vim.opt_local.wrap = false
                vim.opt_local.list = false
                vim.opt_local.cursorline = false
                vim.opt_local.colorcolumn = ""
                
                -- Show image info in statusline
                local filename = vim.fn.expand("%:t")
                local filesize = vim.fn.getfsize(vim.fn.expand("%"))
                local size_mb = string.format("%.2f MB", filesize / 1024 / 1024)
                vim.notify(
                    string.format("🖼️ %s (%s)", filename, size_mb),
                    vim.log.levels.INFO,
                    { title = "Image File Opened" }
                )
            end,
        })
        
        -- 📋 Success notification
        vim.notify("🖼️ Image viewing enabled with Kitty backend!", vim.log.levels.INFO, { title = "🚀 UI" })
    end,
}
