-- https://github.com/voldikss/vim-translator
local keymap = vim.keymap.set
keymap('n', '<leader>t', '<cmd>TranslateW<cr>', {})
keymap('v', '<leader>t', ':TranslateW<cr>', {})

