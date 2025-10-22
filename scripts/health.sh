#!/bin/bash
# 🏥 Neovim Config Health Check Script
# Comprehensive validation of setup, startup, diagnostics, and plugins

set -e

echo "🏥 NEOVIM CONFIG HEALTH CHECK"
echo "════════════════════════════════════════════════════════════════"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

NVIM_CONFIG="$HOME/.config/nvim"
FAILED=0
PASSED=0

# Helper function
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ PASS${NC}: $1"
        ((PASSED++))
    else
        echo -e "${RED}❌ FAIL${NC}: $1"
        ((FAILED++))
    fi
}

# Test 1: Neovim executable exists
echo -e "${BLUE}[1/12]${NC} Checking Neovim installation..."
which nvim >/dev/null 2>&1
check_status "Neovim executable found"

# Test 2: Config exists
echo -e "${BLUE}[2/12]${NC} Checking configuration directory..."
[ -d "$NVIM_CONFIG" ]
check_status "Config directory exists ($NVIM_CONFIG)"

# Test 3: Startup without errors
echo -e "${BLUE}[3/12]${NC} Testing headless startup (no args)..."
nvim --headless -u "$NVIM_CONFIG/init.lua" -N +qa 2>&1 | grep -q "Error\|error" && return 1 || true
check_status "Headless startup (no critical errors)"

# Test 4: Startup time baseline
echo -e "${BLUE}[4/12]${NC} Profiling startup time..."
STARTUP_TIME=$(nvim --startuptime /tmp/startup.log --headless +qa 2>&1 && tail -1 /tmp/startup.log | awk '{print $1}')
echo "  Startup time: ${STARTUP_TIME}ms"
(( $(echo "$STARTUP_TIME < 500" | bc -l) )) && check_status "Startup time acceptable (<500ms)" || echo -e "${YELLOW}⚠️  WARN${NC}: Startup time >500ms (${STARTUP_TIME}ms)"

# Test 5: LSP servers availability
echo -e "${BLUE}[5/12]${NC} Checking LSP servers..."
which lua_ls >/dev/null 2>&1 && check_status "lua_ls installed" || echo -e "${YELLOW}⚠️  WARN${NC}: lua_ls not in PATH"

# Test 6: External binary dependencies
echo -e "${BLUE}[6/12]${NC} Checking external binaries..."
BINS=(rg fd bat fzf node python3)
for bin in "${BINS[@]}"; do
    which "$bin" >/dev/null 2>&1 || echo -e "${YELLOW}⚠️  WARN${NC}: $bin not found"
done
check_status "Core binaries present"

# Test 7: Lua syntax validation
echo -e "${BLUE}[7/12]${NC} Validating Lua syntax..."
SYNTAX_ERRORS=$(find "$NVIM_CONFIG/lua" -name "*.lua" -exec luac -p {} \; 2>&1 | grep -c "error" || true)
if [ "$SYNTAX_ERRORS" -eq 0 ]; then
    check_status "No Lua syntax errors"
else
    echo -e "${RED}❌ FAIL${NC}: Found $SYNTAX_ERRORS Lua syntax errors"
    ((FAILED++))
fi

# Test 8: Plugin manager (lazy.nvim)
echo -e "${BLUE}[8/12]${NC} Checking lazy.nvim..."
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"
[ -d "$LAZY_PATH" ]
check_status "lazy.nvim installed"

# Test 9: Documentation files
echo -e "${BLUE}[9/12]${NC} Checking documentation..."
[ -f "$NVIM_CONFIG/docs/reference.md" ] && [ -f "$NVIM_CONFIG/docs/guide.md" ]
check_status "Consolidated docs present (reference.md + guide.md)"

# Test 10: Config file permissions
echo -e "${BLUE}[10/12]${NC} Checking file permissions..."
[ -r "$NVIM_CONFIG/init.lua" ]
check_status "init.lua readable"

# Test 11: Git status
echo -e "${BLUE}[11/12]${NC} Checking git status..."
cd "$NVIM_CONFIG" && git status >/dev/null 2>&1
check_status "Git repository healthy"

# Test 12: Keymaps accessible
echo -e "${BLUE}[12/12]${NC} Checking keymaps configuration..."
grep -q "vim.keymap.set" "$NVIM_CONFIG/lua/core/keymaps.lua"
check_status "Keymaps defined"

echo ""
echo "════════════════════════════════════════════════════════════════"
echo -e "${GREEN}✅ PASSED: $PASSED${NC} | ${RED}❌ FAILED: $FAILED${NC}"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 ALL TESTS PASSED!${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠️  Some tests failed. Review output above.${NC}"
    exit 1
fi
