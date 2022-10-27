-- https://github.com/akinsho/toggleterm.nvim

require'toggleterm'.setup {
  shade_terminals = false
}
local Terminal  = require('toggleterm.terminal').Terminal

-- normal terminal
local term = Terminal.new({
  direction = "float"
})

function _term_toggle()
  term.toggle()
end

-- vim.api.nvim_buf_set_keymap('n', '<C-t>', '<cmd>_term_toggle()<cr>', {noremap=true, silent=true})

-- lazigit
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})