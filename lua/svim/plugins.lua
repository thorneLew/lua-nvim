return require('packer').startup(function (use)
	-- Packer can manage itself
	-- 插件管理器
	use 'wbthomason/packer.nvim'

	-- 主题 东京之夜
	use 'folke/tokyonight.nvim'


	-- lsp 语言配置
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- lsp server下载工具
	use "williamboman/mason.nvim" 
	use  "williamboman/mason-lspconfig.nvim"

	-- 语言解析，查询，模块
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- neovim lsp 变量跳转 有ui支持
	use({"glepnir/lspsaga.nvim", branch = "main"})

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
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- 启动页 start screen
	use {'glepnir/dashboard-nvim'}

	-- 终端配置
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()

end}
end)

