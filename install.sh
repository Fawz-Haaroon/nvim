#!/usr/bin/env bash
set -euo pipefail

# -----------------------------------------------------------------------------
# Lexitron.nvim installer — robust, idempotent, cross-distro
# - Ensures modern Neovim 0.10+
# - Installs build tools and common runtimes (Node/Python/Go/Java/.NET/Rust)
# - Sets up fd/bat (Debian quirks handled), trash-cli, image preview utilities
# - Creates a per-config Python provider venv (~/.config/nvim/.venv)
# - Syncs plugins and Mason tools headlessly
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
  local name="$1"
  case "$pm" in
    pacman) sudo pacman -S --needed --noconfirm "$name" || true ;;
    apt)    sudo apt-get update -y && sudo apt-get install -y "$name" || true ;;
    dnf)    sudo dnf install -y "$name" || true ;;
    yum)    sudo yum install -y "$name" || true ;;
    zypper) sudo zypper install -y "$name" || true ;;
    brew)   brew install "$name" || true ;;
    *)      warn "Unknown package manager; please install '$name' manually." ;;
  esac
}

# Ensure Neovim >= 0.10 (AppImage fallback in ~/.local/bin)
ensure_recent_neovim(){
  if check_cmd nvim; then
    local vv major minor
    vv=$(nvim --version | head -n1 | sed -E 's/^NVIM v([0-9]+)\.([0-9]+).*/\1.\2/') || vv="0.0"
    major=${vv%%.*}; minor=${vv##*.}
    if [ "${major:-0}" -gt 0 ] || { [ "${major:-0}" -eq 0 ] && [ "${minor:-0}" -ge 10 ]; }; then return 0; fi
    warn "Neovim is $vv (< 0.10); installing AppImage fallback locally."
  else
    warn "Neovim not found; installing AppImage fallback locally."
  fi
  ensure_pkg curl || true
  mkdir -p "$HOME/.local/bin"
  local app="$HOME/.local/bin/nvim.appimage"
  if curl -fsSL -o "$app" https://github.com/neovim/neovim/releases/latest/download/nvim.appimage; then
    chmod +x "$app" && ln -sf "$app" "$HOME/.local/bin/nvim"
    success "Installed Neovim AppImage to $HOME/.local/bin/nvim"
  else
    warn "Failed to download Neovim AppImage. Please install Neovim >= 0.10 manually."
  fi
}

# Nerd Font (user-level fallback)
ensure_nerd_font(){
  check_cmd fc-match || ensure_pkg fontconfig || true
  if fc-match -s "JetBrainsMono Nerd Font" >/dev/null 2>&1; then return 0; fi
  case "$pm" in
    pacman) ensure_pkg ttf-jetbrains-mono-nerd || true ;;
    dnf|yum) ensure_pkg jetbrains-mono-nerd-fonts || true ;;
    zypper) ensure_pkg nerd-fonts || true ;;
    brew) brew tap homebrew/cask-fonts >/dev/null 2>&1 || true; brew install --cask font-jetbrains-mono-nerd >/dev/null 2>&1 || true ;;
  esac
  if ! fc-match -s "JetBrainsMono Nerd Font" >/dev/null 2>&1; then
    info "Installing JetBrainsMono Nerd Font (user-level)"
    local tmp; tmp=$(mktemp -d)
    curl -fsSL -o "$tmp/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip || true
    if [ -s "$tmp/JetBrainsMono.zip" ]; then
      mkdir -p "$HOME/.local/share/fonts"
      unzip -o "$tmp/JetBrainsMono.zip" -d "$HOME/.local/share/fonts" >/dev/null 2>&1 || true
      fc-cache -f "$HOME/.local/share/fonts" >/dev/null 2>&1 || true
      success "Installed JetBrainsMono Nerd Font to ~/.local/share/fonts"
    else
      warn "Failed to download Nerd Font; icons may differ."
    fi
    rm -rf "$tmp"
  fi
}

