# 📝 Neovim Configuration

This directory contains my Neovim configuration, written in **Lua**, and powered by [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## 📂 Structure

```text
nvim/
├── init.lua                -- Entry point for Neovim
└── plugins/                -- Plugin-specific configurations
    ├── catppuccin.lua      -- Color theme (Catppuccin)
    ├── completions.lua     -- Auto-completion and snippets
    ├── lsp-config.lua      -- LSP integration
    ├── lualine.lua         -- Statusline plugin
    ├── neotree.lua         -- File explorer sidebar
    ├── telescope.lua       -- Fuzzy finder
    └── treesitter.lua      -- Syntax highlighting and parsing
