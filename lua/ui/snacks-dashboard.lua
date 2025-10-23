-- ═══════════════════════════════════════════════════════════════════════════════
-- ═══════════════════════════════════════════════════════════════════════════════
--  🍿 SNACKS.NVIM - Ultimate Multi‑Feature Plugin Suite
--  💀 Advanced Skull Dashboard | 🔔 Smart Notifications | 🎨 Theme Integration
--  🚀 Performance Optimized | ⚡ All Features Enabled | 🌙 Dark Theme Ready

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        local ok, snacks = pcall(require, "snacks")
        if not ok then
            vim.notify("Snacks.nvim not loaded", vim.log.levels.WARN)
            return
        end

        -- Masterpiece dashboard with perfect alignment and full ASCII
        snacks.setup({
            dashboard = {
                enabled = true,
                width = 90, -- Better width
                height = 40, -- Better height for alignment
                pane_gap = 20, -- Good gap
                row = nil, -- Center vertically
                col = nil, -- Center horizontally
                sections = {
                    {
                        pane = 1,
                        align = "center",
                        padding = { 0, 1, 3, 3 },
                        text = [[




⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣘⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠈⡇⠿⢶⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⡀⡸⠁⢰⣇⠀⠈⢉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢳⡀⢀⣠⠃⡀⠀⣼⣇⠀⠀⠀⣸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢨⡷⠚⠀⠀⠻⢶⣿⠃⣤⡶⠛⠹⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠔⡉⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡖⠃⠀⠀⠀⢄⢸⣧⢀⠠⠄⠀⠀⠛⣿⠄⠀⠀⠀⠀⠀⢀⢼⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠦⡼⠉⠀⣸⠁⠛⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⠁⠀⠀⠀⢤⡌⣿⣷⠥⠒⠒⠚⠀⠈⠙⣦⡀⠀⠀⠀⢠⠋⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⢀⣀⠾⣆⠀⢠⢠⡏⢀⡘⣳⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢉⣿⣀⠀⠀⢨⢿⣿⣿⣥⠖⠀⠀⢀⣀⣀⢀⣹⣤⣄⣀⡇⠀⢀⣿⠃⠀⠀⠀⠀⠀⣠⠴⠏⠀⠀⠸⠷⠈⣿⡿⣋⣀⣨⣿⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⢸⣿⣿⣷⠴⠚⣿⡟⠉⢽⣄⣀⠒⣤⣬⣿⣿⣿⡟⣛⡻⠇⠀⢘⣟⣀⡀⠀⢠⣶⠚⠉⠀⠠⣄⠀⡀⢠⢸⡿⠙⠛⠉⠀⠻⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣞⣴⢻⣿⣿⣃⠀⡟⠀⠐⣶⣿⣿⣿⣿⣛⣿⣿⣿⣿⣶⡈⡆⡄⠈⢉⣉⡉⣦⠀⢹⡟⠀⠀⠠⡈⢢⢹⡈⣿⠁⠀⠀⠀⣀⠘⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣭⣿⣋⣻⣿⡿⣻⡇⣿⣷⣿⣿⣿⣿⣩⣟⣉⣿⣿⣿⣿⣇⣠⡧⣴⣿⣿⢿⣟⡲⣾⣿⣇⠀⠀⠙⢦⢣⣷⣇⡤⠒⠛⠷⠦⣄⣸⣇⡀⠀⠀⠀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⢿⠿⣿⡿⣣⠋⠳⡙⢿⣿⣿⣿⡿⢃⡙⣿⣿⣿⣿⣿⡶⣶⢶⣽⣿⣿⣿⠿⢷⣾⣿⣿⣗⢂⣀⣸⣾⣿⣗⠊⠭⠍⠉⠉⠁⣀⣈⣹⠀⠀⢀⡜⢹⣇⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡚⣛⡼⠙⠒⠊⢁⣤⣄⠈⠑⠒⠬⠔⠚⠋⠉⠚⠭⣿⣯⠭⠖⠛⢜⢿⣿⣿⣿⠟⢻⣧⣾⣿⣿⣤⣤⣨⣿⠋⠉⢁⣀⣀⣤⠖⠛⠉⠉⠁⠀⢠⠎⠀⢸⡟⠀⠀⠀⠀⠀⠀⢀⡴⡿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠏⢁⡴⣓⣒⣒⠭⠲⢯⡳⠦⣤⣤⠤⣖⣠⣶⣄⡀⠀⠀⣀⣤⡄⠀⠑⠲⠭⠵⠶⡜⢿⣿⣿⣿⡿⢋⣼⢱⣟⣶⣮⣽⣿⣧⣄⡀⢀⠖⠒⠢⡟⠀⠴⣾⡇⠀⠀⠀⠀⢀⣾⣿⣿⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡾⠋⣤⣤⣤⣤⠺⡽⠀⣴⡄⢁⣤⡍⢁⣳⠍⠛⠛⠉⠙⢛⣟⠿⡦⢤⣀⣤⠤⣄⠈⠒⠬⠭⠭⠔⠋⢹⡜⣏⡻⣿⣻⣽⠛⣧⢼⣿⣟⣦⠀⠀⢐⣿⡟⠀⠀⠀⠀⡜⣻⢿⣸⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠛⠂⠆⣉⣈⣁⣠⣸⣷⣤⣌⣁⣀⣉⣥⣴⣤⣀⡚⠃⠊⠗⠈⡋⠐⡶⢀⣀⢩⣭⠻⠓⡦⣤⣤⡤⠴⢶⡀⠳⣈⠻⢝⣛⠿⠟⣷⣼⣿⣟⣿⡄⣰⣾⢟⣿⡦⠀⠀⡼⣿⡇⣸⡟⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣣⣤⣶⠿⡫⣝⣻⢿⣛⠛⠻⣍⡙⠻⢿⣭⡭⠭⠿⠛⠛⠓⢒⣒⣓⣢⣀⣈⣁⣀⣉⠀⢶⠎⢩⣽⢉⣤⢻⡳⣀⠈⠑⠒⠒⠋⢻⣻⣿⣿⣽⣿⣛⢿⣿⣛⣿⣇⣀⣼⢣⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠖⠋⢫⣿⢡⣾⢞⣁⡼⢟⣨⠷⠀⣀⠽⠀⠀⠀⢀⣴⡖⠛⠋⠉⣉⣉⣉⡩⣍⡉⠛⢿⡛⠷⣦⣤⣬⣭⠼⠋⢀⣠⠪⣵⣒⣲⣒⣦⠀⠹⢟⣿⣻⣿⣹⣿⡿⣼⣧⣿⡆⡞⣸⣿⣹⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡮⣴⠂⣀⡀⠉⠻⣯⣳⣬⠶⠋⣡⢔⠋⢁⣠⠶⠞⠢⠄⠉⠻⣶⣄⠙⠫⣔⢿⡛⠒⢯⡲⣄⠈⠳⣄⠙⠻⡛⠻⠷⣦⣉⠈⠩⠀⣴⡟⢾⢯⣿⡿⣟⢿⣿⣯⣇⢢⢿⣿⣿⠟⣻⠙⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⢰⠏⣸⠏⣏⣓⣤⣿⣿⣷⣶⣿⣷⣧⣾⣭⣤⣠⣀⣀⢀⣀⢀⣀⠙⠳⣄⡈⠳⢭⠿⠭⠥⠾⠇⠀⢈⡦⠀⠘⠲⠒⠒⠛⠛⠲⠦⣿⣄⠋⠏⠩⠿⣿⣶⡎⠛⠿⣷⣿⣿⢃⠱⣯⣹⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣏⣿⢸⢀⣿⣶⡿⣿⡭⠯⠤⠤⠖⠒⠚⠛⠀⠃⠁⠈⠛⠛⠛⠛⠛⠛⠻⠷⠾⢿⣦⣄⣀⣤⣤⠤⠖⠊⠁⠀⣀⣀⠀⠠⡶⠶⠛⠛⠛⠛⠛⠷⣶⡶⠾⢿⣿⣿⡦⣤⣈⣻⣿⣦⣠⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⣼⣿⠘⣾⣿⠟⠋⠀⠘⠶⣤⣾⡁⠀⠀⠀⠀⢀⠄⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣟⣻⣿⣷⣾⣿⣏⣉⠈⢧⡀⠙⢦⠀⠛⣭⠿⢿⣧⠀⢻⣷⣵⡪⠿⣯⣽⣿⣽⠻⣟⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⢧⣿⣿⣿⠟⠀⠀⠀⠀⠀⠘⠿⡁⠀⠀⠀⠀⡿⣼⣿⣿⣿⣿⣿⣿⣧⣤⣤⣀⠀⠀⠀⠹⣄⠀⠀⠀⠉⠙⠻⢿⡼⢿⣧⣄⣈⣧⡀⠸⡟⠛⢋⡇⠈⣇⠁⢿⠃⣌⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⡏⠀⠀⠀⠀⢀⣀⠀⠀⠱⡄⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⣿⠀⠀⠀⡀⠀⠀⠀⠀⠈⠤⣉⡿⢿⣷⣄⡀⠀⢀⣀⡠⠼⠀⠀⠁⠀⠈⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢀⢀⣤⣶⣷⣾⣿⣷⡄⠀⡇⠀⠠⢄⠀⠀⢻⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⢿⣄⠀⢀⣤⡶⠂⠠⠖⠀⠒⠠⠍⠑⠫⢝⡻⣯⣁⣀⣀⣠⣤⣄⠀⣾⠋⣉⣙⢿⣿⢿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⣶⣿⣿⣿⣿⣿⣿⣿⠿⠀⢀⠀⠀⠀⣷⠤⣾⢇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⢻⣧⣤⡸⣷⠀⠀⠀⠀⠀⢀⡀⠀⠙⠁⠉⠒⠽⡿⣯⣭⣀⠸⡄⠸⡆⢽⣿⣇⢷⣾⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⢀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⡌⠀⠀⠈⣿⣟⣻⣿⣿⣇⣯⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠈⣻⠟⣿⣞⡀⠀⢠⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠈⠑⠻⣿⣷⣧⣄⣷⢸⣿⣿⡼⣽⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⠻⣿⡟⣽⣿⣯⣻⣿⣧⣼⠀⠀⠀⠀⠘⠻⢿⣾⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣾⣿⢰⣿⣿⣧⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣾⡟⡻⠇⣟⣹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢿⢯⣿⣿⠿⣿⣿⣿⣿⠀⠀⢳⡀⠀⠀⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠃⠀⠀⢾⣿⣿⣿⣯⣉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢮⣿⣿⣷⣊⢿⣽⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠀⣸⣿⠁⠀⠀⢻⣿⣿⣿⣷⠀⢸⠁⠀⠀⠀⡀⡀⠀⠈⠉⠛⠛⠛⠋⠀⠀⠀⠀⠀⠈⠛⠛⢻⣿⣾⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠹⣿⣿⣷⡿⣽⡾⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠀⠀⡿⠏⠀⠀⠀⢸⣿⢿⣿⡿⠀⠀⠀⠈⠰⠀⣿⡿⠆⠀⠈⠙⠒⣶⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⣿⡗⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠘⡇⠀⠀⠀⠀⢸⡇⠀⠙⠃⠀⠀⠀⠀⠀⠻⠍⠀⠀⠀⠀⠀⠀⠈⠓⢀⠀⠀⠀⠀⠀⢀⣠⣀⣤⣶⣦⣾⠹⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠺⣽⣿⡿⢿⢷⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠁⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⠀⠀⠀⢀⣶⣿⡧⣤⣤⣨⣿⠷⠴⣋⡀⠈⠓⠒⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢡⣝⢻⣿⣷⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣿⣆⠀⣤⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠈⠀⣀⣴⣟⣿⣿⣿⣝⡿⢯⡿⢷⣿⣿⣷⢀⣴⣿⢷⣆⠀⠀⠁⠒⠢⠄⠤⢖⢻⢿⡾⣬⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠛⠻⣶⠇⠀⠀⠀⠀⠀⠀⠀⠀⠹⠛⠂⠀⠀⠀⠀⠀⢀⠎⠁⠁⢾⣧⣶⡾⠟⠻⢿⣿⡿⠋⠁⠀⡼⠁⣈⠋⠙⣟⣾⡟⠻⠻⣟⠀⠀⢠⠄⠉⠀⡀⠘⣜⣰⡝⣯⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣫⣿⢶⡟⠀⣿⠀⢰⡄⠀⢀⡀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⢸⣿⠀⢁⠀⠐⣆⠀⠀⠀⢀⣾⡿⣴⣳⣙⠾⠊⠹⣆⠀⠐⠃⠀⠀⢸⠀⠄⡳⣷⡿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⢇⣃⣸⣅⣠⣇⣀⣼⡁⢀⡿⢀⣤⣠⣀⡀⠀⢀⣇⣀⣶⣼⣿⣿⠀⠀⢧⠀⠈⠧⠀⠀⣽⠿⣶⣿⣿⣿⣷⠘⠓⠁⠀⢀⣤⠀⢀⣼⢳⡻⢐⣿⣽⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡞⡿⠛⡟⢹⠟⣿⠛⣿⠿⢿⣧⣼⣅⣤⣸⡏⠉⣿⠀⢹⣿⣿⣿⣿⠀⠀⠘⡆⠀⠀⠀⢠⣿⣻⡿⡟⣿⣼⣏⠀⣇⣰⣶⣿⣿⣿⡟⢏⠉⣴⣿⣿⣾⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠇⠘⠀⢁⡚⠀⠇⠀⠿⠀⣼⡇⠈⢹⡟⠉⢻⣿⠿⠿⣿⠏⣿⣿⡟⠀⢰⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⢿⡟⣿⣿⣿⣿⣿⣿⣿⣷⣾⣧⣿⣿⣿⢿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⢾⠀⢰⣦⢡⡌⠒⢲⡄⠀⡤⠀⠀⢈⠁⠀⠸⠇⠀⠛⠛⠛⢉⡞⠀⠀⡝⠀⠀⠀⢠⡶⢟⣿⣿⣿⣟⣲⣿⠿⣛⣯⣳⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠃⠀⠁⠀⢸⠁⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠋⠀⠀⣴⠇⠀⠀⠼⠁⠐⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣺⢿⣿⣾⣿⣿⣿⣛⣿⣟⣁⣀⠠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⠿⠟⣟⣫⡅⠮⠡⠁⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠀⠀⠀⠀⣀⣾⢻⣿⣿⣿⣿⣿⣿⣿⠟⠟⡿⠏⠏⠈⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⢠⣤⣤⣤⣤⡤⠤⠤⠠⠤⣤⣖⣒⣚⣘⣛⣓⣒⣓⣷⣤⣶⣾⣤⣤⣤⣤⣾⣿⢿⡿⣿⣧⢿⣿⣿⡿⠟⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣞⣯⣶⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠿⢾⣿⣿⣟⣜⣿⣿⠟⠋⠉⠀⠀⠀⠈⠋⠻⠿⠿⠞⠛⠛⠛⠋⠉⠉⠉⠉⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

                        ]]
                    },
                    {
                        pane = 2,
                        padding = { 14, 1 }, -- RULE: More top gap so content doesn't start too high
                        
                        -- Quick Actions heading with gap above
                        {
                            text = "",
                            padding = { 1, 0 },
                        },
                        {
                            text = "Quick Actions",
                            hl = "@comment",
                            padding = 0,
                            align = "left",
                        },
                        
                        -- Spacer after Quick Actions
                        {
                            text = "",
                            padding = { 0, 0 },
                        },
                        
                        -- FILES & SEARCH GROUP (Blue)
                        {
                            gap = 0,
                            padding = 1,
                            indent = 2, -- Reduced indent for better alignment
                            hl = "@function", -- Blue
                            {
                                icon = "󰈞 ",
                                desc = "Find Files",
                                key = "f",
                                action = function() require("snacks.dashboard").pick('files') end,
                            },
                            {
                                icon = "󰝒 ",
                                desc = "New File",
                                key = "n",
                                action = ":ene | startinsert",
                            },
                            {
                                icon = "󰍉 ",
                                desc = "Find Text",
                                key = "g",
                                action = function() require("snacks.dashboard").pick('live_grep') end,
                            },
                            {
                                icon = "󰋚 ",
                                desc = "Recent Files", 
                                key = "r",
                                action = function() require("snacks.dashboard").pick('oldfiles') end,
                            },
                        },
                        
                        -- Small spacer
                        {
                            align = "left",
                            text = { "" },
                            padding = 0,
                        },
                        
                        -- PACKAGE MANAGEMENT GROUP (Purple)
                        {
                            gap = 0,
                            padding = 1,
                            indent = 2, -- Reduced indent for better alignment
                            hl = "@keyword", -- Purple
                            {
                                icon = "󰒲 ",
                                desc = "Lazy",
                                key = "l",
                                action = ":Lazy",
                            },
                            {
                                icon = "󰆎 ",
                                desc = "Mason",
                                key = "m",
                                action = ":Mason",
                            },
                            {
                                icon = "󰏗 ",
                                desc = "Mason Install",
                                key = "i",
                                action = function()
                                    vim.cmd("Mason")
                                end,
                            },
                            {
                                icon = "󰄵 ",
                                desc = "Update All",
                                key = "u",
                                action = function()
                                    vim.cmd("Lazy sync")
                                    vim.cmd("MasonUpdate")
                                end,
                            },
                        },
                        
                        -- Small spacer
                        {
                            align = "left",
                            text = { "" },
                            padding = 0,
                        },
                        
                        -- CONFIGURATION GROUP (Green)
                        {
                            gap = 0,
                            padding = 1,
                            indent = 2, -- Reduced indent for better alignment
                            hl = "@string", -- Green
                            {
                                icon = "󰑸 ",
                                desc = "Config",
                                key = "c",
                                action = function() require("snacks.dashboard").pick('files', {cwd = vim.fn.stdpath('config')}) end,
                            },
                            {
                                icon = "󰃢 ",
                                desc = "Colorscheme",
                                key = "C",
                                action = ":Telescope colorscheme",
                            },
                            {
                                icon = "󰙗 ",
                                desc = "Health Check",
                                key = "h",
                                action = ":checkhealth",
                            },
                            {
                                icon = "󰆌 ",
                                desc = "Options",
                                key = "o",
                                action = ":Telescope vim_options",
                            },
                        },
                        
                        -- Small spacer
                        {
                            align = "left",
                            text = { "" },
                            padding = 0,
                        },
                        
                        -- SYSTEM & TOOLS GROUP (Orange)
                        {
                            gap = 0,
                            padding = 1,
                            indent = 2, -- Reduced indent for better alignment
                            hl = "@type", -- Orange
                            {
                                icon = "󰈆 ",
                                desc = "Terminal",
                                key = "t",
                                action = ":terminal",
                            },
                            {
                                icon = "󰀋 ",
                                desc = "Session",
                                key = "s",
                                action = function() require("snacks.dashboard").pick('sessions') end,
                            },
                            {
                                icon = "󰂾 ",
                                desc = "Dashboard",
                                key = "d",
                                action = function() require("snacks").dashboard.open() end,
                            },
                            {
                                icon = "󰩈 ",
                                desc = "Quit",
                                key = "q",
                                action = ":qa",
                            },
                        },
                        
                        -- Spacer before recent files
                        {
                            align = "left",
                            text = { "" },
                            padding = 0,
                        },
                        
                        -- RULE: Recent files heading with gap above, newline after, newline before startup

                        {
                            text = "Recent Files",
                            hl = "@comment",
                            align = "left",
                            padding = { 0, 0 },
                        },
                        {
                            text = "",
                            padding = { 0, 0 },
                        },
                        -- Recent files list (up to 25, correct numbering)
                        {
                            section = "recent_files",
                            indent = 2,
                            padding = 0,
                            limit = 25, -- RULE: Show up to 25 files
                            file = function(file, idx)
                                -- RULE: Correct count beyond 9 (no random alphabets)
                                local key = (idx <= 9 and tostring(idx)) or (idx == 10 and "0") or ""
                                return {
                                    icon = "󰈔",
                                    key = key,
                                    action = function() vim.cmd('edit ' .. file) end,
                                    desc = string.format("%2d. %-60s", idx, file),
                                }
                            end,
                        },
                        {
                            text = "",
                            padding = { 1, 0 },
                        },
                        { section = "startup" },
                    },
                },
            },

            -- Basic notifier with safe settings
            notifier = {
                enabled = false,
            },
            
            -- ═══════════════════════════════════════════════════════════
            -- 🍿 GROUP A: SAFE UTILITIES (Added feature by feature)
            -- ═══════════════════════════════════════════════════════════
            
            -- 1️⃣ BIGFILE: Auto-optimize for large files (>1.5MB)
            bigfile = {
                enabled = true,
                notify = true,
                size = 1.5 * 1024 * 1024, -- 1.5MB threshold
                setup = function(ctx)
                    -- Disable heavy features for large files
                    vim.schedule(function()
                        vim.bo[ctx.buf].syntax = ctx.ft
                    end)
                end,
            },
            
            -- 2️⃣ BUFDELETE: Smart buffer deletion without disrupting layout
            bufdelete = { 
                enabled = true 
            },
            
            -- 3️⃣ DEBUG: Developer tools - inspect & backtrace
            debug = { 
                enabled = true 
            },
            
            -- 4️⃣ GITBROWSE: Open file/commit in browser (GitHub, GitLab, etc)
            gitbrowse = { 
                enabled = true 
            },
            
            -- 5️⃣ PROFILER: Performance profiling for Neovim
            profiler = { 
                enabled = true 
            },
            
            -- 6️⃣ QUICKFILE: Fast file rendering before plugins load
            quickfile = { 
                enabled = true 
            },
            
            -- 7️⃣ RENAME: LSP-integrated file renaming
            rename = { 
                enabled = true 
            },
            
            -- 8️⃣ SCRATCH: Persistent scratch buffers
            scratch = {
                enabled = true,
                name = "scratch",
                ft = function()
                    if vim.bo.buftype == "" and vim.bo.filetype == "" then
                        return "markdown"
                    end
                    return vim.bo.filetype
                end,
                icon = "📝",
                root = vim.fn.stdpath("data") .. "/scratch",
            },
            
            -- ═══════════════════════════════════════════════════════════
            -- 🎨 GROUP B: VISUAL ENHANCEMENTS (Added feature by feature)
            -- ═══════════════════════════════════════════════════════════
            
            -- 9️⃣ ANIMATE: Animation library for smooth UI transitions
            animate = {
                enabled = false,
                duration = 20,
                easing = "linear",
                fps = 60,
            },
            
            -- 🔟 DIM: Focus on active scope by dimming inactive code
            dim = {
                enabled = false,
                scope = {
                    min_size = 5,
                    max_size = 20,
                    siblings = true,
                },
                animate = {
                    enabled = vim.fn.has("nvim-0.10") == 1,
                    easing = "outQuad",
                    duration = {
                        step = 10,
                        total = 300,
                    },
                },
            },
            
            -- 1️⃣1️⃣ SCROLL: Smooth scrolling with animations
            scroll = {
                enabled = false,
                animate = {
                    duration = { step = 15, total = 250 },
                    easing = "linear",
                },
                spamming = 10,
            },
            
            -- 1️⃣2️⃣ STATUSCOLUMN: Enhanced status column with git/marks/folds
            statuscolumn = {
                enabled = false,
                left = { "mark", "sign" },
                right = { "fold", "git" },
                folds = {
                    open = true,
                    git_hl = false,
                },
                git = {
                    patterns = { "GitSign", "MiniDiffSign" },
                },
                refresh = 50,
            },
            
            -- 1️⃣3️⃣ WORDS: Auto-show LSP references + quick navigation
            words = {
                enabled = false,
                debounce = 200,
                notify_jump = false,
                notify_end = true,
                foldopen = true,
                jumplist = true,
                modes = { "n", "i", "c" },
            },
            
            -- TOGGLE: Required for dim/scroll toggles (also useful for other toggles)
            toggle = {
                enabled = false,
                which_key = true,
                notify = true,
                map = vim.keymap.set,
            },
            
            -- ═══════════════════════════════════════════════════════════
            -- 🚀 GROUP C: ADVANCED FEATURES (Added with care)
            -- ═══════════════════════════════════════════════════════════
            
            -- 1️⃣4️⃣ LAYOUT: Window layout management
            layout = {
                enabled = false,
                preset = {
                    float = {
                        backdrop = 60,
                    },
                    split = {
                        wo = {
                            winbar = "",
                        },
                    },
                },
            },
            
            -- 1️⃣5️⃣ LAZYGIT: LazyGit integration with colorscheme sync
            lazygit = {
                enabled = false,
                configure = true, -- Auto-configure colorscheme
                theme = {
                    [241]                      = { fg = "Special" },
                    activeBorderColor          = { fg = "MatchParen", bold = true },
                    cherryPickedCommitBgColor  = { fg = "Identifier" },
                    cherryPickedCommitFgColor  = { fg = "Function" },
                    defaultFgColor             = { fg = "Normal" },
                    inactiveBorderColor        = { fg = "FloatBorder" },
                    optionsTextColor           = { fg = "Function" },
                    searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                    selectedLineBgColor        = { bg = "Visual" },
                    unstagedChangesColor       = { fg = "DiagnosticError" },
                },
                win = {
                    style = "lazygit",
                    position = "float",
                    backdrop = 60,
                    height = 0.9,
                    width = 0.9,
                    zindex = 50,
                    border = "rounded",
                },
            },
            
            -- 1️⃣6️⃣ SCOPE: Scope detection and text objects
            scope = {
                enabled = false,
                keys = {
                    textobjects = true,
                },
            },
            
            -- 1️⃣7️⃣ EXPLORER: Modern file explorer (replaces neo-tree)
            explorer = {
                enabled = true,
                filter = function(file)
                    -- Hide common unwanted files
                    local name = vim.fn.fnamemodify(file, ":t")
                    return not vim.tbl_contains({
                        ".DS_Store",
                        "thumbs.db",
                        ".git",
                        "node_modules",
                        "__pycache__",
                    }, name)
                end,
            },

            -- Enable other features safely
            styles = {
                dashboard = {
                    fixbuf = false,
                    wo = {
                        number = false,
                        relativenumber = false,
                        cursorline = false,  -- Disable cursorline on dashboard
                        cursorcolumn = false, -- Disable cursorcolumn on dashboard
                        wrap = false,
                        scrolloff = 0,
                        sidescrolloff = 0,
                        signcolumn = "no",
                        spell = false,
                        statuscolumn = "",
                        list = false,
                        colorcolumn = "",
                        foldmethod = "manual",
                        scrollbind = false,
                    },
                    bo = {
                        modifiable = false,
                        bufhidden = "wipe",
                        buftype = "nofile",
                        buflisted = false,
                        swapfile = false,
                        undofile = false,
                        readonly = true,
                    },
                },
            },
        })

        -- Open-only mapping: avoids toggling/session side-effects
        vim.keymap.set('n', '<leader>0', function()
            if vim.bo.filetype ~= 'snacks_dashboard' then
                snacks.dashboard.open()
            end
        end, { desc = 'Open Dashboard' })
        
        -- Setup keymaps (dashboard only)
        vim.keymap.set("n", "<leader>db", function()
            snacks.dashboard.open()
        end, { desc = "Open Dashboard" })

        -- Dashboard setup - minimal restrictions, allow normal navigation
        local dashboard_group = vim.api.nvim_create_augroup("SnacksDashboardSetup", { clear = true })
        
        vim.api.nvim_create_autocmd("FileType", {
            group = dashboard_group,
            pattern = "snacks_dashboard",
            callback = function(ev)
                local buf = ev.buf
                
                if not buf or not vim.api.nvim_buf_is_valid(buf) then
                    return
                end
                
                vim.schedule(function()
                    if not vim.api.nvim_buf_is_valid(buf) then
                        return
                    end
                    
                    local wins = vim.fn.win_findbuf(buf)
                    if #wins == 0 then
                        return
                    end
                    local win = wins[1]
                    
                    if not win or not vim.api.nvim_win_is_valid(win) then
                        return
                    end
                    
                    -- Only set minimal window options for clean look
                    pcall(function()
                        vim.wo[win].number = false
                        vim.wo[win].relativenumber = false
                        vim.wo[win].signcolumn = 'no'
                        vim.wo[win].cursorline = false
                        vim.wo[win].cursorcolumn = false
                    end)

                    -- Dashboard interaction lockdown: disable mouse & editing on dashboard
                    vim.b[buf]._prev_mouse = vim.o.mouse
                    vim.o.mouse = ''
                    local opts = { buffer = buf, silent = true, nowait = true }
                    -- Block editing/selecting/copy/paste keys; keep only navigation
                    for _, lhs in ipairs({ 'i','a','o','O','c','v','V','<C-v>','y','Y','p','P','d','x','s','S' }) do
                        vim.keymap.set('n', lhs, '<Nop>', opts)
                    end
                end)
            end,
        })
        
        -- Restore mouse and make sure tabline returns when leaving dashboard
        vim.api.nvim_create_autocmd("BufLeave", {
            group = dashboard_group,
            callback = function(ev)
                if vim.bo[ev.buf].filetype == 'snacks_dashboard' then
                    if vim.b[ev.buf]._prev_mouse ~= nil then
                        vim.o.mouse = vim.b[ev.buf]._prev_mouse
                        vim.b[ev.buf]._prev_mouse = nil
                    end
                    vim.schedule(function() vim.o.showtabline = 2 end)
                end
            end,
        })
        
        -- No need to restore anything - dashboard doesn't override global settings anymore
        
        -- Style the explorer and input to match theme
        local theme_group = vim.api.nvim_create_augroup("SnacksThemeIntegration", { clear = true })
        
        vim.api.nvim_create_autocmd({"FileType", "ColorScheme"}, {
            group = theme_group,
            pattern = {"snacks_input", "snacks_explorer", "*"},
            callback = function()
                -- Get current colorscheme colors
                local colors = {}
                if vim.g.colors_name and vim.g.colors_name:match("catppuccin") then
                    local ok, palette = pcall(require, "catppuccin.palettes")
                    if ok then
                        colors = palette.get_palette("mocha")
                    end
                end
                
                -- Fallback colors if catppuccin not loaded
                if not colors.blue then
                    colors = {
                        blue = "#89b4fa",
                        mauve = "#cba6f7",
                        lavender = "#b4befe",
                        surface0 = "#313244",
                        surface1 = "#45475a",
                        text = "#cdd6f4",
                        subtext1 = "#bac2de",
                    }
                end
                
                -- Style the input and explorer to remove orange and use theme colors
                vim.api.nvim_set_hl(0, "SnacksInputBorder", { fg = colors.lavender, bg = "NONE" })
                vim.api.nvim_set_hl(0, "SnacksInputNormal", { fg = colors.text, bg = colors.surface0 })
                vim.api.nvim_set_hl(0, "SnacksInputTitle", { fg = colors.mauve, bold = true })
                
                -- Explorer specific highlights - FORCE override orange
                vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.lavender, bg = "NONE" })
                vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = colors.mauve, bold = true })
                vim.api.nvim_set_hl(0, "SnacksExplorerBorder", { fg = colors.lavender, bg = "NONE" })
                vim.api.nvim_set_hl(0, "SnacksExplorerTitle", { fg = colors.mauve, bold = true })
                vim.api.nvim_set_hl(0, "SnacksExplorerDir", { fg = colors.blue, bold = true })
                vim.api.nvim_set_hl(0, "SnacksExplorerFile", { fg = colors.text })
                vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.lavender, bg = "NONE" })
                vim.api.nvim_set_hl(0, "FloatTitle", { fg = colors.mauve, bold = true })
            end,
        })

    end,
    
    init = function()
        -- Disable default vim intro
        vim.opt.shortmess:append("I")
        
        -- Setup debug global functions
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup globals for debugging (lazy-loaded)
                local okS, S = pcall(require, 'snacks')
                if okS and S.debug then
                    _G.dd = function(...)
                        S.debug.inspect(...)
                    end
                    _G.bt = function()
                        S.debug.backtrace()
                    end
                end
                
                -- Override print for `:=` command
                if vim.fn.has("nvim-0.11") == 1 then
                    vim._print = function(_, ...)
                        dd(...)
                    end
                else
                    vim.print = _G.dd
                end
            end,
        })
        
        -- CRITICAL: Dashboard must load AFTER all plugins to avoid buffer conflicts
        if vim.fn.argc() == 0 then
            local startup_group = vim.api.nvim_create_augroup("SnacksDashboardStartup", { clear = true })
            
            vim.api.nvim_create_autocmd("User", {
                group = startup_group,
                pattern = "VeryLazy",
                once = true,
                callback = function()
                    vim.defer_fn(function()
                        local current_buf = vim.api.nvim_get_current_buf()
                        if not vim.api.nvim_buf_is_valid(current_buf) then
                            return
                        end
                        
                        local bufname = vim.api.nvim_buf_get_name(current_buf)
                        local buftype = vim.bo[current_buf].buftype
                        local filetype = vim.bo[current_buf].filetype
                        
                        if bufname == "" and 
                           (buftype == "" or buftype == "nofile") and
                           filetype ~= "snacks_dashboard" then
                            
                            vim.schedule(function()
                                local snacks_ok, snacks = pcall(require, "snacks")
                                if snacks_ok and snacks.dashboard then
                                    -- Safely open dashboard with error handling
                                    local ok, err = pcall(snacks.dashboard.open)
                                    if not ok then
                                        vim.notify("Dashboard failed to open: " .. tostring(err), vim.log.levels.WARN)
                                    end
                                end
                            end)
                        end
                    end, 200)
                end,
            })
        end
    end,
}
