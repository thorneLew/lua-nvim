# neovim

### start

1.下载配置

```
cd ~/.config
git clone https://github.com/thorneLew/lua-nvim.git nvim
git clone git@github.com:thorneLew/lua-nvim.git nvim
```

2.  安装 packer (包管理器)

- https://github.com/wbthomason/packer.nvim

3. 安装依赖 - 确认所有插件都安装成功

```
nvim +PackerSync
```

4. 重启 nvim

5. cd lua/svim/
   创建 env.lua 文件。配置全局环境变量

```lua
-- default
SELFENV = {
	-- dap-vscode-js - debugger_path
	dap_js_debugger_path = ''
}

```

### plugins

```lua
-- plugins start
return require("packer").startup(function(use)
	-- Packer can manage itself
	-- 插件管理器
	use("wbthomason/packer.nvim")

	-- 主题 东京之夜
	use("folke/tokyonight.nvim")
	--根据16进制高亮颜色
	use("norcalli/nvim-colorizer.lua")

	-- lsp 语言配置
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	-- 自动安装插件
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	-- 给nvim-cmp 增强 lsp 配置{source = {name="nvim_lsp"}}
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	-- 在nvim-cmp中可使用luasnip {source = {name="luasnip"}}
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- 增强参数提示 source form nvim-cmp

	-- 用lua编写的Snippet 引擎
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("rafamadriz/friendly-snippets") -- 代码片段

	-- neovim lsp 变量跳转 有ui支持
	use({ "glepnir/lspsaga.nvim", branch = "main" })

	-- 以来lsp 做注入诊断，代码操作
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- [lsp server ，Dap server , lint server ] 管理下载工具
	-- Command : Mason , MasonInstall
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- 语言解析，查询，模块
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "windwp/nvim-ts-autotag" }) -- 自动闭合html等标签
	use("tpope/vim-commentary") -- 注释功能
	use("JoosepAlviste/nvim-ts-context-commentstring") -- 注释支持 jsx

	-- 给不同编程语言生成函数注释 js -> jsDoc go -> goDoc 等等
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
	})

	-- 目录管理
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- 状态栏 statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Tab
	use("akinsho/bufferline.nvim")

	-- 启动页 start screen
	use({ "goolord/alpha-nvim" })

	-- 终端配置
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- 搜索工具
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "sindrets/diffview.nvim" })

	-- 类似easymotion 快查找 vim插件-- 使用 leap替换
	use({
		"phaazon/hop.nvim",
		event = "BufRead",
		config = function()
			require("hop").setup({})
			vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
		end,
	})

	-- 轻松修改括号，引号等成对符号
	use("tpope/vim-surround")

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	})

	-- 协助lua 开发 提示文档
	use("folke/neodev.nvim")

	-- 自动补全括号等
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- 快速选中 类似 vscode 的 c-d
	-- https://github.com/mg979/vim-visual-multi/wiki/Quick-start
	use("mg979/vim-visual-multi")

	-- 快速选中块
	use({
		"gcmt/wildfire.vim",
	})

	-- 剪切板快速展示
	use("junegunn/vim-peekaboo")

	-- yank put 修改
	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({})
		end,
	})

	--翻译插件
	use("voldikss/vim-translator")
	-- debuger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	-- dap - 调试 javascript -- start
	-- https://github.com/mxsdev/nvim-dap-vscode-js
	-- 需要手动安装vscode-js-debug -参考文档: Manually
	use({ "mxsdev/nvim-dap-vscode-js" })
	-- dap - 调试 javascript -- end
	use("leoluz/nvim-dap-go")
end)

--plugins end
```

### null-ls 支持

```lua
sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.fixjson,
		diagnostics.eslint,
		diagnostics.golangci_lint,
},
```

#### 需要安装的插件

1. npm i -g prettier
2. npm i -g eslint
3. npm i -g fixjson
4. yay -Syy golangci_lint
5. yay -Syy stylua

### 快捷键

> 查看 lua/svim/mapping.lua

- c-n 快速选中变量 , n 选中下一个 模式多个选择

### 删除或替换的插件

```lua
-- which-key - 快捷键提示 感觉用不上
use 'folke/which-key.nvim'

-- 在每一上显示 特殊高亮 快速查找
use("unblevable/quick-scope")
---- unblevable/quick-scope颜色设置 --配置
-- vim.cmd([[highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
-- vim.cmd([[highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])


-- 主题
use("shaunsingh/moonlight.nvim")
-- shaunsingh/moonlight 配置
-- vim.cmd[[colorscheme moonlight]]

-- DB  connect mysql, MongoDB, SQLite 先隐藏，暂时不用
use 'tpope/vim-dadbod'
use 'kristijanhusak/vim-dadbod-ui'

-- sneap 快速跳转
use("ggandor/leap.nvim")
-- require("leap").add_default_mappings()

```

### 常见问题

1.  nvim-telescope/telescope-fzf-native.nvim 在 M1 需要编译 arch -x86_64 make
2.  null-ls 需要 neovim - v0.8.0-1210-gd367ed9b2
3.  sindrets/diffview.nvim -- 需要 git 版本 2.31.0 以上，我的版本 2.33.0
4.  Mac M1 debuger go 时不生效，go verison 是 arm64 不是 amd64
