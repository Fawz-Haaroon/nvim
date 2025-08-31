-- ═══════════════════════════════════════════════════════════════════════════════
--  📢 NVIM-NOTIFY - Beautiful Notifications
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 800,
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss All Notifications",
        },
    },
    opts = {
        timeout = 2000,  -- Reduced timeout to 2 seconds
        background_colour = "#000000",
        fps = 60,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "wrapped-compact",
        stages = "fade_in_slide_out",
        time_formats = {
            notification = "%T",
            notification_history = "%FT%T",
        },
        top_down = true,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
    },
    init = function()
        -- Override vim.notify to use nvim-notify
        vim.notify = require("notify")
    end,
    config = function(_, opts)
        local notify = require("notify")
        notify.setup(opts)
        vim.notify = notify
        
        -- Auto-dismiss notifications after timeout
        vim.api.nvim_create_autocmd("User", {
            pattern = "NotifyBackground",
            callback = function()
                vim.schedule(function()
                    notify.dismiss({ silent = true })
                end)
            end,
        })
    end,
}
