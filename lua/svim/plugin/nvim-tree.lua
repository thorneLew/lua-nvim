vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	git = {
		ignore = false,
	},
	-- 目录中展示当前文件
	update_focused_file = {
		enable = true,
		update_cwd = true, -- 展示当前的目录
		ignore_list = {},
	},
})
