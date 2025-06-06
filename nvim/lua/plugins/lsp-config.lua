return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"vimls", "pyright", "clangd", "bashls"},
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.vimls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,{})
    end
  }
}
