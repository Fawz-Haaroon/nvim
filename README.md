<p align="center">
  <br/>
  <img src="https://img.shields.io/badge/Neovim-0.10%2B-57A143?logo=neovim&logoColor=white" alt="Neovim"/>
  <img src="https://github.com/Fawz-Haaroon/nvim/actions/workflows/ci.yml/badge.svg" alt="CI"/>
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="MIT"/>
</p>

<h1 align="center">Lexitron.nvim</h1>
<p align="center">A luxurious, modern, batteries‑included Neovim IDE — fast, elegant, and ready in one command.</p>

<p align="center">
  <em>Catppuccin Mocha aesthetics • Rich UI • Instant LSP • Debugging • AI‑assisted completion • Thoughtful defaults</em>
</p>

---

## ✨ Why you’ll love it
- Beautiful out of the box (Catppuccin Mocha + curated highlights)
- IDE‑level experience: LSP, Treesitter, DAP, Telescope, Git UI, formatting, diagnostics
- Image‑aware: inline images in Kitty; previews (images/PDF/video) everywhere via chafa + poppler + ffmpeg
- One‑shot installer: sets up Neovim, fonts, toolchains, runtimes (Node/Python/Go/Java/Rust/…)
- Works across Linux distros (Arch, Debian/Ubuntu, Fedora/RHEL, openSUSE, Homebrew) — same look, same feel

## 🚀 Quick start (30 seconds)
```bash
# clone into your Neovim config and run the installer
git clone https://github.com/Fawz-Haaroon/nvim ~/.config/nvim
cd ~/.config/nvim && chmod +x install.sh && bash ./install.sh

# launch
nvim
```

More details: see docs/INSTALL.md

## 📚 Table of Contents
- 🌟 Highlights
- 🧰 Requirements
- 🗺️ Workflows & Keybindings
  - Text selection & indentation
  - Search & replace
  - Navigation & code
  - Editing & utilities
  - Formatting
- 🎨 Theme & Visuals (Tokyo Night base)
- ✅ Post‑install checks
- 🛠️ Troubleshooting
- 💡 Tips
- 🧪 Philosophy
- 🤝 Contributing
- 🛡️ Code of Conduct & Security
- 📜 License

## 🌟 Highlights
- Default theme: Tokyo Night (storm) with tuned Aerial/Navic symbol colors and curved UI
- Navigation: Telescope (+fzf, file browser, media previews), Neo‑tree, Oil, Harpoon
- Editing power: Treesitter, surround, autopairs, comment, multicursor, Spectre, todo‑comments
- Completion: Blink (with LuaSnip + friendly‑snippets)
- LSP: mason + lspconfig (TypeScript, Python, Go, Rust, Java, C/C++, Lua, PHP, Ruby, YAML/JSON, Docker, Terraform…)
- Formatting/Linting: Conform + Mason tools (Prettier, Black/Isort, Stylua, Go tools, Rustfmt, Shfmt, etc.)
- Debugging: nvim‑dap + UI (Python, C/C++ via codelldb, Go Delve, JS debug adapter)
- UI polish: Noice/Notify/Dressing, lualine with breadcrumbs, devicons, indent guides, custom tabline, minimap, zen mode

## 🧰 Requirements
- Linux + Kitty (recommended for inline images)
- Neovim 0.10+ (installer will auto‑install an AppImage if the system version is old)
- A Nerd Font (JetBrainsMono Nerd auto‑installed if missing)

## 🗺️ Workflows & Keybindings

Text selection & indentation
- Block/columns: Ctrl-v (visual block), move; Tab indent, Shift-Tab outdent (or > / <)
- Whole lines: V (visual line), Tab/Shift-Tab

Search & replace
- Project search: <leader>fg (Telescope live_grep)
- Project replace: <leader>sr (Spectre)
- File-only replace: <leader>sf (Spectre)
- Replace in selection: select then <leader>sr
- Built-in: :%s/old/new/gc (file) or :s/old/new/gc (selection)

Navigation & code
- Go to def/refs/impl/type: gd / gr / gi / gt
- Outline (symbols): <leader>so (Aerial)
- Breadcrumbs: in statusline via Navic
- Explorer: <leader>e (Neo-tree), <leader>o (Oil)
- Harpoon: <leader>a add, <leader>h menu, Ctrl-1..4 jump, Ctrl-n/p next/prev

Editing & utilities
- Comments: gcc (line), gc (visual)
- Clipboard history: <leader>cy (Yanky)
- Terminal: <leader>tt (ToggleTerm), exit with <c-\\> then <c-n>
- Minimap: :MinimapToggle
- Tasks: <leader>rr run, <leader>rt toggle, <leader>ro open, <leader>rb build (Overseer)
- Diagnostics: ]d / [d, Trouble: <leader>xx

Formatting
- Conform with language-appropriate formatters; manual: :Format (custom) or <leader>cf (LSP when enabled)

## 🎨 Theme & Visuals (Tokyo Night base)
- Default colorscheme: tokyonight-storm (see ui/themes.lua).
- Aerial/Navic use Tokyo Night’s palette for bright, distinct symbol colors. Automatically adapts when you change the colorscheme.
- Switch flavors quickly:
  - :colorscheme tokyonight-night or :colorscheme tokyonight-storm
  - Themery menu: <leader>ut (browse curated themes)

## ✅ Post‑install checks
- :checkhealth — confirm Python provider points to ~/.config/nvim/.venv/bin/python
- :Mason — ensure LSP tools are installed (they install automatically)
- :Lazy — all plugins synced (headless install runs this too)
- Try: <leader>so (outline), breadcrumbs in statusline, :MinimapToggle, <leader>tt (terminal)

## 🛠️ Troubleshooting
- PEP 668 (externally managed environment)
  - Handled automatically: installer creates ~/.config/nvim/.venv and installs pynvim/pytest there; Neovim uses it via python3_host_prog.
- pipx tools not found
  - Ensure ~/.local/bin is on PATH. We run pipx ensurepath during install.
- Old Node on Debian/Ubuntu
  - Installer sets up Node 20 using NodeSource (apt). Re-run install if Node was missing.
- Harpoon: “No write since last change”
  - Fixed: we auto-write modified buffers when switching targets; hidden+confirm enabled.
- Outline colors look dim
  - With Tokyo Night active, Aerial/Navic pick bright palette; if you override the theme, re-open Aerial or run :colorscheme to re-trigger highlights.

## 💡 Tips
- Visual line and column indentation with Tab/Shift-Tab makes formatting blocks trivial.
- Spectre is the fastest way to run safe project-wide replacements with preview.
- Use Harpoon + Telescope for jump navigation across active files.
- Toggle the minimap only when needed to save space: :MinimapToggle

## 🧪 Philosophy
- Stability first, performance by default, clean visuals, and discoverability
- Professional project standards: license, code of conduct, contributing guide, CI

## 🤝 Contributing
We welcome thoughtful PRs and issues. Please read CONTRIBUTING.md and follow Conventional Commits. CI checks (Stylua + ShellCheck) must pass.

## 🛡️ Code of Conduct & Security
- CODE_OF_CONDUCT.md — be kind and inclusive
- SECURITY.md — how to report vulnerabilities

## 📜 License
MIT © Fawz Haaroon

---

P.S. If this saved you time, consider starring the repo. It helps a lot! ⭐
