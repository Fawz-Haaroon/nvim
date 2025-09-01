-- ═══════════════════════════════════════════════════════════════════════════════
--  🏃 OVERSEER - Task runner (builds, tests, commands)
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle", "OverseerOpen", "OverseerClose", "OverseerBuild" },
  opts = {
    strategy = "toggleterm",
    task_list = { direction = "bottom", bindings = { ["<C-s>"] = false } },
  },
}
