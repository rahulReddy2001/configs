return
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua", "bash", "c", "cpp", "java", "vim", "vimdoc", "yaml",  "markdown", "markdown_inline", "json"},
        highlight = { enable = true },
        indent = { enable = true }
      })
    end,
  }
