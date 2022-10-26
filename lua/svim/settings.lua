local M = {}

M.load_default_options = function ()
	local default_options = {
		number = true, -- 设置行号
		tabstop = 2,   -- tabs设置两个空格
		shiftwidth = 2,
		termguicolors=true
	}

	vim.cmd[[colorscheme tokyonight-night]]

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
