---- unblevable/quick-scope颜色设置
vim.cmd([[highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
vim.cmd([[highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])

-- 东京之夜
vim.cmd([[colorscheme tokyonight]])

-- 根据16进制高亮颜色
require("colorizer").setup()

-- shaunsingh/moonlight
-- vim.cmd[[colorscheme moonlight]]
