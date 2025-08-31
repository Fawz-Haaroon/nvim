#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# Lexitron's Neovim install script
# Makes this config portable and sets it up at ~/.config/nvim (or XDG_CONFIG_HOME)
# Safe to run repeatedly.
# -----------------------------------------------------------------------------

info()  { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
success(){ printf "\033[1;32m[DONE]\033[0m %s\n" "$*"; }
warn()  { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
err()   { printf "\033[1;31m[ERR ]\033[0m %s\n" "$*"; }

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

# Detect package manager
pm=""
if command -v pacman >/dev/null 2>&1; then pm="pacman"; fi
if command -v apt-get >/dev/null 2>&1; then pm="apt"; fi
if command -v dnf >/dev/null 2>&1; then pm="dnf"; fi
if command -v yum >/dev/null 2>&1; then pm="yum"; fi
if command -v zypper >/dev/null 2>&1; then pm="zypper"; fi
if command -v brew >/dev/null 2>&1; then pm="brew"; fi

check_cmd(){ command -v "$1" >/dev/null 2>&1; }

ensure_pkg(){
  local name="$1"; shift || true
  case "$pm" in
    pacman)
      sudo pacman -S --needed --noconfirm "$name" || true ;;
    apt)
      sudo apt-get update -y && sudo apt-get install -y "$name" || true ;;
    dnf)
      sudo dnf install -y "$name" || true ;;
    yum)
      sudo yum install -y "$name" || true ;;
    zypper)
      sudo zypper install -y "$name" || true ;;
    brew)
      brew install "$name" || true ;;
    *)
      warn "Unknown package manager; please install '$name' manually." ;;
  esac
}

# Ensure a recent Neovim when distro packages are too old (AppImage fallback)
ensure_recent_neovim(){
  if check_cmd nvim; then
    # Extract major.minor from 'NVIM v0.X.Y'
    local vv
    vv=$(nvim --version | head -n1 | sed -E 's/^NVIM v([0-9]+)\.([0-9]+).*/\1.\2/') || vv="0.0"
    local major minor
    major=$(echo "$vv" | cut -d. -f1)
    minor=$(echo "$vv" | cut -d. -f2)
    # Require >= 0.10 for best compatibility
    if [ "${major:-0}" -gt 0 ] || { [ "${major:-0}" -eq 0 ] && [ "${minor:-0}" -ge 10 ]; }; then
      return 0
    fi
    warn "Neovim is $vv (< 0.10); installing AppImage fallback locally."
  else
    warn "Neovim not found; installing AppImage fallback locally."
  fi

  if ! check_cmd curl; then ensure_pkg curl; fi
  mkdir -p "$HOME/.local/bin"
  local app="$HOME/.local/bin/nvim.appimage"
  if curl -fsSL -o "$app" https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; then
    chmod +x "$app"
    # Prefer AppImage wrapper symlink 'nvim' for PATH
    ln -sf "$app" "$HOME/.local/bin/nvim"
    success "Installed Neovim AppImage to $HOME/.local/bin/nvim"
  else
    warn "Failed to download Neovim AppImage. Please install Neovim >= 0.10 manually."
  fi
}

# Ensure a Nerd Font for identical icons everywhere (fallback to user fonts)
ensure_nerd_font(){
  # Quick check if JetBrainsMono Nerd is available
  if check_cmd fc-match; then
    if fc-match -s "JetBrainsMono Nerd Font" >/dev/null 2>&1; then
      return 0
    fi
  else
    ensure_pkg fontconfig || true
  fi

  # Try package manager installs first (Arch already handled later)
  case "$pm" in
    dnf|yum)
      ensure_pkg jetbrains-mono-nerd-fonts || true ;;
    zypper)
      ensure_pkg nerd-fonts || true ;;
    brew)
      # Homebrew casks may not be available on Linuxbrew; try core tap first
      brew tap homebrew/cask-fonts >/dev/null 2>&1 || true
      brew install --cask font-jetbrains-mono-nerd >/dev/null 2>&1 || true ;;
  esac

  # If still not found, download latest Nerd Font zip to user fonts
  if ! fc-match -s "JetBrainsMono Nerd Font" >/dev/null 2>&1; then
    info "Installing JetBrainsMono Nerd Font (user-level)"
    local tmp
    tmp=$(mktemp -d)
    if curl -fsSL -o "$tmp/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip; then
      mkdir -p "$HOME/.local/share/fonts"
      unzip -o "$tmp/JetBrainsMono.zip" -d "$HOME/.local/share/fonts" >/dev/null 2>&1 || true
      fc-cache -f "$HOME/.local/share/fonts" >/dev/null 2>&1 || true
      success "Installed JetBrainsMono Nerd Font to ~/.local/share/fonts"
    else
      warn "Failed to download Nerd Font; icons may look different."
    fi
    rm -rf "$tmp"
  fi
}

