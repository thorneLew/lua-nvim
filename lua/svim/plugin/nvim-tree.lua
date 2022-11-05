vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local keymap = vim.keymap.set

require("nvim-tree").setup({
	git = {
		ignore=false
	}
})

keymap('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', {})
