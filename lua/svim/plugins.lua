return require('packer').startup(function(use)
	-- Packer can manage itself
	-- 插件管理器
	use 'wbthomason/packer.nvim'

	-- 主题 东京之夜
	use 'folke/tokyonight.nvim'

	-- 启动页 start screen
	use { 'glepnir/dashboard-nvim' }

	-- coc
	use {'neoclide/coc.nvim', branch = 'release'}

	-- 状态栏和Tab切换
	use "vim-airline/vim-airline"

	-- 搜索工具
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- 终端配置
	use {
		"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end}

	-- 类似easymotion 快查找 vim插件
	use {
		'phaazon/hop.nvim',
		event = "BufRead",
		config = function()
			require('hop').setup {}
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
		end
	}

	-- 轻松修改括号，引号等成对符号
	use 'tpope/vim-surround'

	-- markdown preview
	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end
	}

	-- 快速选中块
	use {
		'gcmt/wildfire.vim'
	}
	-- 注释
	use 'tpope/vim-commentary'

	-- 在每一上显示 特殊高亮 快速查找
	use 'unblevable/quick-scope'

	-- 剪切板快速展示
	use 'junegunn/vim-peekaboo'

	-- yank put 修改
	-- Lua
	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({})
		end
	})
	--翻译插件
	use 'voldikss/vim-translator'
	-- debuger
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'
	-- dap - 调试 javascript -- start
	-- https://github.com/mxsdev/nvim-dap-vscode-js
	-- 需要手动安装vscode-js-debug -参考文档: Manually
	use { "mxsdev/nvim-dap-vscode-js"}
	-- dap - 调试 javascript -- end
	use 'leoluz/nvim-dap-go'
end)