# Install Node.js 20 from NodeSource on apt systems when version is missing/old (<18)
ensure_nodesource_node_apt(){
  if [ "$pm" != "apt" ]; then return 0; fi
  # Determine codename (e.g., jammy, focal, bookworm, bullseye)
  local CODENAME ID
  if [ -r /etc/os-release ]; then
    . /etc/os-release
    CODENAME="${VERSION_CODENAME:-${UBUNTU_CODENAME:-}}"
    ID="${ID:-ubuntu}"
  fi
  if [ -z "$CODENAME" ]; then
    warn "Could not detect apt codename; falling back to NodeSource setup script."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - || true
    sudo apt-get install -y nodejs || true
    return 0
  fi
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x $CODENAME main" | sudo tee /etc/apt/sources.list.d/nodesource.list >/dev/null
  sudo apt-get update -y || true
  sudo apt-get install -y nodejs || true
}

info "Checking core dependencies (git, curl, neovim, ripgrep, make, compiler, unzip, tar)"
check_cmd git     || ensure_pkg git
check_cmd curl    || ensure_pkg curl
check_cmd nvim    || ensure_pkg neovim
# Ensure a recent Neovim (0.10+) via AppImage if repo is too old
ensure_recent_neovim
check_cmd rg      || ensure_pkg ripgrep
check_cmd make    || ensure_pkg make

# Kitty terminal for inline image previews
if ! check_cmd kitty; then
  info "Installing Kitty terminal for inline image previews"
  ensure_pkg kitty || warn "Could not auto-install Kitty; please install it manually for image previews."
fi

# Recommended Nerd Font (icons)
if [ "$pm" = "pacman" ]; then
  ensure_pkg ttf-jetbrains-mono-nerd || true
fi
# Cross-distro fallback: install Nerd Font to user fonts if not present
ensure_nerd_font

# Compiler toolchain for Treesitter/telescope-fzf-native (and general dev)
if ! check_cmd gcc && ! check_cmd clang; then
  case "$pm" in
    pacman) ensure_pkg base-devel ;;
    apt)    ensure_pkg build-essential ;;
    dnf)    ensure_pkg gcc gcc-c++ make ;;
    yum)    ensure_pkg gcc gcc-c++ make ;;
    zypper) ensure_pkg gcc gcc-c++ make ;;
    brew)   ensure_pkg llvm || true ;;
  esac
fi
# Extra build tools
check_cmd cmake   || ensure_pkg cmake || true
check_cmd unzip   || ensure_pkg unzip
check_cmd tar     || ensure_pkg tar
check_cmd rsync   || ensure_pkg rsync || true

# C/C++ toolchain bits used by formatters
check_cmd clang   || ensure_pkg clang || true
if ! check_cmd clang-format; then
  case "$pm" in
    pacman) ensure_pkg clang ;;
    apt)    ensure_pkg clang-format ;;
    dnf)    ensure_pkg clang-tools-extra || ensure_pkg clang ;;
    yum)    ensure_pkg clang-tools-extra || ensure_pkg clang ;;
    zypper) ensure_pkg clang-tools || ensure_pkg clang ;;
    brew)   ensure_pkg clang-format || ensure_pkg llvm ;;
  esac
fi

# Debuggers (C/C++/Rust/others)
check_cmd gdb     || ensure_pkg gdb || true
check_cmd lldb    || ensure_pkg lldb || true

# Terraform CLI for formatting and workflows (best effort)
if ! check_cmd terraform; then
  case "$pm" in
    pacman) ensure_pkg terraform || true ;;
    apt)    ensure_pkg terraform || warn "Terraform not available from default repos; install separately if you use Terraform." ;;
    dnf)    ensure_pkg terraform || true ;;
    yum)    ensure_pkg terraform || true ;;
    zypper) ensure_pkg terraform || true ;;
    brew)   ensure_pkg terraform || true ;;
  esac
