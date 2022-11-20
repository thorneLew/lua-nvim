local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end
-- local log = require("null-ls.logger")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
	if filetype == "handlebars" then
		return
	end

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.fixjson,
		formatting.gofumpt,
		formatting.goimports,
		formatting.clang_format,
		diagnostics.eslint,
		diagnostics.golangci_lint,
	},
	on_attach = on_attach,
})
