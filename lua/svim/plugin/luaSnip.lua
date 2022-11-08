-- 添加自定义代码段
require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/config/my-snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
