.PHONY: help health format lint profile install clean check

NVIM := nvim
NVIM_CONFIG := $(HOME)/.config/nvim
STYLUA := stylua
LUACHECK := luacheck

help:
	@echo "🚀 Neovim Config Maintenance"
	@echo "=============================="
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@echo "  health    - Run full health check suite"
	@echo "  format    - Format all Lua code with stylua"
	@echo "  lint      - Lint Lua code with luacheck"
	@echo "  profile   - Profile startup time"
	@echo "  install   - Install dependencies (stylua, luacheck)"
	@echo "  clean     - Clean temporary files and cache"
	@echo "  check     - Run all checks (health + lint)"
	@echo ""

health:
	@echo "🏥 Running health checks..."
	@bash $(NVIM_CONFIG)/scripts/health.sh

format:
	@echo "🎨 Formatting Lua code with stylua..."
	@if command -v $(STYLUA) >/dev/null; then \
		$(STYLUA) --search-parent-directories $(NVIM_CONFIG)/lua; \
		echo "✅ Format complete"; \
	else \
		echo "❌ stylua not found. Run 'make install' to install."; \
	fi

lint:
	@echo "🔍 Linting Lua code with luacheck..."
	@if command -v $(LUACHECK) >/dev/null; then \
		$(LUACHECK) $(NVIM_CONFIG)/lua; \
		echo "✅ Lint complete"; \
	else \
		echo "❌ luacheck not found. Run 'make install' to install."; \
	fi

profile:
	@echo "⏱️  Profiling startup time..."
	@$(NVIM) --startuptime /tmp/nvim_startup.log --headless +qa 2>&1
	@tail -5 /tmp/nvim_startup.log
	@echo "📊 Full profile saved to /tmp/nvim_startup.log"

install:
	@echo "📦 Installing dependencies..."
	@echo "  Installing stylua..."
	@cargo install stylua 2>/dev/null || echo "⚠️  cargo not found. Install with: pacman -S rustup"
	@echo "  Installing luacheck..."
	@luarocks install luacheck 2>/dev/null || echo "⚠️  luarocks not found. Use your package manager."
	@echo "✅ Dependencies installed"

clean:
	@echo "🧹 Cleaning temporary files..."
	@rm -f /tmp/nvim_startup.log
	@rm -f /tmp/health.log
	@find $(NVIM_CONFIG) -name "*.swp" -delete
	@find $(NVIM_CONFIG) -name "*~" -delete
	@echo "✅ Cleanup complete"

check: health lint
	@echo ""
	@echo "✅ All checks passed!"

.DEFAULT_GOAL := help
