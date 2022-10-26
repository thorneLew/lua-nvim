local opt = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

map('n', '<leader>w', "<cmd>w<cr>", opt)
map('i', 'jk', "<esc>", opt)
map('n', '<leader>q', "<cmd>q<cr>", opt)