fi

# Clipboard integration for unnamedplus
check_cmd wl-copy || ensure_pkg wl-clipboard || true
check_cmd xclip   || ensure_pkg xclip || true

# Recommended utilities for rich previews
# chafa: terminal graphics; pdftoppm: PDF->PNG; ffmpeg: video thumbnails; libreoffice: office docs (optional)
check_cmd chafa  || ensure_pkg chafa || true
# pdftoppm package names differ by distro
if ! check_cmd pdftoppm; then
  case "$pm" in
    pacman) ensure_pkg poppler ;;
    apt)    ensure_pkg poppler-utils ;;
    dnf)    ensure_pkg poppler-utils ;;
    yum)    ensure_pkg poppler-utils ;;
    zypper) ensure_pkg poppler-tools || ensure_pkg poppler-utils || true ;;
    brew)   ensure_pkg poppler ;;
  esac
fi
check_cmd ffmpeg || ensure_pkg ffmpeg || true

# Language runtimes/SDKs for LSPs, tools, and DAPs
# Node for tsserver/eslint and markdown preview
if ! check_cmd node; then
  warn "Node.js is not installed. Installing."
  case "$pm" in
    pacman) ensure_pkg nodejs npm ;;
    apt)    ensure_pkg nodejs npm || true ;;
    dnf)    ensure_pkg nodejs npm ;;
    yum)    ensure_pkg nodejs npm ;;
    zypper) ensure_pkg nodejs npm ;;
    brew)   ensure_pkg node ;;
    *)      warn "Please install Node.js (>= 18) manually." ;;
  esac
fi
# On apt systems, or if Node is old (<18), install Node 20 via NodeSource
if check_cmd node; then
  NODE_MAJOR=$(node -v 2>/dev/null | sed -E 's/^v([0-9]+).*/\1/') || NODE_MAJOR=0
else
  NODE_MAJOR=0
fi
if [ "$pm" = "apt" ] && { [ "$NODE_MAJOR" -eq 0 ] || [ "$NODE_MAJOR" -lt 18 ]; }; then
  ensure_nodesource_node_apt
fi

# Python for debugpy, black, isort
check_cmd python3 || ensure_pkg python3 || true
check_cmd pip3    || ensure_pkg python3-pip || true
# Ensure Python provider and test runner for ftplugin/python.lua
if check_cmd pip3; then
  pip3 show pynvim >/dev/null 2>&1 || pip3 install --user -q --disable-pip-version-check pynvim || true
  pip3 show pytest >/dev/null 2>&1 || pip3 install --user -q --disable-pip-version-check pytest || true
fi

# Go for gopls and go tools
check_cmd go      || ensure_pkg go || ensure_pkg golang || true

# Java JDK for jdtls (prefer LTS)
if ! check_cmd javac; then
  case "$pm" in
    pacman) ensure_pkg jdk-openjdk ;;
    apt)    ensure_pkg default-jdk || ensure_pkg openjdk-17-jdk || ensure_pkg openjdk-21-jdk ;;
    dnf)    ensure_pkg java-17-openjdk-devel || ensure_pkg java-21-openjdk-devel ;;
    yum)    ensure_pkg java-17-openjdk-devel || ensure_pkg java-21-openjdk-devel ;;
    zypper) ensure_pkg java-17-openjdk-devel || ensure_pkg java-21-openjdk-devel ;;
    brew)   ensure_pkg openjdk ;;
  esac
fi

# Ruby (for Solargraph via Mason)
check_cmd ruby    || ensure_pkg ruby || true

# PHP (for Phpactor via Mason)
check_cmd php     || ensure_pkg php || true

