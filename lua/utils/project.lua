return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  opts = {
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "package.json", "pyproject.toml", "Cargo.toml", "go.mod", "Makefile", "setup.py", ".hg", ".svn" },
    manual_mode = false,
    show_hidden = true,
    silent_chdir = true,
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    pcall(require("telescope").load_extension, "projects")
  end,
}
