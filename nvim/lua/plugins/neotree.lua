return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["u"] = "navigate_up",  
        },
      },
    },
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>e", ":Neotree<CR>", { desc = "Toggle Neo-tree" })
  end,
}