# NodeSource Node 20 on apt systems (if node missing or <18)
ensure_nodesource_node_apt(){
  [ "$pm" = "apt" ] || return 0
  local CODENAME
  . /etc/os-release 2>/dev/null || true
  CODENAME="${VERSION_CODENAME:-${UBUNTU_CODENAME:-}}"
  if [ -z "$CODENAME" ]; then
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

# Python provider venv (~/.config/nvim/.venv)
ensure_python_provider(){
  check_cmd python3 || ensure_pkg python3 || true
  mkdir -p "$TARGET_DIR"
  local VENV_DIR="$TARGET_DIR/.venv"
  if [ ! -x "$VENV_DIR/bin/python" ]; then
    info "Creating Python virtual environment for Neovim at $VENV_DIR"
    python3 -m venv "$VENV_DIR" 2>/dev/null || {
      case "$pm" in
        apt) ensure_pkg python3-venv || true ;;
        dnf|yum) ensure_pkg python3-virtualenv || true ;;
        zypper) ensure_pkg python311-venv || ensure_pkg python3-virtualenv || true ;;
      esac
      python3 -m venv "$VENV_DIR" || { warn "Could not create Python venv"; return 0; }
    }
  fi
  "$VENV_DIR/bin/python" -m pip install --upgrade --disable-pip-version-check pip setuptools wheel >/dev/null 2>&1 || true
  "$VENV_DIR/bin/python" -m pip show pynvim >/dev/null 2>&1 || "$VENV_DIR/bin/python" -m pip install -q pynvim || true
  success "Python provider ready: $VENV_DIR/bin/python"
}

# tree-sitter CLI (optional, some parsers need it)
ensure_treesitter_cli(){
  check_cmd tree-sitter && return 0
  info "Installing tree-sitter CLI"
  case "$pm" in
    pacman) ensure_pkg tree-sitter-cli || ensure_pkg tree-sitter || true ;;
    apt)    ensure_pkg tree-sitter-cli || true ;;
    dnf|yum|zypper) ensure_pkg tree-sitter-cli || true ;;
    brew)   ensure_pkg tree-sitter || true ;;
  esac
  check_cmd tree-sitter || { check_cmd npm && npm install -g tree-sitter-cli || true; }
  check_cmd tree-sitter || { check_cmd cargo && cargo install tree-sitter-cli || true; }
  check_cmd tree-sitter && success "tree-sitter CLI installed" || warn "tree-sitter CLI not installed automatically"
}

# pipx for isolated CLIs
ensure_pipx(){
  check_cmd pipx && return 0
  info "Installing pipx"
  case "$pm" in
    pacman) ensure_pkg python-pipx || ensure_pkg pipx || true ;;
    apt)    ensure_pkg pipx || ensure_pkg python3-pipx || true; ensure_pkg python3-venv || true ;;
    dnf|yum|zypper) ensure_pkg pipx || true ;;
    brew)   ensure_pkg pipx || true ;;
  esac
  check_cmd pipx && { pipx ensurepath >/dev/null 2>&1 || true; hash -r 2>/dev/null || true; success "pipx is installed"; } || warn "pipx not installed"
}

# Debian quirks: fd-find as fd, batcat as bat
ensure_fd(){
  if check_cmd fd; then return 0; fi
  case "$pm" in
    apt)
      ensure_pkg fd-find || true
      if check_cmd fdfind && ! check_cmd fd; then sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd 2>/dev/null || true; fi ;;
    pacman|dnf|yum|zypper|brew)
      ensure_pkg fd || true ;;
  esac
  check_cmd fd || warn "fd not available; Telescope will fall back to ripgrep"
}

ensure_bat(){
  if check_cmd bat; then return 0; fi
  case "$pm" in
    apt)
      ensure_pkg bat || true
      if check_cmd batcat && ! check_cmd bat; then sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat 2>/dev/null || true; fi ;;
    pacman|dnf|yum|zypper|brew)
      ensure_pkg bat || true ;;
  esac
}

ensure_trash(){
  case "$pm" in
    pacman|apt|dnf|yum|zypper) ensure_pkg trash-cli || true ;;
    brew) ensure_pkg trash || true ;;
  esac
}

