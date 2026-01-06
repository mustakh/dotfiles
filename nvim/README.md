# Neovim Configuration

This is a modular Neovim configuration using the kickstart template as a base. The configuration is organized into separate files for better maintainability and readability.

## Directory Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json           # Plugin lock file (auto-generated)
├── lua/
│   ├── config/              # Configuration modules
│   │   ├── options.lua      # Vim options and settings
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Autocommands
│   │   └── lazy.lua         # Lazy plugin manager setup
│   └── plugins/             # Plugin configurations by category
│       ├── ui.lua           # UI-related plugins
│       ├── editing.lua      # Editing plugins
│       ├── completion.lua   # Completion plugins
│       ├── lsp.lua          # LSP and formatting plugins
│       ├── git.lua          # Git-related plugins
│       ├── utility.lua      # Utility plugins
│       ├── telescope.lua    # Telescope plugins
│       └── treesitter.lua   # Treesitter plugins
└── ...
```

## Configuration Modules

### `lua/config/options.lua`
Contains all vim options and settings such as indentation, colors, search settings, etc.

### `lua/config/keymaps.lua`
Contains all key mappings organized by functionality.

### `lua/config/autocmds.lua`
Contains autocommands for various events.

### `lua/config/lazy.lua`
Sets up the Lazy plugin manager and imports all plugin configurations.

## Plugin Categories

Plugins are organized into logical categories:

- **UI**: Colorschemes, statusline, which-key
- **Editing**: Auto-pairs, surround, text objects, file managers
- **Completion**: Completion plugins (nvim-cmp)
- **LSP**: LSP configuration, formatters, language-specific tools
- **Git**: Git integration plugins
- **Utility**: General utility plugins
- **Telescope**: Fuzzy finder and picker plugins
- **Treesitter**: Syntax highlighting and parsing

## Key Features

- Modular architecture for easy maintenance
- Lazy loading for better startup performance
- Organized plugin management with categories
- Comprehensive LSP setup with formatting
- Git integration
- Fuzzy finding with Telescope
- Syntax highlighting with Treesitter
- Modern UI with statusline and colorscheme

## Installation

1. Make sure you have Neovim 0.9+ installed
2. Install this configuration by cloning to `~/.config/nvim/`
3. Start Neovim - plugins will be automatically installed
4. Run `:Lazy` to manage plugins

## Customization

To customize this configuration:

1. Add new plugins to the appropriate category in `lua/plugins/`
2. Modify options in `lua/config/options.lua`
3. Add keymaps in `lua/config/keymaps.lua`
4. Add autocommands in `lua/config/autocmds.lua`