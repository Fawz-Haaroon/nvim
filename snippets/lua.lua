-- ═══════════════════════════════════════════════════════════════════════════════
--  ✨ CUSTOM LUA SNIPPETS - Neovim Configuration Helpers
-- ═══════════════════════════════════════════════════════════════════════════════

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- Neovim plugin spec snippet
    s("plugin", {
        t("return {"), t({"", "    \""}), i(1, "author/repo"), t("\","), 
        t({"", "    event = \""}), i(2, "VeryLazy"), t("\","),
        t({"", "    config = function()", "        -- TODO: Configure plugin", "    end,", "}"}),
    }),
    
    -- Keymap snippet
    s("keymap", {
        t("vim.keymap.set(\""), i(1, "n"), t("\", \""), i(2, "<leader>"), 
        t("\", \""), i(3, "<cmd>"), t("\", { desc = \""), i(4, "Description"), t("\" })"),
    }),
    
    -- Autocmd snippet
    s("autocmd", {
        t("vim.api.nvim_create_autocmd(\""), i(1, "BufEnter"), t("\", {"),
        t({"", "    callback = function()", "        "}), i(2, "-- TODO: Implementation"),
        t({"", "    end,", "})"})
    }),
    
    -- Header comment
    s("header", {
        t("-- ═══════════════════════════════════════════════════════════════════════════════"),
        t({"", "--  "}), i(1, "📦 TITLE"), t(" - "), i(2, "Description"),
        t({"", "-- ═══════════════════════════════════════════════════════════════════════════════", ""})
    })
}
