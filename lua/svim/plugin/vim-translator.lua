-- https://github.com/voldikss/vim-translator
-- floats https://neovim.io/doc/user/api.html#nvim_open_win()
local keymap = vim.keymap.set
keymap('n', '<leader>t', '<cmd>TranslateW<cr>', {})
keymap('v', '<leader>t', ':TranslateW<cr>', {})

