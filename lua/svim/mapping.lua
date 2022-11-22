local nvim_set_keymap = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opt = { noremap = true, silent = true }

local NVIMHOME = vim.fs.normalize("~/.config/nvim")

-- 默认设置
map("v", "Y", '"+y', opt)
map("n", "P", '"+p', opt)
map("i", "jk", "<esc>", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<leader>w", "<cmd>w<cr>", opt)
map("n", "<leader>q", "<cmd>q<cr>", opt)
map("n", "<leader>c", "<cmd>bdelete<cr>", opt) -- 关闭当前标签
map("n", "<leader><cr>", "<cmd>nohlsearch<cr>", opt)
map("n", "<leader>lc", "<Cmd>e" .. NVIMHOME .. "/lua/svim/init.lua" .. "<Cr>", opt)

-- 格式化
map("n", "<leader>bf", "<cmd>lua vim.lsp.buf.format()<cr>", opt)

--alpha-nvim
map("n", "<leader>;", "<cmd>Alpha<Cr>", {}) -- 引导页

--bufferline -- tab切换
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", opt)
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", opt)
map("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", opt)
map("n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", opt)
map("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", opt)
map("n", "<leader>bj", "<cmd>BufferLinePick<cr>", opt)

-- git
map("n", "<leader>gl", "<Cmd>DiffviewFileHistory<cr>", opt) -- 查看历史
map("n", "<leader>ge", "<Cmd>DiffviewOpen<cr>", opt) -- 查看当前修改
map("n", "<leader>gc", "<Cmd>DiffviewClose<cr>", opt) -- 关闭 diffview

--lsp/lspsaga 查找变量的定义
-- lsp 查找对应变量
map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
-- Code action
map({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Rename
map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
-- Peek Definition
-- 可以弹出变量所在文件内容，并支持编辑
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })
-- Outline - 大纲
map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
-- Hover Doc
map("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- nvim-tree 文件管理器
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {})

--telescope  文件搜索
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})

--toggleterm 终端及lazigit浮窗
nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opt)

--vim-translator 翻译
map("n", "<leader>t", "<cmd>TranslateW<cr>", {})
map("v", "<leader>t", ":TranslateW<cr>", {})

--nvim-dap 断点工具
map("n", "<leader>bg", "<cmd>DapToggleBreakpoint<cr>", {})
map("n", "<leader>bc", "<cmd>DapContinue<cr>", {})
map("n", "<leader>be", "<Cmd>lua DapFloatEval()<CR>", {})
map("n", "<leader>bs", "<Cmd>lua DapFloatScopes()<CR>", {})
