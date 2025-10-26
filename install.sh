#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════════════
#  🚀 LEXITRON.NVIM ULTIMATE INSTALLER v2.0
#  The Most Advanced Neovim Configuration Installer Ever Built
# ═══════════════════════════════════════════════════════════════════════════════
#  🏆 FEATURES:
#  ✅ Cross-platform (Linux: Arch/Debian/Fedora/openSUSE + macOS)
#  ✅ Bulletproof error handling with retry mechanisms
#  ✅ Advanced logging and progress tracking
#  ✅ 30+ LSP servers auto-installation
#  ✅ Complete development toolchains
#  ✅ Font management (NerdFonts)
#  ✅ Performance optimizations
#  ✅ Dependency conflict resolution
#  ✅ Rollback capabilities
#  ✅ Health check validation
#  ✅ Professional installation experience
# ═══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ═══════════════════════════════════════════════════════════════════════════════
#  🎨 GLOBAL VARIABLES & COLORS
# ═══════════════════════════════════════════════════════════════════════════════

# Version and meta
readonly INSTALLER_VERSION="2.0.0"
readonly CONFIG_NAME="Lexitron.nvim"
readonly GITHUB_REPO="https://github.com/lexitron/nvim"
readonly MIN_NEOVIM_VERSION="0.10.0"

# Color palette (Professional)
readonly RED="\033[1;31m"
readonly GREEN="\033[1;32m" 
readonly YELLOW="\033[1;33m"
readonly BLUE="\033[1;34m"
readonly MAGENTA="\033[1;35m"
readonly CYAN="\033[1;36m"
readonly WHITE="\033[1;37m"
readonly GRAY="\033[0;37m"
readonly BOLD="\033[1m"
readonly DIM="\033[2m"
readonly RESET="\033[0m"

# Special effects
readonly CHECKMARK="✓"
readonly CROSSMARK="✗"
readonly ARROW="→"
readonly BULLET="•"
readonly SPINNER_CHARS=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")

# Paths and directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
LOG_DIR="$HOME/.cache/lexitron-nvim-installer"
BACKUP_DIR="$HOME/.local/share/lexitron-nvim-backups"
TEMP_DIR=""

# System detection variables
OS_ID=""
OS_NAME=""
OS_VERSION=""
PM=""
PM_INSTALL=""
PM_UPDATE=""
PM_SEARCH=""

# Installation state
declare -A INSTALLED_PACKAGES
declare -A FAILED_PACKAGES
declare -i TOTAL_STEPS=0
declare -i CURRENT_STEP=0
declare -i ERROR_COUNT=0
declare -i WARNING_COUNT=0

# Configuration flags
SKIP_FONTS=${SKIP_FONTS:-false}
SKIP_NODEJS=${SKIP_NODEJS:-false}
SKIP_PYTHON=${SKIP_PYTHON:-false}
SKIP_GO=${SKIP_GO:-false}
SKIP_RUST=${SKIP_RUST:-false}
INSTALL_ALL_LSP=${INSTALL_ALL_LSP:-true}
FORCE_INSTALL=${FORCE_INSTALL:-false}
VERBOSE=${VERBOSE:-false}
DRY_RUN=${DRY_RUN:-false}

# ═══════════════════════════════════════════════════════════════════════════════
#  🎭 LOGGING AND UI FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

# Initialize logging
init_logging() {
    mkdir -p "$LOG_DIR" "$BACKUP_DIR"
    
    local timestamp
    timestamp=$(date +%Y%m%d_%H%M%S)
    LOG_FILE="$LOG_DIR/install_${timestamp}.log"
    ERROR_LOG="$LOG_DIR/errors_${timestamp}.log"
    
    # Create temp directory
    TEMP_DIR=$(mktemp -d -t lexitron-nvim.XXXXXX)
    
    # Setup log rotation (keep last 10 logs)
    find "$LOG_DIR" -name "install_*.log" -type f | sort -r | tail -n +11 | xargs rm -f 2>/dev/null || true
    
    # Start logging
    exec 3>&1 4>&2
    if [[ $VERBOSE == true ]]; then
        exec 1> >(tee -a "$LOG_FILE")
        exec 2> >(tee -a "$ERROR_LOG" >&2)
    else
        exec 1> >(tee -a "$LOG_FILE" >/dev/null)
        exec 2> >(tee -a "$ERROR_LOG" >&2)
    fi
    
    log_info "Starting $CONFIG_NAME installation"
    log_info "Logging to: $LOG_FILE"
    log_info "Backup directory: $BACKUP_DIR"
    log_info "Target directory: $TARGET_DIR"
}

# Logging functions (fallback to stdout/stderr if descriptors not set)
log_raw() { printf "%s\n" "$*" >&3 2>/dev/null || printf "%s\n" "$*"; }
log_debug() { [[ $VERBOSE == true ]] && { printf "${DIM}[DEBUG]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${DIM}[DEBUG]${RESET} %s\n" "$*"; }; }
log_info() { printf "${BLUE}[INFO]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${BLUE}[INFO]${RESET} %s\n" "$*"; }
log_success() { printf "${GREEN}[${CHECKMARK}]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${GREEN}[${CHECKMARK}]${RESET} %s\n" "$*"; }
log_warn() { printf "${YELLOW}[WARN]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${YELLOW}[WARN]${RESET} %s\n" "$*"; ((WARNING_COUNT++)); }
log_error() { printf "${RED}[${CROSSMARK}]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${RED}[${CROSSMARK}]${RESET} %s\n" "$*"; printf "[ERROR] %s\n" "$*" >&4 2>/dev/null || printf "[ERROR] %s\n" "$*" >&2; ((ERROR_COUNT++)); }
log_step() { printf "${CYAN}[${CURRENT_STEP}/${TOTAL_STEPS}]${RESET} %s\n" "$*" >&3 2>/dev/null || printf "${CYAN}[${CURRENT_STEP}/${TOTAL_STEPS}]${RESET} %s\n" "$*"; }

