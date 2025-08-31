return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  init = function()
    -- Use a dedicated leader so VM never steals Ctrl-hjkl
    vim.g.VM_leader = "<Space>m"
    vim.g.VM_set_statusline = 0

    -- Disable default mappings (which include <C-j>/<C-k> fallbacks in some terms)
    vim.g.VM_default_mappings = 0

    -- Recreate only the essential maps on non-conflicting keys
    -- Avoid Ctrl+Arrow and Ctrl-hjkl; keep them for resizing/navigation
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
      ["Select All"] = "<Space>ma",
      ["Skip Region"] = "<Space>ms",
      ["Remove Region"] = "<Space>md",
      ["Start Regex Search"] = "<Space>mr",
    }
  end,
}