ensure_image_utils(){
  # chafa for terminal previews, poppler for PDFs, ffmpeg for videos, imagemagick for conversions
  check_cmd chafa  || ensure_pkg chafa || true
  if ! check_cmd pdftoppm; then
    case "$pm" in
      pacman) ensure_pkg poppler ;;
      apt)    ensure_pkg poppler-utils ;;
      dnf|yum) ensure_pkg poppler-utils ;;
      zypper) ensure_pkg poppler-tools || ensure_pkg poppler-utils || true ;;
      brew)   ensure_pkg poppler ;;
    esac
  fi
  check_cmd ffmpeg || ensure_pkg ffmpeg || true
  case "$pm" in
    pacman) ensure_pkg imagemagick || true ;;
    apt)    ensure_pkg imagemagick || true ;;
    dnf|yum|zypper) ensure_pkg ImageMagick || ensure_pkg imagemagick || true ;;
    brew)   ensure_pkg imagemagick || true ;;
  esac
}

info "Checking core dependencies (git, curl, neovim, ripgrep, make, compiler, unzip, tar)"
check_cmd git   || ensure_pkg git
check_cmd curl  || ensure_pkg curl
check_cmd nvim  || ensure_pkg neovim
ensure_recent_neovim
check_cmd rg    || ensure_pkg ripgrep
check_cmd make  || ensure_pkg make
check_cmd cmake || ensure_pkg cmake || true
check_cmd unzip || ensure_pkg unzip
check_cmd tar   || ensure_pkg tar
check_cmd rsync || ensure_pkg rsync || true

# Terminal (optional) and fonts
check_cmd kitty || ensure_pkg kitty || true
ensure_nerd_font

# Compiler toolchain for fzf-native/Treesitter
if ! check_cmd gcc && ! check_cmd clang; then
  case "$pm" in
    pacman) ensure_pkg base-devel ;;
    apt)    ensure_pkg build-essential ;;
    dnf|yum|zypper) ensure_pkg gcc gcc-c++ make ;;
    brew)   ensure_pkg llvm || true ;;
  esac
fi
check_cmd clang-format || case "$pm" in
  pacman) ensure_pkg clang ;;
  apt)    ensure_pkg clang-format ;;
  dnf|yum) ensure_pkg clang-tools-extra || ensure_pkg clang ;;
  zypper) ensure_pkg clang-tools || ensure_pkg clang ;;
  brew)   ensure_pkg clang-format || ensure_pkg llvm ;;
esac

# Debuggers
check_cmd gdb  || ensure_pkg gdb || true
check_cmd lldb || ensure_pkg lldb || true

# Clipboard
check_cmd wl-copy || ensure_pkg wl-clipboard || true
check_cmd xclip   || ensure_pkg xclip || true

# File finders, previewers, trash
ensure_fd
ensure_bat
ensure_trash
ensure_image_utils

# Runtimes/SDKs
if ! check_cmd node; then
  case "$pm" in
    pacman|dnf|yum|zypper) ensure_pkg nodejs npm ;;
    apt) ensure_pkg nodejs npm || true ;;
    brew) ensure_pkg node ;;
  esac
fi
if check_cmd node; then NODE_MAJOR=$(node -v | sed -E 's/^v([0-9]+).*/\1/'); else NODE_MAJOR=0; fi
[ "$pm" = "apt" ] && [ "${NODE_MAJOR:-0}" -lt 18 ] && ensure_nodesource_node_apt

ensure_treesitter_cli
ensure_pipx
ensure_python_provider

check_cmd go || ensure_pkg go || ensure_pkg golang || true
if ! check_cmd javac; then
  case "$pm" in
    pacman) ensure_pkg jdk-openjdk ;;
    apt)    ensure_pkg default-jdk || ensure_pkg openjdk-17-jdk || ensure_pkg openjdk-21-jdk ;;
    dnf|yum) ensure_pkg java-17-openjdk-devel || ensure_pkg java-21-openjdk-devel ;;
    zypper) ensure_pkg java-17-openjdk-devel || ensure_pkg java-21-openjdk-devel ;;
    brew)   ensure_pkg openjdk ;;
  esac