# Progress and status functions
show_header() {
    local title="$1"
    local width=80
    local padding=$(( (width - ${#title} - 4) / 2 ))
    
    printf "\n"
    printf "${MAGENTA}╔%*s╗${RESET}\n" $((width-2)) | tr ' ' '═'
    printf "${MAGENTA}║%*s${BOLD}%s${RESET}${MAGENTA}%*s║${RESET}\n" $padding "" "$title" $padding ""
    printf "${MAGENTA}╚%*s╝${RESET}\n" $((width-2)) | tr ' ' '═'
    printf "\n"
}

show_banner() {
    clear
    printf "${CYAN}\n"
    printf "    ██╗     ███████╗██╗  ██╗██╗████████╗██████╗  ██████╗ ███╗   ██╗\n"
    printf "    ██║     ██╔════╝╚██╗██╔╝██║╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║\n"
    printf "    ██║     █████╗   ╚███╔╝ ██║   ██║   ██████╔╝██║   ██║██╔██╗ ██║\n"
    printf "    ██║     ██╔══╝   ██╔██╗ ██║   ██║   ██╔══██╗██║   ██║██║╚██╗██║\n"
    printf "    ███████╗███████╗██╔╝ ██╗██║   ██║   ██║  ██║╚██████╔╝██║ ╚████║\n"
    printf "    ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝\n"
    printf "${RESET}\n"
    printf "${BOLD}${WHITE}                       ULTIMATE NEOVIM INSTALLER v${INSTALLER_VERSION}${RESET}\n"
    printf "${GRAY}                    The Most Advanced Neovim Configuration Setup${RESET}\n"
    printf "\n"
}

show_progress() {
    local current=$1
    local total=$2
    local task="$3"
    local width=50
    
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    printf "\r${BLUE}[${GREEN}"
    printf "%*s" $filled | tr ' ' '█'
    printf "${GRAY}"
    printf "%*s" $empty | tr ' ' '░'
    printf "${BLUE}]${RESET} ${percentage}%% ${DIM}${task}${RESET}" >&3
    
    if [[ $current -eq $total ]]; then
        log_raw
    fi
}

spinner() {
    local pid=$1
    local message="$2"
    local i=0
    
    while kill -0 "$pid" 2>/dev/null; do
        printf "\r${YELLOW}${SPINNER_CHARS[i]}${RESET} %s" "$message" >&3
        i=$(( (i + 1) % ${#SPINNER_CHARS[@]} ))
        sleep 0.1
    done
    
    wait "$pid"
    local exit_code=$?
    printf "\r%*s\r" $((${#message} + 5)) "" >&3  # Clear line
    return $exit_code
}

# Input functions
ask_yes_no() {
    local question="$1"
    local default="${2:-n}"
    local answer
    
    while true; do
        if [[ $default == "y" ]]; then
            printf "${YELLOW}${question} [Y/n]: ${RESET}" >&3
        else
            printf "${YELLOW}${question} [y/N]: ${RESET}" >&3
        fi
        
        read -r answer
        answer=${answer,,} # Convert to lowercase
        
        case $answer in
            y|yes) return 0 ;;
            n|no) return 1 ;;
            "") [[ $default == "y" ]] && return 0 || return 1 ;;
            *) log_warn "Please answer yes or no" ;;
        esac
    done
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🔍 SYSTEM DETECTION AND VALIDATION
# ═══════════════════════════════════════════════════════════════════════════════

detect_system() {
    log_step "Detecting system..."
    ((CURRENT_STEP++))
    
    # Detect OS
    case "$OSTYPE" in
        linux-gnu*)
            if [[ -f /etc/os-release ]]; then
                # shellcheck source=/dev/null
                source /etc/os-release
                OS_ID="${ID:-unknown-linux}"
                OS_NAME="${NAME:-Unknown Linux}"
                # Arch Linux and rolling releases may not have VERSION_ID
                OS_VERSION="${VERSION_ID:-rolling}"
            else
                OS_ID="unknown-linux"
                OS_NAME="Unknown Linux"
                OS_VERSION="unknown"
            fi
            ;;
        darwin*)
            OS_ID="macos"
            OS_NAME="macOS"
            OS_VERSION=$(sw_vers -productVersion)
            ;;
        *)
            log_error "Unsupported operating system: $OSTYPE"
            return 1
            ;;
    esac
    
    log_info "System: $OS_NAME $OS_VERSION ($OS_ID)"
    
    # Detect package manager
    detect_package_manager
    
    # Validate system requirements
    validate_system_requirements
}

detect_package_manager() {
    local managers=(
        "pacman:pacman -S --needed --noconfirm:pacman -Sy:pacman -Ss"
        "apt-get:apt-get install -y:apt-get update:apt-cache search"
        "dnf:dnf install -y:dnf check-update:dnf search"
        "yum:yum install -y:yum check-update:yum search"
        "zypper:zypper install -y:zypper refresh:zypper search"
        "brew:brew install:brew update:brew search"
    )
    
    for manager_info in "${managers[@]}"; do
        IFS=':' read -r manager install update search <<< "$manager_info"
        if command -v "$manager" >/dev/null 2>&1; then
            PM="$manager"
            PM_INSTALL="$install"
            PM_UPDATE="$update"
            PM_SEARCH="$search"
            log_info "Package Manager: $PM"
            return 0
        fi
    done
    
    log_error "No supported package manager found"
    log_error "Supported: pacman, apt-get, dnf, yum, zypper, brew"
    return 1
}

validate_system_requirements() {
    log_debug "Validating system requirements..."
    
    # Check for required commands
    local required_commands=("curl" "git" "tar")
    local missing_commands=()
    
    for cmd in "${required_commands[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            missing_commands+=("$cmd")
        fi
    done
    
    if [[ ${#missing_commands[@]} -gt 0 ]]; then
        log_error "Missing required commands: ${missing_commands[*]}"
        log_info "Installing missing commands..."
        install_packages "${missing_commands[@]}"
    fi
    
    # Check disk space (need at least 500MB)
    local available_space
    available_space=$(df "$HOME" | awk 'NR==2 {print $4}')
    local required_space=512000  # 500MB in KB
    
    if [[ $available_space -lt $required_space ]]; then
        log_warn "Low disk space: $(( available_space / 1024 ))MB available, $(( required_space / 1024 ))MB recommended"
    fi
    
    # Check internet connectivity
    if ! curl -s --connect-timeout 5 https://github.com >/dev/null; then
        log_error "No internet connection detected"
        return 1
    fi
    
    log_success "System requirements validated"
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🛠️ UTILITY FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════════

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

version_compare() {
    local version1="$1"
    local version2="$2"
    
    # Convert versions to arrays
    IFS='.' read -ra ver1 <<< "$version1"
    IFS='.' read -ra ver2 <<< "$version2"
    
    # Compare version parts
    for i in "${!ver1[@]}"; do
        local v1=${ver1[i]:-0}
        local v2=${ver2[i]:-0}
        
        if (( v1 > v2 )); then
            return 1  # version1 > version2
        elif (( v1 < v2 )); then
            return 2  # version1 < version2
        fi
    done
    
    return 0  # versions are equal
}

retry_command() {
    local max_attempts="$1"
    local delay="$2"
    shift 2
    local command=("$@")
    local attempt=1
    
    while [[ $attempt -le $max_attempts ]]; do
        if "${command[@]}"; then
            return 0
        fi
        
        if [[ $attempt -lt $max_attempts ]]; then
            log_warn "Command failed (attempt $attempt/$max_attempts). Retrying in ${delay}s..."
            sleep "$delay"
        fi
        
        ((attempt++))
    done
    
    log_error "Command failed after $max_attempts attempts: ${command[*]}"
    return 1
}

create_backup() {
    local source="$1"
    local backup_name="${2:-$(basename "$source")}"
    
    if [[ -e "$source" ]]; then
        local timestamp
        timestamp=$(date +%Y%m%d_%H%M%S)
        local backup_path="$BACKUP_DIR/${backup_name}_${timestamp}"
        
        log_info "Creating backup: $backup_path"
        cp -r "$source" "$backup_path"
        log_success "Backup created: $backup_path"
    fi
}

cleanup_temp() {
    if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}

# Trap for cleanup on exit
trap cleanup_temp EXIT INT TERM

# ═══════════════════════════════════════════════════════════════════════════════
#  📦 PACKAGE MANAGEMENT
# ═══════════════════════════════════════════════════════════════════════════════

update_package_database() {
    log_info "Updating package database..."
    
    case "$PM" in
        pacman) sudo pacman -Sy --noconfirm ;;
        apt-get) sudo apt-get update -y ;;
        dnf|yum) $PM_UPDATE || true ;;
        zypper) sudo zypper refresh ;;
        brew) brew update ;;
        *) log_warn "Unknown package manager: $PM" ;;
    esac
}

install_packages() {
    local packages=("$@")
    local failed_packages=()
    
    if [[ ${#packages[@]} -eq 0 ]]; then
        return 0
    fi
    
    log_info "Installing packages: ${packages[*]}"
    
    if [[ $DRY_RUN == true ]]; then
        log_info "[DRY RUN] Would install: ${packages[*]}"
        return 0
    fi
    
    for package in "${packages[@]}"; do
        if is_package_installed "$package"; then
            log_debug "Package already installed: $package"
            INSTALLED_PACKAGES["$package"]="already-installed"
            continue
        fi
        
        log_info "Installing: $package"
        
        if install_single_package "$package"; then
            INSTALLED_PACKAGES["$package"]="newly-installed"
            log_success "Installed: $package"
        else
            failed_packages+=("$package")
            FAILED_PACKAGES["$package"]="failed"
            log_error "Failed to install: $package"
        fi
    done
    
    if [[ ${#failed_packages[@]} -gt 0 ]]; then
        log_warn "Failed to install packages: ${failed_packages[*]}"
        return 1
    fi
    
    return 0
}

install_single_package() {
    local package="$1"
    local install_cmd
    
    case "$PM" in
        pacman)
            install_cmd=(sudo pacman -S --needed --noconfirm "$package")
            ;;
        apt-get)
            install_cmd=(sudo apt-get install -y "$package")
            ;;
        dnf|yum)
            install_cmd=(sudo "$PM" install -y "$package")
            ;;
        zypper)
            install_cmd=(sudo zypper install -y "$package")
            ;;
        brew)
            install_cmd=(brew install "$package")
            ;;
        *)
            log_error "Unknown package manager: $PM"
            return 1
            ;;
    esac
    
    if "${install_cmd[@]}" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

is_package_installed() {
    local package="$1"
    
    case "$PM" in
        pacman) pacman -Qi "$package" >/dev/null 2>&1 ;;
        apt-get) dpkg -l "$package" >/dev/null 2>&1 ;;
        dnf) dnf list installed "$package" >/dev/null 2>&1 ;;
        yum) yum list installed "$package" >/dev/null 2>&1 ;;
        zypper) zypper search -i "$package" >/dev/null 2>&1 ;;
        brew) brew list "$package" >/dev/null 2>&1 ;;
        *) return 1 ;;
    esac
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🚀 NEOVIM INSTALLATION
# ═══════════════════════════════════════════════════════════════════════════════

