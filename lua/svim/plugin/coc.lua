vim.g.coc_global_extensions = { 
	-- langrage server 
	"coc-tsserver",
	"coc-json",
	"coc-html",
	"coc-css",
	"coc-explorer", -- 资源管理器
	"coc-git", -- git
	"coc-pairs", -- auto pair
	"coc-snippets"
}

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience. 没感觉到什么效果
vim.opt.updatetime = 300

local keyset = vim.keymap.set

keyset("n", "<leader>e", "<Cmd>CocCommand explorer<CR>")

-- Auto complete . 后自动提示补全
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Tab 可以选中补全
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- 按回车可选中补全属性
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- GoTo code navigation. 跳转到变量定义和使用的地方
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Symbol renaming. 修改全局变量
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Use gh to show documentation in preview window. hover显示文档信息
function _G.show_docs()
		local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset("n", "gh", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Add `:Format` command to format current buffer. -- 格式化文档
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
-- Formatting selected code. -- 设置快捷键
keyset("x", "<leader>bf", "<Cmd>Format<Cr>", {silent = true})
keyset("n", "<leader>bf", "<Cmd>Format<Cr>", {silent = true})
