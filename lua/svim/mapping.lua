local opt = { noremap = true, silent = true }
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

local NVIMHOME = vim.fs.normalize("~/.config/nvim")

map("n", "<leader>w", "<cmd>w<cr>", opt)
map("i", "jk", "<esc>", opt)
map("n", "<leader>q", "<cmd>q<cr>", opt)
map("n", "<leader><cr>", "<cmd>nohlsearch<cr>", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)

map("v", "Y", '"+y', opt)
map("n", "P", '"+p', opt)
map("n", "<leader>lc", "<Cmd>e" .. NVIMHOME .. "/lua/svim/init.lua" .. "<Cr>", opt)

map("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", opt)

-- git
map("n", "<leader>gl", "<Cmd>DiffviewFileHistory<cr>", opt) -- 查看历史
map("n", "<leader>ge", "<Cmd>DiffviewOpen<cr>", opt) -- 查看当前修改
map("n", "<leader>gc", "<Cmd>DiffviewClose<cr>", opt) -- 关闭 diffview