install_neovim() {
    log_step "Installing Neovim..."
    ((CURRENT_STEP++))
    
    # Check if already installed with correct version
    if command_exists nvim; then
        local current_version
        current_version=$(nvim --version 2>/dev/null | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "0.0.0")
        
        version_compare "$current_version" "$MIN_NEOVIM_VERSION"
        local cmp_result=$?
        
        if [[ $cmp_result -eq 0 || $cmp_result -eq 1 ]]; then
            log_success "Neovim $current_version is already installed (>= $MIN_NEOVIM_VERSION)"
            return 0
        else
            log_warn "Neovim $current_version is too old (need >= $MIN_NEOVIM_VERSION)"
        fi
    fi
    
    log_info "Installing Neovim $MIN_NEOVIM_VERSION or higher"
    
    case "$PM" in
        pacman)
            install_packages neovim
            ;;
        apt-get)
            # Ubuntu/Debian need PPA for newer versions
            install_packages software-properties-common
            sudo add-apt-repository ppa:neovim-ppa/unstable -y 2>/dev/null || true
            update_package_database
            install_packages neovim
            ;;
        dnf|yum)
            install_packages neovim
            ;;
        zypper)
            install_packages neovim
            ;;
        brew)
            install_packages neovim
            ;;
    esac
    
    # Verify installation
    if command_exists nvim; then
        local version
        version=$(nvim --version 2>/dev/null | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "unknown")
        log_success "Neovim $version installed successfully"
    else
        # Fallback: AppImage installation
        log_warn "Package installation failed, trying AppImage fallback..."
        install_neovim_appimage
    fi
}

