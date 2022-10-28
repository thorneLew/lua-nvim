local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
	options={
		diagnostics = "nvim_lsp"
	}
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>', opts)
keymap('n', '<leader>bb', '<cmd>BufferLineCyclePrev<cr>', opts)
keymap('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', opts)
keymap('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', opts)
keymap('n', '<leader>bj', '<cmd>BufferLinePick<cr>', opts)
keymap('n', '<leader>c', '<cmd>BufferClose<cr>', opts)