# .NET SDK (for Omnisharp LSP)
if ! check_cmd dotnet; then
  case "$pm" in
    pacman) ensure_pkg dotnet-sdk || true ;;
    apt)
      info "Installing Microsoft package repo for .NET SDK (apt)"
      ensure_pkg wget || true
      ensure_pkg gpg || true
      ensure_pkg ca-certificates || true
      ensure_pkg apt-transport-https || true
      if [ -r /etc/os-release ]; then
        . /etc/os-release
        OS_ID="${ID:-ubuntu}"
        OS_VER="${VERSION_ID:-22.04}"
      else
        OS_ID="ubuntu"; OS_VER="22.04"
      fi
      TMP_DEB="packages-microsoft-prod.deb"
      wget -qO "$TMP_DEB" "https://packages.microsoft.com/config/$OS_ID/$OS_VER/packages-microsoft-prod.deb" || true
      if [ -s "$TMP_DEB" ]; then
        sudo dpkg -i "$TMP_DEB" || true
        rm -f "$TMP_DEB"
        sudo apt-get update -y || true
        sudo apt-get install -y dotnet-sdk-8.0 || sudo apt-get install -y dotnet-sdk-7.0 || true
      else
        warn "Could not fetch Microsoft repo for $OS_ID/$OS_VER; please install dotnet-sdk manually."
      fi
      ;;
    dnf)    ensure_pkg dotnet-sdk-8.0 || ensure_pkg dotnet-sdk-7.0 || true ;;
    yum)    ensure_pkg dotnet-sdk-8.0 || true ;;
    zypper) ensure_pkg dotnet-sdk-8.0 || true ;;
    brew)   ensure_pkg dotnet || true ;;
  esac
fi

# Rust toolchain (prefer rustup when available)
if ! check_cmd rustc || ! check_cmd cargo; then
  case "$pm" in
    pacman) ensure_pkg rustup ;;
    apt)    ensure_pkg rustc && ensure_pkg cargo || true ;;
    dnf)    ensure_pkg rust ;;
    yum)    ensure_pkg rust ;;
    zypper) ensure_pkg rust ;;
    brew)   ensure_pkg rust ;;
  esac
fi
# If rustup is present, ensure stable toolchain and components
if check_cmd rustup; then
  rustup show >/dev/null 2>&1 || true
  rustup default stable >/dev/null 2>&1 || true
  rustup component add rustfmt clippy >/dev/null 2>&1 || true
fi

# Create target directory and copy/symlink
if [ "$SCRIPT_DIR" = "$TARGET_DIR" ]; then
  info "Config already located at $TARGET_DIR"
else
  info "Installing config to $TARGET_DIR"
  mkdir -p "$(dirname "$TARGET_DIR")"
  if check_cmd rsync; then
    rsync -a --delete --exclude ".git" --exclude ".archive" --exclude "session.vim" "$SCRIPT_DIR/" "$TARGET_DIR/"
  else
    # Fallback copy
    if [ -e "$TARGET_DIR" ]; then
      ts=$(date +%Y%m%d-%H%M%S)
      info "Backing up existing $TARGET_DIR to ${TARGET_DIR}.backup.$ts"
      mv "$TARGET_DIR" "${TARGET_DIR}.backup.$ts"
    fi
    mkdir -p "$TARGET_DIR"
    cp -a "$SCRIPT_DIR/." "$TARGET_DIR/"
    # Remove any direct session file copied unintentionally
    if [ -e "$TARGET_DIR/session.vim" ]; then rm -f "$TARGET_DIR/session.vim"; fi
  fi
fi

# Preinstall plugins headlessly
info "Syncing plugins with lazy.nvim (headless)"
if ! nvim --version >/dev/null 2>&1; then
  err "Neovim not available; skipping headless install."
else
  NVIM_APPNAME="" nvim --headless \
    "+Lazy! sync" \
    "+qa" || warn "Lazy sync encountered issues; open Neovim to review (:Lazy)."

  # Update Mason registries and trigger tool installation (headless, no MasonUpdate dependency)
  NVIM_APPNAME="" nvim --headless \
    "+lua pcall(function() local ok,lazy = pcall(require,'lazy'); if ok and lazy and lazy.load then lazy.load({ plugins = { 'mason.nvim','mason-lspconfig.nvim','mason-tool-installer.nvim' } }) end end)" \
    "+lua pcall(function() local ok,registry = pcall(require,'mason-registry'); if ok and registry and registry.refresh then registry.refresh() end end)" \
    "+lua pcall(function() require('mason-tool-installer').install() end)" \
    "+qa" || warn "Mason setup encountered issues; run :Mason inside Neovim."
fi

# Tips
cat <<'EOF'

All set! Next steps:
- Start Neovim: nvim
- Open the plugin manager: :Lazy
- Open LSP/tool manager: :Mason
- Check health: :checkhealth

Notes:
- Kitty is optional but recommended for inline image previews.
- This config avoids hard-coded absolute paths and should work on any user account.

Enjoy! ✨
EOF

success "Installation complete."