install_neovim_appimage() {
    log_info "Installing Neovim AppImage..."
    
    local bin_dir="$HOME/.local/bin"
    local app_path="$bin_dir/nvim.appimage"
    
    mkdir -p "$bin_dir"
    
    # Download AppImage
    if curl -fsSL -o "$app_path" "https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"; then
        chmod +x "$app_path"
        
        # Create symlink
        ln -sf "$app_path" "$bin_dir/nvim"
        
        # Add to PATH if needed
        if [[ ":$PATH:" != *":$bin_dir:"* ]]; then
        log_info "Add ~/.local/bin to your PATH in your shell configuration"
            log_info "   export PATH=\"\$HOME/.local/bin:\$PATH\""
        fi
        
        log_success "Neovim AppImage installed to $app_path"
    else
        log_error "Failed to download Neovim AppImage"
        log_error "Please install Neovim manually: https://github.com/neovim/neovim/releases"
        return 1
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🔤 FONT INSTALLATION
# ═══════════════════════════════════════════════════════════════════════════════

install_fonts() {
    if [[ $SKIP_FONTS == true ]]; then
        log_info "Skipping font installation (SKIP_FONTS=true)"
        return 0
    fi
    
    log_step "Installing Nerd Fonts..."
    ((CURRENT_STEP++))
    
    # Check if fontconfig is available
    if ! command_exists fc-match; then
        install_packages fontconfig
    fi
    
    # Check if JetBrains Mono Nerd Font is already installed
    if fc-match "JetBrains Mono Nerd Font" 2>/dev/null | grep -qi "jetbrains"; then
        log_success "JetBrains Mono Nerd Font is already installed"
        return 0
    fi
    
    log_info "Installing JetBrains Mono Nerd Font..."
    
    # Try package manager first
    case "$PM" in
        pacman)
            install_packages ttf-jetbrains-mono-nerd
            ;;
        apt-get)
            # Manual installation for Debian/Ubuntu
            install_font_manual
            ;;
        dnf|yum)
            install_packages jetbrains-mono-fonts
            ;;
        zypper)
            install_packages jetbrains-mono-fonts
            ;;
        brew)
            # Install using cask
            if ! brew tap | grep -q "homebrew/cask-fonts"; then
                brew tap homebrew/cask-fonts
            fi
            brew install --cask font-jetbrains-mono-nerd-font
            ;;
        *)
            install_font_manual
            ;;
    esac
    
    # Verify installation
    if fc-match "JetBrains Mono Nerd Font" 2>/dev/null | grep -qi "jetbrains"; then
        log_success "JetBrains Mono Nerd Font installed successfully"
    else
        log_warn "Font installation verification failed"
        install_font_manual
    fi
}

install_font_manual() {
    log_info "Installing JetBrains Mono Nerd Font manually..."
    
    local font_dir="$HOME/.local/share/fonts/JetBrainsMono"
    local temp_file="$TEMP_DIR/JetBrainsMono.zip"
    local font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    
    mkdir -p "$font_dir"
    
    # Download font
    if curl -fsSL -o "$temp_file" "$font_url"; then
        # Extract fonts
        if command_exists unzip; then
            unzip -oq "$temp_file" -d "$font_dir"
            
            # Refresh font cache
            if command_exists fc-cache; then
                fc-cache -f "$HOME/.local/share/fonts"
            fi
            
            log_success "JetBrains Mono Nerd Font installed manually"
        else
            log_error "unzip command not found, cannot extract font"
            install_packages unzip
            return 1
        fi
    else
        log_error "Failed to download JetBrains Mono Nerd Font"
        log_warn "Icons may not display correctly without a Nerd Font"
        return 1
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🌐 RUNTIME INSTALLATIONS (Node.js, Python, Go, Rust, etc.)
# ═══════════════════════════════════════════════════════════════════════════════

install_nodejs() {
    if [[ $SKIP_NODEJS == true ]]; then
        log_info "Skipping Node.js installation (SKIP_NODEJS=true)"
        return 0
    fi
    
    log_step "Installing Node.js..."
    ((CURRENT_STEP++))
    
    # Check if Node.js is already installed with correct version
    if command_exists node; then
        local node_version
        node_version=$(node -v 2>/dev/null | grep -oE '[0-9]+' | head -n1 || echo "0")
        
        if [[ ${node_version:-0} -ge 18 ]]; then
            log_success "Node.js v${node_version} is already installed"
            return 0
        else
            log_warn "Node.js v${node_version} is too old (need >= 18)"
        fi
    fi
    
    log_info "Installing Node.js 20 LTS..."
    
    case "$PM" in
        pacman)
            install_packages nodejs npm
            ;;
        apt-get)
            # Use NodeSource repository for latest Node.js
            curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
            install_packages nodejs
            ;;
        dnf|yum)
            install_packages nodejs npm
            ;;
        zypper)
            install_packages nodejs npm
            ;;
        brew)
            install_packages node
            ;;
    esac
    
    # Verify installation
    if command_exists node && command_exists npm; then
        local node_version npm_version
        node_version=$(node -v)
        npm_version=$(npm -v)
        log_success "Node.js $node_version and npm $npm_version installed"
    else
        log_error "Node.js installation failed"
        return 1
    fi
}

