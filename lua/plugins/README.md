# 📦 Plugins Directory

This directory can be used for storing additional plugin specifications that are imported by the main Lazy.nvim configuration.

## Usage

Create plugin files here that export plugin specifications:

```lua
-- lua/plugins/example.lua
return {
    "author/plugin-name",
    event = "VeryLazy", 
    config = function()
        -- Plugin configuration
    end,
}
```

## Current Status

Currently, all plugins are organized in categorized directories:
- `ui/` - UI and theming plugins
- `completion/` - Completion and snippets
- `editor/` - Editing enhancements
- `navigation/` - Navigation and file management
- `lsp/` - Language server protocol
- `git/` - Git integration
- `debugging/` - Debugging tools
- `utils/` - Utility plugins

This directory is reserved for future plugin additions or experimental configurations.
