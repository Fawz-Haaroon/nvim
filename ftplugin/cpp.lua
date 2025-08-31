-- ═══════════════════════════════════════════════════════════════════════════════
--  ⚡ C++ FILETYPE SETTINGS - Competitive Programming Optimized
-- ═══════════════════════════════════════════════════════════════════════════════

-- C++ specific settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.colorcolumn = "120"

-- Competitive programming keymaps
local opts = { buffer = true, silent = true }
vim.keymap.set("n", "<leader>cc", function()
    local filename = vim.fn.expand("%:r")
    vim.cmd("!g++ -std=c++23 -O2 -Wall -Wextra -o " .. filename .. " % && ./" .. filename)
end, vim.tbl_extend("force", opts, { desc = "Compile & Run C++" }))

vim.keymap.set("n", "<leader>cd", function()
    local filename = vim.fn.expand("%:r")
    vim.cmd("!g++ -std=c++23 -g -Wall -Wextra -o " .. filename .. "_debug % && gdb ./" .. filename .. "_debug")
end, vim.tbl_extend("force", opts, { desc = "Debug C++" }))

-- Insert competitive programming template
vim.keymap.set("n", "<leader>ct", function()
    local template = {
        "#include <bits/stdc++.h>",
        "using namespace std;",
        "",
        "#define ll long long",
        "#define vi vector<int>",
        "#define vll vector<long long>",
        "#define pii pair<int, int>",
        "#define pll pair<long long, long long>",
        "#define all(x) (x).begin(), (x).end()",
        "#define sz(x) (int)(x).size()",
        "",
        "void solve() {",
        "    // TODO: Implement solution",
        "}",
        "",
        "int main() {",
        "    ios_base::sync_with_stdio(false);",
        "    cin.tie(NULL);",
        "    ",
        "    int t = 1;",
        "    // cin >> t;",
        "    ",
        "    while (t--) {",
        "        solve();",
        "    }",
        "    ",
        "    return 0;",
        "}"
    }
    
    vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
    vim.cmd("12") -- Jump to TODO line
end, vim.tbl_extend("force", opts, { desc = "Insert CP template" }))
