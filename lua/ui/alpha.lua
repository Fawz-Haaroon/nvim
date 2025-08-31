-- ═══════════════════════════════════════════════════════════════════════════════
--  🌸 REVOLUTIONARY ALPHA DASHBOARD - Anime Aesthetic Paradise 
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        
        -- 🌸 Dynamic greeting with anime vibes
        local function get_greeting()
            local hour = tonumber(os.date("%H"))
            local greetings = {
                [0] = "🌙 Midnight coding? Sugoi desu ne! ✨",
                [6] = "🌅 Ohayo gozaimasu, coder-san! ☕",
                [12] = "☀️ Good afternoon, senpai! 💪",
                [18] = "🌆 Konbanwa! Time to code! 🎌",
            }
            
            for h = 23, 0, -1 do
                if hour >= h and greetings[h] then
                    return greetings[h]
                end
            end
            return "🚀 Code with passion, developer-kun! 💻"
        end
        
        -- 📊 Advanced system stats with anime style
        local function get_stats()
            local stats = {}
            
            -- Plugin stats
            local ok, lazy = pcall(require, "lazy")
            if ok then
                local lazy_stats = lazy.stats()
                stats.plugins = "🔌 Plugins: " .. lazy_stats.loaded .. "/" .. lazy_stats.count
                stats.startup = "⚡ Startup: " .. math.floor(lazy_stats.startuptime * 10) / 10 .. "ms"
            else
                stats.plugins = "🔌 Plugins: Loading..."
                stats.startup = "⚡ Startup: Calculating..."
            end
            
            -- LSP status
            local lsp_clients = #vim.lsp.get_clients()
            stats.lsp = "🧠 LSP: " .. (lsp_clients > 0 and lsp_clients .. " active" or "Ready")
            
            -- Version info
            local v = vim.version()
            stats.version = "🎯 Neovim: v" .. v.major .. "." .. v.minor .. "." .. v.patch
            
            -- System info
            stats.os = "💻 System: " .. vim.loop.os_uname().sysname
            stats.time = "⏰ Time: " .. os.date("%H:%M:%S")
            
            return stats
        end
        
        -- 🎨 Epic anime-inspired ASCII art with kawaii elements
        local anime_header = {
            "                                                                    ",
            "        ／|_／|     🌸 Lexitron's Ultimate IDE Paradise 🌸          ",
            "       (  o.o  )                                                    ",
            "        > ^ <      ═══════════════════════════════════════════      ",
            "                                                                    ",
            "     ██╗     ███████╗██╗  ██╗██╗████████╗██████╗  ██████╗ ███╗   ██╗",
            "     ██║     ██╔════╝╚██╗██╔╝██║╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║",
            "     ██║     █████╗   ╚███╔╝ ██║   ██║   ██████╔╝██║   ██║██╔██╗ ██║",
            "     ██║     ██╔══╝   ██╔██╗ ██║   ██║   ██╔══██╗██║   ██║██║╚██╗██║",
            "     ███████╗███████╗██╔╝ ██╗██║   ██║   ██║  ██║╚██████╔╝██║ ╚████║",
            "     ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝",
            "                                                                     ",
            "    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗               ",
            "    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║               ",
            "    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║               ",
            "    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║               ",
            "    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║               ",
            "    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝               ",
            "                                                                     ",
            "             (◕‿◕)♡  The Ultimate Coding Experience  ♡(◕‿◕)        ",
            "",
        }
        
        dashboard.section.header.val = anime_header
        dashboard.section.header.opts.hl = "AlphaHeader"


	-- helper to build balanced left + right line
	local function format_line(left, right, inner_width)
	    local space = inner_width - (#left + #right)
	    if space < 0 then space = 0 end
	    return "║" .. left .. string.rep(" ", space) .. right .. "║"
	end

        -- ✨ Statistics section with anime flair
        local function create_stats_section()
            local stats = get_stats()
            return {
                type = "group",
                val = {
                    {
                        type = "text",
                        val = "╔══════════════════════ 📊 System Analytics ══════════════════════╗",
                        opts = { hl = "AlphaStats", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║                                                                 ║",
                        opts = { hl = "AlphaStats", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║  " .. stats.plugins .. "                            " .. stats.startup .. "    ║",
                        opts = { hl = "AlphaStatsText", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║  " .. stats.lsp .. "                               " .. stats.version .. " ║", 
                        opts = { hl = "AlphaStatsText", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║  " .. stats.os .. "                            " .. stats.time .. "  ║",
                        opts = { hl = "AlphaStatsText", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║                                                                 ║",
                        opts = { hl = "AlphaStats", position = "center" }
                    },
                    {
                        type = "text",
                        val = "╚═════════════════════════════════════════════════════════════════╝",
                        opts = { hl = "AlphaStats", position = "center" }
                    },
                },
                opts = { spacing = 0 }
            }
        end


        
        -- 🪟 Workspace Tracker Component
        local function create_workspace_section()
            local workspace_tracker = require('ui.workspace-tracker')
            local info = workspace_tracker.get_workspace_info()
            
            -- Get the last used workspace info (store in global variable)
            local last_workspace = vim.g.lexitron_last_workspace or {tab_num = 1, windows = 1}
            
            local function format_workspace_button(num, is_home)
                if is_home then
                    return "[🏠]"
                else
                    return "[" .. num .. "]"
                end
            end
            
            local workspace_line = "│    Workspace: " .. 
                format_workspace_button(1, false) .. 
                format_workspace_button(2, false) .. 
                format_workspace_button(last_workspace.windows or 1, false) .. 
                format_workspace_button("🏠", true) .. 
                "  (Click to return)  │"
            
            return {
                type = "group",
                val = {
                    {
                        type = "text",
                        val = "╔═══════════════════════ 🪟 Quick Actions ═══════════════════════╗",
                        opts = { hl = "AlphaWorkspace", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║                                                               ║",
                        opts = { hl = "AlphaWorkspace", position = "center" }
                    },
                    {
                        type = "text",
                        val = workspace_line,
                        opts = { hl = "AlphaWorkspaceText", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║                                                               ║",
                        opts = { hl = "AlphaWorkspace", position = "center" }
                    },
                    {
                        type = "text",
                        val = "║  Quick Return: <leader>0 (Home) • <leader>1-9 (Buffers)     ║",
                        opts = { hl = "AlphaWorkspaceHint", position = "center" }
                    },
                    {
                        type = "text",
                        val = "╚═══════════════════════════════════════════════════════════════╝",
                        opts = { hl = "AlphaWorkspace", position = "center" }
                    },
                },
                opts = { spacing = 0 }
            }
        end

        -- 🎯 Aesthetic buttons with curved design
        dashboard.section.buttons.val = {
            dashboard.button("f", "🔍  Find Files", ":lua require('telescope.builtin').find_files()<CR>"),
            dashboard.button("r", "📚  Recent Files", ":lua require('telescope.builtin').oldfiles()<CR>"),
            dashboard.button("p", "🚀  Projects", ":lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~'), prompt_title = 'Find Project' })<CR>"),
            dashboard.button("c", "⚙️  Configuration", ":e $MYVIMRC<CR>"),
            dashboard.button("s", "💾  Sessions", ":lua vim.cmd('mksession! ~/.config/nvim/session.vim')<CR>"),
            dashboard.button("u", "🔄  Update Plugins", ":lua require('lazy').sync()<CR>"),
            dashboard.button("w", "🪟  Return to Workspace", ":lua vim.cmd('edit #')<CR>"),
            dashboard.button("h", "💡  Help", ":help<CR>"),
            dashboard.button("q", "👋  Quit", ":qa<CR>"),
        }
        
        -- 💫 Footer with dynamic greeting (Fixed alignment)
        local function create_footer()
            local greeting = get_greeting()
            local box_width = 70
            local padding = math.floor((box_width - #greeting - 2) / 2)
            local extra_padding = (box_width - #greeting - 2) % 2
            
            local greeting_line = "│" .. string.rep(" ", padding) .. greeting .. string.rep(" ", padding + extra_padding) .. "      │"
            local subtitle_line = "│        💝 Made with love by Lexitron  •   ⚡ Blazing Fast          │"
            
            return {
                "",
                "╭────────────────────────────────────────────────────────────────────╮",
                greeting_line,
                "│                                                                    │", 
                subtitle_line,
                "╰────────────────────────────────────────────────────────────────────╯",
                "",
            }
        end
        
        dashboard.section.footer.val = create_footer()
        
        -- 🌈 Custom highlight groups for anime aesthetic
        local function setup_highlights()
            vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#b4befe", bold = true })
            vim.api.nvim_set_hl(0, "AlphaStats", { fg = "#89b4fa", bold = true })
            vim.api.nvim_set_hl(0, "AlphaStatsText", { fg = "#cdd6f4" })
            vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#f5c2e7", italic = true })
            vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#a6e3a1" })
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#f9e2af", bold = true })
        end
        
        dashboard.section.footer.opts.hl = "AlphaFooter"
        
        -- 🎪 Layout configuration with perfect spacing
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            create_stats_section(),
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }
        
        -- 🎨 Button highlighting
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        
        setup_highlights()
        
        -- 🔄 Refresh stats periodically
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                -- Update stats every few seconds when dashboard is open
                vim.defer_fn(function()
                    if vim.bo.filetype == "alpha" then
                        alpha.redraw()
                    end
                end, 5000)
            end,
        })
        
        -- Apply the configuration
        alpha.setup(dashboard.config)
        
        -- 🎆 Success message
        vim.notify("🌸 Alpha Dashboard - Anime aesthetic loaded! (◕‿◕)♡", vim.log.levels.INFO, { title = "🚀 Dashboard" })
    end,
}
