return require('packer').startup(function(use)
	-- Packer can manage itself
	-- 插件管理器
	use 'wbthomason/packer.nvim'

	-- 主题 东京之夜
	use 'folke/tokyonight.nvim'
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}

	-- lsp 语言配置
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	-- 主要功能，支持代码提示
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	-- 给nvim-cmp 增强 lsp 配置{source = {name="nvim_lsp"}}
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	-- 用lua编写的Snippet 引擎
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	-- 在nvim-cmp中可使用luasnip {source = {name="luasnip"}}
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp-signature-help' -- 增强参数提示 source form nvim-cmp

	-- neovim lsp 变量跳转 有ui支持
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- lsp server下载工具
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- 语言解析，查询，模块
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


	-- 目录管理
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- 状态栏 statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Tab
	use "akinsho/bufferline.nvim"

	-- 启动页 start screen
	use { 'glepnir/dashboard-nvim' }

	-- 终端配置
	use {
		"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end
	}

	-- 搜索工具
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- git
	use { 'lewis6991/gitsigns.nvim' }

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

	-- 协助lua 开发 提示文档
	use "folke/neodev.nvim"

	-- 自动补全括号等
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- 快速选中 类似 vscode 的 c-d
	-- https://github.com/mg979/vim-visual-multi/wiki/Quick-start
	use 'mg979/vim-visual-multi'

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