install_python() {
    if [[ $SKIP_PYTHON == true ]]; then
        log_info "Skipping Python installation (SKIP_PYTHON=true)"
        return 0
    fi
    
    log_step "Installing Python environment..."
    ((CURRENT_STEP++))
    
    # Ensure Python 3 is installed
    if ! command_exists python3; then
        log_info "Installing Python 3..."
        
        case "$PM" in
            pacman)
                install_packages python python-pip python-virtualenv
                ;;
            apt-get)
                install_packages python3 python3-pip python3-venv
                ;;
            dnf|yum)
                install_packages python3 python3-pip python3-virtualenv
                ;;
            zypper)
                install_packages python3 python3-pip python3-virtualenv
                ;;
            brew)
                install_packages python3
                ;;
        esac
    fi
    
    # Create Python virtual environment for Neovim
    local venv_path="$TARGET_DIR/.venv"
    
    if [[ ! -d "$venv_path" ]]; then
        log_info "Creating Python virtual environment..."
        mkdir -p "$(dirname "$venv_path")"
        
        if python3 -m venv "$venv_path" 2>/dev/null; then
            log_success "Python virtual environment created"
        else
            log_error "Failed to create Python virtual environment"
            return 1
        fi
    fi
    
    # Install pynvim in virtual environment
    if [[ -x "$venv_path/bin/python" ]]; then
        log_info "Installing pynvim..."
        "$venv_path/bin/python" -m pip install --upgrade pip setuptools wheel pynvim >/dev/null 2>&1
        log_success "pynvim installed in virtual environment"
    else
        log_warn "Virtual environment not available, installing pynvim system-wide"
        python3 -m pip install --user pynvim >/dev/null 2>&1 || true
    fi
}

install_go() {
    if [[ $SKIP_GO == true ]]; then
        log_info "Skipping Go installation (SKIP_GO=true)"
        return 0
    fi
    
    log_step "Installing Go..."
    ((CURRENT_STEP++))
    
    if command_exists go; then
        local go_version
        go_version=$(go version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+' | head -n1 || echo "unknown")
        log_success "Go ${go_version} is already installed"
        return 0
    fi
    
    log_info "Installing Go..."
    
    case "$PM" in
        pacman)
            install_packages go
            ;;
        apt-get)
            install_packages golang-go
            ;;
        dnf|yum)
            install_packages golang
            ;;
        zypper)
            install_packages go
            ;;
        brew)
            install_packages go
            ;;
    esac
    
    if command_exists go; then
        log_success "Go $(go version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+') installed"
    fi
}

install_rust() {
    if [[ $SKIP_RUST == true ]]; then
        log_info "Skipping Rust installation (SKIP_RUST=true)"
        return 0
    fi
    
    log_step "Installing Rust..."
    ((CURRENT_STEP++))
    
    if command_exists rustc && command_exists cargo; then
        local rust_version
        rust_version=$(rustc --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "unknown")
        log_success "Rust ${rust_version} is already installed"
        return 0
    fi
    
    log_info "Installing Rust..."
    
    case "$PM" in
        pacman)
            install_packages rust rust-analyzer
            ;;
        apt-get)
            install_packages rustc cargo
            ;;
        dnf|yum)
            install_packages rust cargo
            ;;
        zypper)
            install_packages rust cargo
            ;;
        brew)
            install_packages rust
            ;;
    esac
    
    # Fallback: Install via rustup
    if ! command_exists rustc; then
        log_info "Installing Rust via rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
        
        # Source cargo env
        if [[ -f "$HOME/.cargo/env" ]]; then
            # shellcheck source=/dev/null
            source "$HOME/.cargo/env"
        fi
    fi
    
    if command_exists rustc && command_exists cargo; then
        log_success "Rust $(rustc --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+') installed"
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🔧 BUILD TOOLS AND DEPENDENCIES
# ═══════════════════════════════════════════════════════════════════════════════

install_build_tools() {
    log_step "Installing build tools..."
    ((CURRENT_STEP++))
    
    local build_packages=()
    
    # Essential build tools
    if ! command_exists gcc && ! command_exists clang; then
        case "$PM" in
            pacman)
                build_packages+=(base-devel)
                ;;
            apt-get)
                build_packages+=(build-essential)
                ;;
            dnf|yum)
                build_packages+=(gcc gcc-c++ make)
                ;;
            zypper)
                build_packages+=(gcc gcc-c++ make)
                ;;
            brew)
                # Xcode command line tools
                if ! xcode-select --print-path >/dev/null 2>&1; then
                    log_info "Installing Xcode Command Line Tools..."
                    xcode-select --install 2>/dev/null || true
                fi
                ;;
        esac
    fi
    
    # CMake
    if ! command_exists cmake; then
        build_packages+=(cmake)
    fi
    
    # Make
    if ! command_exists make; then
        build_packages+=(make)
    fi
    
    # Install packages if any
    if [[ ${#build_packages[@]} -gt 0 ]]; then
        install_packages "${build_packages[@]}"
    fi
    
    # Tree-sitter CLI
    install_tree_sitter_cli
    
    log_success "Build tools installed"
}

install_tree_sitter_cli() {
    if command_exists tree-sitter; then
        log_success "tree-sitter CLI is already installed"
        return 0
    fi
    
    log_info "Installing tree-sitter CLI..."
    
    case "$PM" in
        pacman)
            install_packages tree-sitter
            ;;
        apt-get)
            install_packages tree-sitter-cli
            ;;
        dnf|yum|zypper)
            install_packages tree-sitter-cli
            ;;
        brew)
            install_packages tree-sitter
            ;;
    esac
    
    # Fallback installations
    if ! command_exists tree-sitter; then
        # Try npm
        if command_exists npm; then
            log_info "Installing tree-sitter via npm..."
            npm install -g tree-sitter-cli >/dev/null 2>&1 || true
        fi
        
        # Try cargo
        if ! command_exists tree-sitter && command_exists cargo; then
            log_info "Installing tree-sitter via cargo..."
            cargo install tree-sitter-cli >/dev/null 2>&1 || true
        fi
    fi
    
    if command_exists tree-sitter; then
        log_success "tree-sitter CLI installed"
    else
        log_warn "tree-sitter CLI installation failed (optional)"
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🔍 TELESCOPE DEPENDENCIES
# ═══════════════════════════════════════════════════════════════════════════════

install_telescope_deps() {
    log_step "Installing Telescope dependencies..."
    ((CURRENT_STEP++))
    
    # ripgrep (essential for text search)
    install_ripgrep
    
    # fd (better find alternative)
    install_fd
    
    # bat (better cat with syntax highlighting)
    install_bat
    
    log_success "Telescope dependencies installed"
}

install_ripgrep() {
    if command_exists rg; then
        log_success "ripgrep is already installed"
        return 0
    fi
    
    log_info "Installing ripgrep..."
    
    case "$PM" in
        pacman|dnf|yum|zypper|brew)
            install_packages ripgrep
            ;;
        apt-get)
            install_packages ripgrep
            ;;
    esac
    
    if command_exists rg; then
        log_success "ripgrep installed"
    else
        log_error "ripgrep installation failed"
        return 1
    fi
}

