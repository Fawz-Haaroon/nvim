return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<M-CR>",
        next = "]]",
        prev = "[[",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = false },
  },
}
