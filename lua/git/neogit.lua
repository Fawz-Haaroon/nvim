return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
  opts = {
    integrations = { diffview = true },
    disable_commit_confirmation = true,
  },
}
