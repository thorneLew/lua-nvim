local opt = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

map('n', '<leader>w', "<cmd>w<cr>", opt)
map('i', 'jk', "<esc>", opt)
map('n', '<leader>q', "<cmd>q<cr>", opt)
map('n', '<leader><cr>', "<cmd>nohlsearch<cr>", opt)
map('n', '<c-l>', "<c-w>l", opt)
map('n', '<c-h>', "<c-w>h", opt)
map('n', '<c-j>', "<c-w>j", opt)
map('n', '<c-k>', "<c-w>k", opt)