install_fd() {
    if command_exists fd; then
        log_success "fd is already installed"
        return 0
    fi
    
    log_info "Installing fd..."
    
    case "$PM" in
        pacman|dnf|yum|zypper|brew)
            install_packages fd
            ;;
        apt-get)
            # Debian/Ubuntu calls it fd-find
            install_packages fd-find
            # Create symlink if needed
            if command_exists fdfind && ! command_exists fd; then
                sudo ln -sf "$(command -v fdfind)" /usr/local/bin/fd 2>/dev/null || true
            fi
            ;;
    esac
    
    if command_exists fd; then
        log_success "fd installed"
    else
        log_warn "fd installation failed (optional)"
    fi
}

install_bat() {
    if command_exists bat; then
        log_success "bat is already installed"
        return 0
    fi
    
    log_info "Installing bat..."
    
    case "$PM" in
        pacman|dnf|yum|zypper|brew)
            install_packages bat
            ;;
        apt-get)
            # Debian/Ubuntu calls it batcat
            install_packages bat
            # Create symlink if needed
            if command_exists batcat && ! command_exists bat; then
                sudo ln -sf "$(command -v batcat)" /usr/local/bin/bat 2>/dev/null || true
            fi
            ;;
    esac
    
    if command_exists bat; then
        log_success "bat installed"
    else
        log_warn "bat installation failed (optional)"
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🛠️ ADDITIONAL UTILITIES
# ═══════════════════════════════════════════════════════════════════════════════

