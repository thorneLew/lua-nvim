-- https://github.com/glepnir/lspsaga.nvim
local keymap = vim.keymap.set
local saga = require("lspsaga")

saga.init_lsp_saga({})

-- lsp 查找对应变量
keymap("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
-- 可以弹出变量所在文件内容，并支持编辑
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Outline - 大纲
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
