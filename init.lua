-- ████████╗██╗  ██╗███████╗    ██████╗ ███████╗██████╗ ███████╗███████╗ ██████╗████████╗
-- ╚══██╔══╝██║  ██║██╔════╝    ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝╚══██╔══╝
--    ██║   ███████║█████╗      ██████╔╝█████╗  ██████╔╝█████╗  █████╗  ██║        ██║   
--    ██║   ██╔══██║██╔══╝      ██╔═══╝ ██╔══╝  ██╔══██╗██╔══╝  ██╔══╝  ██║        ██║   
--    ██║   ██║  ██║███████╗    ██║     ███████╗██║  ██║██║     ███████╗╚██████╗   ██║   
--    ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝ ╚═════╝   ╚═╝   
--                                                                                        
--    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗                                
--    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║                                
--    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║                                
--    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║                                
--    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║                                
--    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝                                

-- 🎨 Ultimate IDE Experience - Professional Configuration
-- ✨ Catppuccin Mocha Theme | 🚀 Lightning Fast | 🔥 Feature Complete

-- Disable vim distribution plugins
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1  
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1

-- Set modifiable for all buffers
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    callback = function()
        vim.bo.modifiable = true
    end,
})

-- Suppress deprecation warnings until plugins update
vim.deprecate = function() end

-- Use a per-config Python venv for the Neovim Python provider if available
-- This ensures we don't rely on system Python and avoids PEP 668 issues.
-- Does not override an existing user setting.
 do
  local venv_python = vim.fn.stdpath("config") .. "/.venv/bin/python"
  if (vim.g.python3_host_prog == nil or vim.g.python3_host_prog == "") and vim.fn.executable(venv_python) == 1 then
    vim.g.python3_host_prog = venv_python
  end
end

-- Disable default intro screen
vim.opt.shortmess:append("I")

-- Bootstrap the perfect configuration
require("core")
require("ui.highlights")
require("ui.transparency").setup()

-- Initialize workspace tracker
vim.defer_fn(function()
    require("ui.workspace-tracker").setup()
end, 100)

-- Config loaded silently - only show errors
