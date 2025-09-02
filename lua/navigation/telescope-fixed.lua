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
        
        -- Search patterns
        { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "🔍 Search in Buffer" },
        { "<leader>f/", "<cmd>Telescope search_history<cr>", desc = "🔍 Search History" },
    },
    opts = function()
        local actions = require("telescope.actions")
        
        return {
            defaults = (function()
                local actions_state = require("telescope.actions.state")
                local function open_with_image_nvim(prompt_bufnr)
                    local entry = actions_state.get_selected_entry()
                    if not entry or not entry.path then return end
                    actions.close(prompt_bufnr)
                    vim.schedule(function()
                        vim.cmd("tabnew")
                        local win = vim.api.nvim_get_current_win()
                        local buf = vim.api.nvim_get_current_buf()
                        local ok, image_api = pcall(require, "image")
                        if ok and image_api and image_api.hijack_buffer then
                            image_api.hijack_buffer(entry.path, win, buf, {
                                max_width_window_percentage = 100,
                                max_height_window_percentage = 100,
                            })
                        else
                            vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
                        end
                    end)
                end
                return {
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
                        ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
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
                        ["p"] = require("telescope.actions.layout").toggle_preview,
                    },
                },
                
            }
            end)(),
            
            pickers = {
                find_files = {
                    hidden = false,
                    find_command = (function()
                        local excludes = {
                            ".git", "node_modules", ".next", "dist", "build", ".cache", ".cache/fastfetch",
                        }
                        if vim.fn.executable("fd") == 1 then
                            local cmd = { "fd", "--type", "f", "--strip-cwd-prefix" }
                            for _, e in ipairs(excludes) do table.insert(cmd, "--exclude"); table.insert(cmd, e) end
                            return cmd
                        else
                            local cmd = { "rg", "--files" }
                            local function add_glob(g) table.insert(cmd, "--glob"); table.insert(cmd, g) end
                            add_glob("!**/.git/*"); add_glob("!**/node_modules/*"); add_glob("!**/.next/*");
                            add_glob("!**/dist/*"); add_glob("!**/build/*"); add_glob("!**/.cache/**"); add_glob("!**/.cache/fastfetch/**")
                            return cmd
                        end
                    end)(),
                    previewer = false,
                },
                
                live_grep = {
                    additional_args = function()
                        return {}
                    end,
                    previewer = false,
                },
                
                grep_string = {
                    additional_args = function()
                        return {}
                    end,
                    previewer = false,
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


        
        -- Load extensions (lightweight)
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
        telescope.load_extension("file_browser")
        
        vim.notify("🔭 Telescope ready.", vim.log.levels.INFO, { title = "🔍 Search" })
    end,
}
