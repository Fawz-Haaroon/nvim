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
        timeout = 3000,  -- Slightly longer for important messages
        background_colour = "#000000",
        fps = 60,
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "✎",
            WARN = "",
        },
        level = vim.log.levels.INFO,  -- Show more messages since snacks will handle filtering
        minimum_width = 50,
        render = "default",  -- default shows borders, compact/minimal don't
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
            -- Lower priority than snacks notifications
            vim.api.nvim_win_set_config(win, { zindex = 90 })
        end,
    },
    init = function()
        -- Override vim.notify to use nvim-notify
        vim.notify = require("notify")
    end,
    config = function(_, opts)
        local notify = require("notify")
        notify.setup(opts)
        -- Base notifier
        local base_notify = notify

        -- Filter out noisy LSP warnings
        ---@param msg string|any
        ---@param level integer|nil
        ---@param n_opts table|nil
        local function filtered_notify(msg, level, n_opts)
            if type(msg) == "string"
                and msg:match("textDocument/documentHighlight")
                and msg:match("not supported")
            then
                return
            end
            return base_notify(msg, level, n_opts)
        end

        vim.notify = filtered_notify
        
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
