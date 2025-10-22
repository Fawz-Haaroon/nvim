-- 🔍 Luacheck Configuration for Neovim Lua Code

std = "luajit+nvim"
max_line_length = 120
codes = true

-- Global variables defined by Neovim
globals = {
    "vim",
    "P", -- debug print
    "dd", -- snacks debug
    "bt", -- snacks backtrace
}

-- Per-file exceptions
exclude_files = {
    ".git",
    ".local",
    "snacks.nvim",
    "lazy-lock.json",
}

-- Ignore certain warnings in specific directories
ignore = { "212", "122" } -- unused args, indirect mutation
