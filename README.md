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
- Terminal: <leader>tt (ToggleTerm), exit with <c-\> then <c-n>
- Minimap: :MinimapToggle
- Tasks: <leader>rr run, <leader>rt toggle, <leader>ro open, <leader>rb build (Overseer)
- Diagnostics: ]d / [d, Trouble: <leader>xx

Formatting
- Conform with language-appropriate formatters; manual: :Format (custom) or <leader>cf (LSP when enabled)

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
