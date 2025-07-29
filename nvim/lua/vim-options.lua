vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Normal mode
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Go to tab by number in normal mode
vim.keymap.set('n', '<leader>1', '1gt', { silent = true })
vim.keymap.set('n', '<leader>2', '2gt', { silent = true })
vim.keymap.set('n', '<leader>3', '3gt', { silent = true })
vim.keymap.set('n', '<leader>4', '4gt', { silent = true })
vim.keymap.set('n', '<leader>5', '5gt', { silent = true })
vim.keymap.set('n', '<leader>6', '6gt', { silent = true })
vim.keymap.set('n', '<leader>7', '7gt', { silent = true })
vim.keymap.set('n', '<leader>8', '8gt', { silent = true })
vim.keymap.set('n', '<leader>9', '9gt', { silent = true })
vim.keymap.set('n', '<leader>0', ':tablast<CR>', { silent = true })

-- When a Neo-tree buffer opens, map `u` to reopen at the parent directory
vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.keymap.set("n", "u", ":Neotree ..<CR>", {
      buffer = true,
      noremap = true,
      silent = true,
      desc = "Neo-tree: open parent directory",
    })
  end,
})
