local keymap = vim.keymap.set
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

local opts = {}
keymap('n', '<leader>bg', '<cmd>DapToggleBreakpoint<cr>', opts)
keymap('n', '<leader>bc', '<cmd>DapContinue<cr>', opts)
