# neovim

### start

1.下载配置
```
cd ~/.config
git clone https://github.com/thorneLew/lua-nvim.git nvim
git clone git@github.com:thorneLew/lua-nvim.git nvim
```

2.  安装packer (包管理器)
- https://github.com/wbthomason/packer.nvim

3. 安装依赖 - 确认所有插件都安装成功
```
nvim +PackerSync
```
4. 重启nvim


5. cd lua/svim/
创建env.lua文件。配置全局环境变量
```lua
-- default
SELFENV = {
	-- dap-vscode-js - debugger_path
	dap_js_debugger_path = ''
}

```

### plugins

```lua
return require('packer').startup(function (use)
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
	use({"glepnir/lspsaga.nvim", branch = "main"})

	-- lsp server下载工具
	use "williamboman/mason.nvim"
	use  "williamboman/mason-lspconfig.nvim"

	-- 语言解析，查询，模块
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'  }


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
	use {'glepnir/dashboard-nvim'}

	-- 终端配置
	use {
		"akinsho/toggleterm.nvim", tag = '*', config = function()
			require("toggleterm").setup()
		end}

	-- 搜索工具
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'arch -x86_64 make' }

	-- git 
	use {'lewis6991/gitsigns.nvim'}

	-- 类似easymotion 快查找 vim插件
	use {
		'phaazon/hop.nvim',
		event = "BufRead",
		config = function ()
			require('hop').setup { }
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
end)

```



### 快捷键

* c-n 快速选中变量 , n 选中下一个 模式多个选择


### 常见问题
1.  nvim-telescope/telescope-fzf-native.nvim 在M1 需要编译 arch -x86_64 make
2.  null-ls 需要 neovim - v0.8.0-1210-gd367ed9b2