fi
check_cmd ruby || ensure_pkg ruby || true
check_cmd php  || ensure_pkg php || true
if ! check_cmd dotnet; then
  case "$pm" in
    pacman) ensure_pkg dotnet-sdk || true ;;
    apt)
      info "Adding Microsoft .NET repo (apt)"
      ensure_pkg wget || true; ensure_pkg gpg || true; ensure_pkg ca-certificates || true; ensure_pkg apt-transport-https || true
      . /etc/os-release 2>/dev/null || true
      OS_ID="${ID:-ubuntu}"; OS_VER="${VERSION_ID:-22.04}"
      TMP_DEB=$(mktemp)
      wget -qO "$TMP_DEB" "https://packages.microsoft.com/config/$OS_ID/$OS_VER/packages-microsoft-prod.deb" || true
      if [ -s "$TMP_DEB" ]; then sudo dpkg -i "$TMP_DEB" || true; rm -f "$TMP_DEB"; sudo apt-get update -y || true; sudo apt-get install -y dotnet-sdk-8.0 || sudo apt-get install -y dotnet-sdk-7.0 || true; else warn ".NET repo fetch failed"; fi ;;
    dnf|yum) ensure_pkg dotnet-sdk-8.0 || ensure_pkg dotnet-sdk-7.0 || true ;;
    zypper)  ensure_pkg dotnet-sdk-8.0 || true ;;
    brew)    ensure_pkg dotnet || true ;;
  esac
fi
if check_cmd rustup; then rustup default stable >/dev/null 2>&1 || true; rustup component add rustfmt clippy >/dev/null 2>&1 || true; else check_cmd rustc || case "$pm" in pacman) ensure_pkg rustup ;; apt) ensure_pkg rustc && ensure_pkg cargo || true ;; dnf|yum|zypper|brew) ensure_pkg rust || true ;; esac; fi

# Install/sync config to target
if [ "$SCRIPT_DIR" = "$TARGET_DIR" ]; then
  info "Config already located at $TARGET_DIR"
else
  info "Installing config to $TARGET_DIR"
  mkdir -p "$(dirname "$TARGET_DIR")"
  if check_cmd rsync; then
    rsync -a --delete --exclude ".git" --exclude ".archive" --exclude "session.vim" "$SCRIPT_DIR/" "$TARGET_DIR/"
  else
    if [ -e "$TARGET_DIR" ]; then ts=$(date +%Y%m%d-%H%M%S); info "Backing up $TARGET_DIR -> ${TARGET_DIR}.backup.$ts"; mv "$TARGET_DIR" "${TARGET_DIR}.backup.$ts"; fi
    mkdir -p "$TARGET_DIR" && cp -a "$SCRIPT_DIR/." "$TARGET_DIR/"
    [ -e "$TARGET_DIR/session.vim" ] && rm -f "$TARGET_DIR/session.vim"
  fi
fi

# Headless plugin/tool bootstrap
if check_cmd nvim; then
  info "Syncing plugins with lazy.nvim (headless)"
  NVIM_APPNAME="" nvim --headless "+Lazy! sync" "+qa" || warn "Lazy sync issues; open Neovim and run :Lazy"
  info "Refreshing Mason registry and installing tools"
  NVIM_APPNAME="" nvim --headless \
    "+lua pcall(function() local ok,lazy = pcall(require,'lazy'); if ok and lazy and lazy.load then lazy.load({ plugins = { 'mason.nvim','mason-lspconfig.nvim','mason-tool-installer.nvim' } }) end end)" \
    "+lua pcall(function() local ok,registry = pcall(require,'mason-registry'); if ok and registry and registry.refresh then registry.refresh() end end)" \
    "+lua pcall(function() require('mason-tool-installer').install() end)" \
    "+qa" || warn "Mason setup issues; run :Mason inside Neovim"
  NVIM_APPNAME="" nvim --headless "+UpdateRemotePlugins" "+qa" || true
else
  err "Neovim unavailable; skipping headless bootstrap"
fi

cat <<'EOF'

All set! Next steps:
- Start Neovim: nvim
- Plugin manager: :Lazy
- LSP/tool manager: :Mason
- Health check: :checkhealth

Notes:
- Kitty is optional but recommended for inline image previews.
- Debian: fd is fd-find and bat may be batcat; installer created symlinks.

Enjoy! ✨
EOF

success "Installation complete."