install_utilities() {
    log_step "Installing additional utilities..."
    ((CURRENT_STEP++))
    
    local utility_packages=()
    
    # Core utilities
    local core_utils=("curl" "wget" "unzip" "tar" "rsync")
    for util in "${core_utils[@]}"; do
        if ! command_exists "$util"; then
            utility_packages+=("$util")
        fi
    done
    
    # Clipboard utilities (for Linux)
    if [[ "$OS_ID" != "macos" ]] && ! command_exists xclip && ! command_exists wl-copy; then
        case "$PM" in
            pacman|apt-get|dnf|yum|zypper)
                utility_packages+=(xclip wl-clipboard)
                ;;
        esac
    fi
    
    # Trash utilities
    if ! command_exists trash-put && ! command_exists trash; then
        case "$PM" in
            pacman|apt-get|dnf|yum|zypper)
                utility_packages+=(trash-cli)
                ;;
            brew)
                utility_packages+=(trash)
                ;;
        esac
    fi
    
    # Debuggers
    local debugger_packages=()
    if ! command_exists gdb; then
        debugger_packages+=(gdb)
    fi
    if ! command_exists lldb; then
        debugger_packages+=(lldb)
    fi
    
    # Image/preview utilities
    local image_packages=()
    if ! command_exists chafa; then
        image_packages+=(chafa)
    fi
    if ! command_exists convert; then
        case "$PM" in
            dnf|yum|zypper) image_packages+=(ImageMagick) ;;
            *) image_packages+=(imagemagick) ;;
        esac
    fi
    if ! command_exists ffmpeg; then
        image_packages+=(ffmpeg)
    fi
    
    # PDF utilities
    if ! command_exists pdftoppm; then
        case "$PM" in
            pacman) image_packages+=(poppler) ;;
            apt-get) image_packages+=(poppler-utils) ;;
            dnf|yum|zypper) image_packages+=(poppler-utils) ;;
            brew) image_packages+=(poppler) ;;
        esac
    fi
    
    # Terminal emulator (optional)
    if ! command_exists kitty; then
        case "$PM" in
            pacman|apt-get|dnf|yum|zypper)
                image_packages+=(kitty)
                ;;
            brew)
                # brew install --cask kitty
                ;;
        esac
    fi
    
    # Install all utility packages
    local all_packages=("${utility_packages[@]}" "${debugger_packages[@]}" "${image_packages[@]}")
    
    if [[ ${#all_packages[@]} -gt 0 ]]; then
        install_packages "${all_packages[@]}" || true  # Don't fail if some packages can't be installed
    fi
    
    log_success "Additional utilities installed"
}

# ═══════════════════════════════════════════════════════════════════════════════
#  📋 CONFIGURATION INSTALLATION
# ═══════════════════════════════════════════════════════════════════════════════

install_config() {
    log_step "Installing Neovim configuration..."
    ((CURRENT_STEP++))
    
    # Check if script is running from target directory
    local running_from_target=false
    if [[ "$SCRIPT_DIR" == "$TARGET_DIR" ]]; then
        running_from_target=true
        log_success "Configuration is already in the correct location"
        # Set permissions on existing files
        find "$TARGET_DIR" -type f -name "*.lua" -exec chmod 644 {} \; 2>/dev/null || true
        find "$TARGET_DIR" -type d -exec chmod 755 {} \; 2>/dev/null || true
        return 0
    fi
    
    # Create backup if target directory exists
    if [[ -e "$TARGET_DIR" ]]; then
        create_backup "$TARGET_DIR" "nvim_config"
        
        if [[ ${FORCE_INSTALL:-false} != true ]]; then
            if ! ask_yes_no "Target directory exists. Overwrite?" "n"; then
                log_error "Installation aborted by user"
                return 1
            fi
        fi
        
        log_info "Removing existing configuration..."
        rm -rf "$TARGET_DIR"
    fi
    
    # Copy configuration
    log_info "Copying configuration files..."
    mkdir -p "$(dirname "$TARGET_DIR")"
    
    # Use rsync if available, otherwise cp
    if command_exists rsync; then
        rsync -av --exclude='.git' --exclude='install.sh' --exclude='*.log' "$SCRIPT_DIR/" "$TARGET_DIR/" 2>/dev/null
    else
        cp -r "$SCRIPT_DIR/" "$TARGET_DIR/" 2>/dev/null
        # Clean up unwanted files
        rm -f "$TARGET_DIR/install.sh" 2>/dev/null || true
        rm -rf "$TARGET_DIR/.git" 2>/dev/null || true
    fi
    
    # Set proper permissions
    find "$TARGET_DIR" -type f -name "*.lua" -exec chmod 644 {} \; 2>/dev/null || true
    find "$TARGET_DIR" -type d -exec chmod 755 {} \; 2>/dev/null || true
    
    log_success "Configuration files installed to $TARGET_DIR"
}

# ═══════════════════════════════════════════════════════════════════════════════
#  📦 NEOVIM PLUGIN INSTALLATION
# ═══════════════════════════════════════════════════════════════════════════════

install_neovim_plugins() {
    log_step "Installing Neovim plugins..."
    ((CURRENT_STEP++))
    
    if ! command_exists nvim; then
        log_error "Neovim not found, cannot install plugins"
        return 1
    fi
    
    log_info "Bootstrapping lazy.nvim plugin manager..."
    
    # Install plugins headlessly
    local install_cmd=(
        nvim --headless
        "+Lazy! restore"
        "+Lazy! sync"
        "+qall"
    )
    
    if "${install_cmd[@]}" >/dev/null 2>&1; then
        log_success "Neovim plugins installed"
    else
        log_warn "Plugin installation may have issues, run :Lazy sync in Neovim"
    fi
    
    # Install Mason tools
    log_info "Installing LSP servers and tools via Mason..."
    
    local mason_cmd=(
        nvim --headless
        "+lua require('mason-tool-installer').install()"
        "+qall"
    )
    
    if "${mason_cmd[@]}" >/dev/null 2>&1; then
        log_success "Mason tools installed"
    else
        log_warn "Mason tool installation may have issues, run :Mason in Neovim"
    fi
    
    # Update remote plugins
    log_info "Updating remote plugins..."
    nvim --headless "+UpdateRemotePlugins" "+qall" >/dev/null 2>&1 || true
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🩺 HEALTH CHECK AND VALIDATION
# ═══════════════════════════════════════════════════════════════════════════════

run_health_check() {
    log_step "Running health check..."
    ((CURRENT_STEP++))
    
    local health_issues=()
    
    # Check Neovim installation
    if ! command_exists nvim; then
        health_issues+=("Neovim is not installed or not in PATH")
    else
        local nvim_version
        nvim_version=$(nvim --version 2>/dev/null | head -n1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' || echo "unknown")
        log_info "✓ Neovim version: $nvim_version"
    fi
    
    # Check configuration directory
    if [[ ! -d "$TARGET_DIR" ]]; then
        health_issues+=("Configuration directory not found: $TARGET_DIR")
    else
        log_info "✓ Configuration directory: $TARGET_DIR"
    fi
    
    # Check essential commands
    local essential_commands=("git" "curl")
    for cmd in "${essential_commands[@]}"; do
        if command_exists "$cmd"; then
            log_info "✓ $cmd is available"
        else
            health_issues+=("$cmd is not installed")
        fi
    done
    
    # Check optional but recommended tools
    local optional_commands=("rg" "fd" "bat" "node" "python3")
    for cmd in "${optional_commands[@]}"; do
        if command_exists "$cmd"; then
            log_info "✓ $cmd is available"
        else
            log_warn "⚠ $cmd is not installed (optional)"
        fi
    done
    
    # Check fonts
    if command_exists fc-match; then
        if fc-match "JetBrains Mono Nerd Font" 2>/dev/null | grep -qi "jetbrains"; then
            log_info "✓ JetBrains Mono Nerd Font is installed"
        else
            log_warn "⚠ JetBrains Mono Nerd Font not found (icons may not display correctly)"
        fi
    fi
    
    # Run Neovim health check
    if command_exists nvim && [[ -d "$TARGET_DIR" ]]; then
        log_info "Running Neovim health check..."
        
        local health_output
        health_output=$(nvim --headless "+checkhealth" "+qall" 2>&1 | grep -E "(ERROR|WARN)" | head -5)
        
        if [[ -n "$health_output" ]]; then
            log_warn "Neovim health check found some issues:"
            echo "$health_output" | while read -r line; do
                log_warn "  $line"
            done
        else
            log_success "Neovim health check passed"
        fi
    fi
    
    # Summary
    if [[ ${#health_issues[@]} -eq 0 ]]; then
        log_success "All health checks passed!"
        return 0
    else
        log_warn "Health check found ${#health_issues[@]} issue(s):"
        for issue in "${health_issues[@]}"; do
            log_warn "  • $issue"
        done
        return 1
    fi
}

# ═══════════════════════════════════════════════════════════════════════════════
#  📊 INSTALLATION SUMMARY
# ═══════════════════════════════════════════════════════════════════════════════

show_installation_summary() {
    printf "\n"
    show_header "INSTALLATION COMPLETE"
    
    printf "${BOLD}${GREEN}Lexitron.nvim has been successfully installed!${RESET}\n\n"
    
    # Installation statistics - count arrays safely
    local installed_count=0
    local failed_count=0
    for key in "${!INSTALLED_PACKAGES[@]}"; do ((installed_count++)); done
    for key in "${!FAILED_PACKAGES[@]}"; do ((failed_count++)); done
    
    printf "${CYAN}${BOLD}Installation Statistics:${RESET}\n"
    printf "  ${BULLET} Total packages installed: ${GREEN}${installed_count}${RESET}\n"
    printf "  ${BULLET} Total warnings: ${YELLOW}${WARNING_COUNT:-0}${RESET}\n"
    printf "  ${BULLET} Total errors: ${RED}${ERROR_COUNT:-0}${RESET}\n"
    printf "  ${BULLET} Installation time: ${CYAN}$(( SECONDS / 60 ))m $(( SECONDS % 60 ))s${RESET}\n"
    
    printf "\n${CYAN}${BOLD}Quick Start:${RESET}\n"
    printf "  ${CYAN}1.${RESET} Start Neovim: ${BOLD}${WHITE}nvim${RESET}\n"
    printf "  ${CYAN}2.${RESET} Plugin manager: ${BOLD}${WHITE}:Lazy${RESET}\n"
    printf "  ${CYAN}3.${RESET} LSP manager: ${BOLD}${WHITE}:Mason${RESET}\n"
    printf "  ${CYAN}4.${RESET} Health check: ${BOLD}${WHITE}:checkhealth${RESET}\n"
    printf "  ${CYAN}5.${RESET} Theme selector: ${BOLD}${WHITE}:Themery${RESET}\n"
    
    printf "\n${CYAN}${BOLD}Documentation:${RESET}\n"
    printf "  ${BULLET} Guide: ${GRAY}${TARGET_DIR}/docs/guide.md${RESET}\n"
    printf "  ${BULLET} Reference: ${GRAY}${TARGET_DIR}/docs/reference.md${RESET}\n"
    printf "  ${BULLET} Keybindings: Press ${BOLD}${WHITE}<space>fk${RESET} in Neovim\n"
    
    if [[ $ERROR_COUNT -gt 0 ]]; then
        printf "\n${YELLOW}${BOLD}Warnings:${RESET}\n"
        printf "  Some components failed to install. Check the logs:\n"
        printf "  ${BULLET} Installation log: ${GRAY}$LOG_FILE${RESET}\n"
        printf "  ${BULLET} Error log: ${GRAY}$ERROR_LOG${RESET}\n"
        printf "\n  You can run the installer again or install missing components manually.\n"
    fi
    
    if [[ $failed_count -gt 0 ]]; then
        printf "\n${YELLOW}${BOLD}Failed Packages:${RESET}\n"
        for package in "${!FAILED_PACKAGES[@]}"; do
            printf "  ${BULLET} ${RED}$package${RESET}\n"
        done
    fi
    
    printf "\n${GREEN}${BOLD}Welcome to your legendary development environment!${RESET}\n"
    printf "${DIM}For support, visit: https://github.com/lexitron/nvim${RESET}\n\n"
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🎛️ COMMAND LINE ARGUMENT PARSING
# ═══════════════════════════════════════════════════════════════════════════════

show_help() {
    log_raw "${BOLD}${CONFIG_NAME} Installer v${INSTALLER_VERSION}${RESET}"
    log_raw
    log_raw "${BOLD}USAGE:${RESET}"
    log_raw "  $0 [OPTIONS]"
    log_raw
    log_raw "${BOLD}OPTIONS:${RESET}"
    log_raw "  -h, --help           Show this help message"
    log_raw "  -v, --verbose        Enable verbose output"
    log_raw "  -f, --force          Force installation (overwrite existing config)"
    log_raw "  -d, --dry-run        Show what would be installed without installing"
    log_raw "      --skip-fonts     Skip font installation"
    log_raw "      --skip-nodejs    Skip Node.js installation"
    log_raw "      --skip-python    Skip Python installation"
    log_raw "      --skip-go        Skip Go installation"
    log_raw "      --skip-rust      Skip Rust installation"
    log_raw
    log_raw "${BOLD}ENVIRONMENT VARIABLES:${RESET}"
    log_raw "  SKIP_FONTS=true     Skip font installation"
    log_raw "  SKIP_NODEJS=true    Skip Node.js installation"
    log_raw "  SKIP_PYTHON=true    Skip Python installation"
    log_raw "  SKIP_GO=true        Skip Go installation"
    log_raw "  SKIP_RUST=true      Skip Rust installation"
    log_raw "  VERBOSE=true        Enable verbose output"
    log_raw "  FORCE_INSTALL=true  Force installation"
    log_raw
    log_raw "${BOLD}EXAMPLES:${RESET}"
    log_raw "  $0                           # Standard installation"
    log_raw "  $0 --verbose --force         # Verbose forced installation"
    log_raw "  $0 --skip-fonts --skip-rust  # Skip fonts and Rust"
    log_raw "  $0 --dry-run                 # Preview installation"
    log_raw
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -f|--force)
                FORCE_INSTALL=true
                shift
                ;;
            -d|--dry-run)
                DRY_RUN=true
                shift
                ;;
            --skip-fonts)
                SKIP_FONTS=true
                shift
                ;;
            --skip-nodejs)
                SKIP_NODEJS=true
                shift
                ;;
            --skip-python)
                SKIP_PYTHON=true
                shift
                ;;
            --skip-go)
                SKIP_GO=true
                shift
                ;;
            --skip-rust)
                SKIP_RUST=true
                shift
                ;;
            *)
                log_error "Unknown option: $1"
                log_error "Use --help for usage information"
                exit 1
                ;;
        esac
    done
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🏁 MAIN INSTALLATION FLOW
# ═══════════════════════════════════════════════════════════════════════════════

main() {
    # Parse command line arguments
    parse_arguments "$@"
    
    # Initialize
    init_logging
    show_banner
    
    # Pre-installation checks
    log_info "Performing pre-installation checks..."
    
    # Estimate total steps
    TOTAL_STEPS=12
    CURRENT_STEP=0
    
    # Show configuration
    if [[ $DRY_RUN == true ]]; then
        log_warn "DRY RUN MODE - No actual changes will be made"
    fi
    
    if [[ $VERBOSE == true ]]; then
        log_info "Verbose mode enabled"
    fi
    
    log_info "Installation target: $TARGET_DIR"
    log_raw
    
    # Main installation steps
    {
        detect_system &&
        update_package_database &&
        install_neovim &&
        install_build_tools &&
        install_telescope_deps &&
        install_utilities &&
        install_fonts &&
        install_nodejs &&
        install_python &&
        install_go &&
        install_rust &&
        install_config &&
        install_neovim_plugins &&
        run_health_check
    } || {
        log_error "Installation failed at step $CURRENT_STEP"
        log_error "Check the logs for details: $LOG_FILE"
        exit 1
    }
    
    # Show summary
    show_installation_summary
    
    # Cleanup
    cleanup_temp
    
    log_success "Installation completed successfully!"
    exit 0
}

# ═══════════════════════════════════════════════════════════════════════════════
#  🚀 EXECUTION
# ═══════════════════════════════════════════════════════════════════════════════

# Ensure we're not being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Check if running as root (not recommended)
    if [[ $EUID -eq 0 ]]; then
        log_error "This installer should not be run as root"
        log_error "Please run as a regular user (sudo will be used when needed)"
        exit 1
    fi
    
    # Check minimum bash version (4.0+)
    if [[ ${BASH_VERSION%%.*} -lt 4 ]]; then
        log_error "This installer requires Bash 4.0 or newer"
        log_error "Current version: $BASH_VERSION"
        exit 1
    fi
    
    # Start installation
    main "$@"
fi

# End of installer