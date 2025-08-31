-- ═══════════════════════════════════════════════════════════════════════════════
--  🔭 TELESCOPE FIXED - Complete with Image Preview & All Features
-- ═══════════════════════════════════════════════════════════════════════════════

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-media-files.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } },
    },
    cmd = "Telescope",
    keys = {
        -- File operations
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "🔍 Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "🔎 Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "📂 Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "🕒 Recent Files" },
        { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "🔤 Find String" },
        { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "📁 File Browser" },
        
        -- Code & LSP
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "🩺 Diagnostics" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "📊 Document Symbols" },
        { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "🏢 Workspace Symbols" },
        { "<leader>fR", "<cmd>Telescope lsp_references<cr>", desc = "🔗 References" },
        { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "⚙️ Implementations" },
        { "<leader>ft", "<cmd>Telescope lsp_type_definitions<cr>", desc = "📝 Type Definitions" },
        
        -- Help & Info
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "❓ Help Tags" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "⌨️ Keymaps" },
        { "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "📖 Man Pages" },
        { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "⚙️ Vim Options" },
        { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "💻 Commands" },
        { "<leader>fH", "<cmd>Telescope command_history<cr>", desc = "📜 Command History" },
        
        -- Git
        { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "🌿 Git Branches" },
        { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "📝 Git Commits" },
        { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "📊 Git Status" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "📂 Git Files" },
        
        -- Media & Images
        { "<leader>fp", "<cmd>Telescope media_files<cr>", desc = "🖼️ Media Files" },
        
        -- Search patterns
        { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "🔍 Search in Buffer" },
        { "<leader>f/", "<cmd>Telescope search_history<cr>", desc = "🔍 Search History" },
    },
    opts = function()
        local actions = require("telescope.actions")
        
        return {
            defaults = {
                prompt_prefix = " 🔍 ",
                selection_caret = " ➤ ",
                path_display = { "truncate" },
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.90,
                    height = 0.85,
                    preview_cutoff = 120,
                },
                
                -- Enhanced file ignore patterns
                file_ignore_patterns = {
                    "node_modules",
                    ".git/",
                    "%.o",
                    "%.a",
                    "%.out",
                    "%.class",
                    "%.pdf",
                    "%.mkv",
                    "%.mp4",
                    "%.zip",
                },
                
                mappings = {
                    i = {
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-c>"] = actions.close,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["<C-l>"] = actions.complete_tag,
                        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-t>"] = actions.select_tab,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["H"] = actions.move_to_top,
                        ["M"] = actions.move_to_middle,
                        ["L"] = actions.move_to_bottom,
                        ["<Down>"] = actions.move_selection_next,
                        ["<Up>"] = actions.move_selection_previous,
                        ["gg"] = actions.move_to_top,
                        ["G"] = actions.move_to_bottom,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["?"] = actions.which_key,
                    },
                },
                
                -- Enhanced preview configuration
                preview = {
                    mime_hook = function(filepath, bufnr, opts)
                        local function file_ext(path)
                            return (path or ""):lower():match("%.([%w]+)$") or ""
                        end
                        local function is_image_ext(ext)
                            return vim.tbl_contains({ "png", "jpg", "jpeg", "gif", "webp", "avif", "svg", "bmp" }, ext)
                        end

                        local ext = file_ext(filepath)
                        if ext == "" then return end

                        local term = vim.api.nvim_open_term(bufnr, {})
                        local function send_lines(data)
                            if not data then return end
                            for _, d in ipairs(data) do
                                if d ~= "" then
                                    vim.api.nvim_chan_send(term, d .. "\r\n")
                                end
                            end
                        end

                        -- Manage preview jobs per buffer to avoid races
                        _G.__telescope_preview_jobs = _G.__telescope_preview_jobs or {}
                        local jobs = _G.__telescope_preview_jobs
                        if jobs[bufnr] then pcall(vim.fn.jobstop, jobs[bufnr]) end

                        -- Compute preview pane size
                        local wins = vim.fn.win_findbuf(bufnr)
                        local preview_win = (wins and wins[1]) or 0
                        local width = (preview_win ~= 0) and vim.api.nvim_win_get_width(preview_win) or math.floor(vim.o.columns * 0.5)
                        local height = (preview_win ~= 0) and vim.api.nvim_win_get_height(preview_win) or math.floor(vim.o.lines * 0.5)
                        width = math.max(10, width - 2)
                        height = math.max(5, height - 2)
                        local size_arg = string.format("%dx%d", width, height)

                        local function run(cmd_tbl, on_exit)
                            jobs[bufnr] = vim.fn.jobstart(cmd_tbl, {
                                stdout_buffered = false,
                                on_stdout = function(_, data, _)
                                    send_lines(data)
                                end,
                                on_exit = function(id, code)
                                    if on_exit then on_exit(id, code) end
                                    jobs[bufnr] = nil
                                end,
                            })
                        end

                        if is_image_ext(ext) and vim.fn.executable("chafa") == 1 then
                            run({ "chafa", "--size=" .. size_arg, "--animate=off", filepath })
                            return
                        end

                        if ext == "pdf" and vim.fn.executable("pdftoppm") == 1 and vim.fn.executable("chafa") == 1 then
                            local tmp_base = string.format("/tmp/ts_prev_%d", vim.loop.hrtime())
                            vim.fn.jobstart({ "pdftoppm", "-png", "-singlefile", "-f", "1", filepath, tmp_base }, {
                                on_exit = function(_, code)
                                    if code == 0 then
                                        run({ "chafa", "--size=" .. size_arg, tmp_base .. ".png" }, function()
                                            pcall(vim.loop.fs_unlink, tmp_base .. ".png")
                                        end)
                                    else
                                        send_lines({ "[pdftoppm failed]", filepath })
                                    end
                                end,
                            })
                            return
                        end

                        if vim.tbl_contains({ "mp4", "mkv", "webm", "mov", "avi" }, ext) and vim.fn.executable("ffmpeg") == 1 and vim.fn.executable("chafa") == 1 then
                            local tmp_img = string.format("/tmp/ts_prev_%d.jpg", vim.loop.hrtime())
                            vim.fn.jobstart({ "ffmpeg", "-y", "-loglevel", "error", "-ss", "1", "-i", filepath, "-frames:v", "1", tmp_img }, {
                                on_exit = function(_, code)
                                    if code == 0 then
                                        run({ "chafa", "--size=" .. size_arg, tmp_img }, function()
                                            pcall(vim.loop.fs_unlink, tmp_img)
                                        end)
                                    else
                                        send_lines({ "[ffmpeg failed]", filepath })
                                    end
                                end,
                            })
                            return
                        end

                        -- Fallback note
                        send_lines({ "[No previewer available for this type]", filepath })
                    end,
                },
            },
            
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = { 
                        "rg", 
                        "--files", 
                        "--hidden", 
                        "--glob", "!**/.git/*",
                        "--glob", "!**/node_modules/*",
                        "--glob", "!**/.next/*",
                        "--glob", "!**/dist/*",
                        "--glob", "!**/build/*"
                    },
                    previewer = true,
                },
                
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden", "--glob", "!**/.git/*" }
                    end,
                    previewer = true,
                },
                
                grep_string = {
                    additional_args = function(opts)
                        return { "--hidden", "--glob", "!**/.git/*" }
                    end,
                    previewer = true,
                },
                
                buffers = {
                    previewer = true,
                    sort_lastused = true,
                    sort_mru = true,
                    theme = "dropdown",
                },
                
                oldfiles = {
                    previewer = true,
                },
                
                lsp_references = {
                    previewer = true,
                    show_line = false,
                },
                
                lsp_definitions = {
                    previewer = true,
                    show_line = false,
                },
                
                lsp_document_symbols = {
                    previewer = true,
                },
                
                lsp_workspace_symbols = {
                    previewer = true,
                },
                
                diagnostics = {
                    previewer = true,
                    theme = "ivy",
                },
            },
            
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        width = 0.5,
                        prompt_title = "Select",
                        previewer = false,
                    })
                },
                
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg", "gif", "pdf", "mp4", "webm", "mov" },
                    find_cmd = "rg",
                },
                
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = false,
                    previewer = true,
                    mappings = {
                        ["i"] = {
                            ["<A-c>"] = require("telescope._extensions.file_browser.actions").create,
                            ["<A-r>"] = require("telescope._extensions.file_browser.actions").rename,
                            ["<A-m>"] = require("telescope._extensions.file_browser.actions").move,
                            ["<A-y>"] = require("telescope._extensions.file_browser.actions").copy,
                            ["<A-d>"] = require("telescope._extensions.file_browser.actions").remove,
                            ["<C-o>"] = require("telescope._extensions.file_browser.actions").open,
                            ["<C-g>"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                            ["<C-e>"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
                            ["<C-w>"] = require("telescope._extensions.file_browser.actions").goto_cwd,
                            ["<C-t>"] = require("telescope._extensions.file_browser.actions").change_cwd,
                            ["<C-f>"] = require("telescope._extensions.file_browser.actions").toggle_browser,
                            ["<C-h>"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
                            ["<C-s>"] = require("telescope._extensions.file_browser.actions").toggle_all,
                        },
                        ["n"] = {
                            ["c"] = require("telescope._extensions.file_browser.actions").create,
                            ["r"] = require("telescope._extensions.file_browser.actions").rename,
                            ["m"] = require("telescope._extensions.file_browser.actions").move,
                            ["y"] = require("telescope._extensions.file_browser.actions").copy,
                            ["d"] = require("telescope._extensions.file_browser.actions").remove,
                            ["o"] = require("telescope._extensions.file_browser.actions").open,
                            ["g"] = require("telescope._extensions.file_browser.actions").goto_parent_dir,
                            ["e"] = require("telescope._extensions.file_browser.actions").goto_home_dir,
                            ["w"] = require("telescope._extensions.file_browser.actions").goto_cwd,
                            ["t"] = require("telescope._extensions.file_browser.actions").change_cwd,
                            ["f"] = require("telescope._extensions.file_browser.actions").toggle_browser,
                            ["h"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
                            ["s"] = require("telescope._extensions.file_browser.actions").toggle_all,
                        },
                    },
                },
            },
        }
    end,
    
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
        
        -- Load all extensions
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("media_files")
        telescope.load_extension("file_browser")
        
        vim.notify("🔭 Telescope loaded with image preview!", vim.log.levels.INFO, { title = "🔍 Search" })
    end,
}
