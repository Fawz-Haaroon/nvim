# Installation

This repo contains a complete, portable Neovim distribution. The installer sets up all required system dependencies and language runtimes (Node, Python, Go, Java, Rust, etc.) and bootstraps plugins/tools headlessly.

Quick install (Linux + Kitty recommended)

1) Clone into your Neovim config directory

   git clone https://github.com/Fawz-Haaroon/nvim ~/.config/nvim

2) Run the installer

   cd ~/.config/nvim
   chmod +x install.sh
   bash ./install.sh

That’s it. Start Neovim with:

   nvim

Troubleshooting
- If your distro’s Neovim is too old, the installer will place a current AppImage at ~/.local/bin/nvim.
- On Debian/Ubuntu, Node.js 20 and .NET SDK 8 will be installed via official repos (NodeSource and Microsoft).
- For inline images in buffers, run under Kitty; Telescope previews work in all terminals via chafa + poppler + ffmpeg.

