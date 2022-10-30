local M = {}

M.load_default_options = function()
	local default_options = {
		number = true, -- 设置行号
		tabstop = 2, -- tabs设置两个空格
		shiftwidth = 2,
		termguicolors = true,
		cursorline = true,
		-- 配置折叠
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
		foldenable = false,
		foldlevel = 99 -- 折叠的层
	}
	-- 无法自动启折叠功能临时解决方案 https://github.com/nvim-telescope/telescope.nvim/issues/699
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		pattern = { "*" },
		command = "normal zx",
	})

	vim.g.mapleader = " "
	--  vim.g.maplocalleader = " "
	vim.g.python3_host_prog = "/usr/bin/python3"

	-- 加载快捷键
	require('svim.mapping')

	for k, v in pairs(default_options) do
		vim.opt[k] = v
	end

end

function M.load_defaults()
	M.load_default_options()
end

return M
