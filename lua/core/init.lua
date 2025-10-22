-- ═══════════════════════════════════════════════════════════════════════════════
--  🌟 CORE MODULE - The Perfect Neovim Configuration
-- ═══════════════════════════════════════════════════════════════════════════════

local core_modules = {
    "core.options",      -- 🔧 Editor options & settings  
    "core.keymaps",      -- ⌨️  Basic keybindings & shortcuts
    "core.autocmds",     -- 🔄 Auto-commands & events
    "core.lazy",         -- 📦 Plugin manager bootstrap
}

-- Load core modules in order
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        vim.notify(
            string.format("❌ Failed to load %s:\n%s", module, err),
            vim.log.levels.ERROR,
            { title = "🚨 Core Loading Error" }
        )
    end
end

-- Load functional keymaps after plugins are available
vim.defer_fn(function()
    local functional_ok, functional_keymaps = pcall(require, "core.functional-keymaps")
    if functional_ok then
        functional_keymaps.setup()
    else
        vim.notify("⚠️  Functional keymaps not loaded", vim.log.levels.WARN, { title = "🔧 Keymaps" })
    end

    -- Ensure utility modules (commands) are available for keymaps
    pcall(require, "utils.workspaces")
    pcall(require, "utils.python-venv")
end, 100)

-- Core modules loaded silently

-- 📖 Quick docs: open the main Guide in a new tab
vim.api.nvim_create_user_command("Docs", function()
  local guide = vim.fn.stdpath('config') .. "/docs/Guide.md"
  vim.cmd("tabnew " .. vim.fn.fnameescape(guide))
end, { desc = "Open Neovim config guide (docs/Guide.md)" })
