-- ═══════════════════════════════════════════════════════════════════════════════
--  🔣 DEVICONS ULTRA - Vivid, larger, and expressive icons
-- ═══════════════════════════════════════════════════════════════════════════════

return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  priority = 1100,
  config = function()
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if not ok then return end

    devicons.setup({
      color_icons = true,
      default = true,
      strict = true,
      override = {},
    })

    -- Set a valid hex color for the default icon to satisfy strict validation
    devicons.set_default_icon("󰈙", "#89b4fa")

    devicons.set_icon({
      -- Common languages and config files with more vibrant colors
      lua        = { icon = "", color = "#51a0cf", name = "Lua" },
      rs         = { icon = "", color = "#dea584", name = "Rust" },
      ts         = { icon = "", color = "#519aba", name = "TypeScript" },
      tsx        = { icon = "", color = "#519aba", name = "TSX" },
      js         = { icon = "", color = "#e7d74b", name = "JavaScript" },
      jsx        = { icon = "", color = "#61dafb", name = "JSX" },
      json       = { icon = "", color = "#cbcb41", name = "JSON" },
      toml       = { icon = "", color = "#8fbf7f", name = "TOML" },
      lock       = { icon = "", color = "#a3b8ef", name = "Lock" },
      gitignore  = { icon = "", color = "#f14c28", name = "GitIgnore" },
      md         = { icon = "", color = "#519aba", name = "Markdown" },
      png        = { icon = "", color = "#a074c4", name = "Png" },
      jpg        = { icon = "", color = "#a074c4", name = "Jpg" },
      jpeg       = { icon = "", color = "#a074c4", name = "Jpeg" },
      svg        = { icon = "󰜡", color = "#ffb703", name = "Svg" },
      html       = { icon = "", color = "#e34c26", name = "Html" },
      css        = { icon = "", color = "#563d7c", name = "Css" },
      scss       = { icon = "", color = "#c6538c", name = "Scss" },
      go         = { icon = "", color = "#519aba", name = "Go" },
      py         = { icon = "", color = "#ffbc03", name = "Python" },
      sh         = { icon = "", color = "#89e051", name = "Shell" },
      zsh        = { icon = "", color = "#89e051", name = "Zsh" },
      vim        = { icon = "", color = "#019833", name = "Vim" },
      lockfile   = { icon = "", color = "#a3b8ef", name = "Lockfile" },

      -- Package managers
      ["package.json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
      ["yarn.lock"]    = { icon = "", color = "#2c8ebb", name = "YarnLock" },
      ["pnpm-lock.yaml"] = { icon = "", color = "#ffc53d", name = "PnpmLock" },

      -- Project files
      [".env"]       = { icon = "", color = "#00bfa5", name = "DotEnv" },
      [".gitignore"] = { icon = "", color = "#f14c28", name = "GitIgnore" },
      [".prettierrc"] = { icon = "", color = "#ff69b4", name = "Prettier" },
      ["tsconfig.json"] = { icon = "", color = "#519aba", name = "TSConfig" },
      ["tailwind.config.js"] = { icon = "󱏿", color = "#38bdf8", name = "Tailwind" },
      ["postcss.config.js"] = { icon = "", color = "#dd3a0a", name = "PostCSS" },
    })
  end,
}

