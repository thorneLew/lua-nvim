local g = vim.g
local keymap = vim.keymap.set

g['airline#extensions#tabline#enabled'] = 1; -- 开启Tabline
g['airline#extensions#tabline#left_sep'] = '';

g['airline_left_sep'] = ''
g['airline_left_alt_sep'] = ''
g['airline_right_sep'] = ''
g['airline_right_alt_sep'] = ''
g['airline_symbols.branch'] = ''
g['airline_symbols.colnr'] = ' ℅:'
g['airline_symbols.readonly'] = ''
g['airline_symbols.linenr'] = ' :'
g['airline_symbols.maxlinenr'] = '☰ '
g['airline_symbols.dirty']='⚡'

keymap('n', '<leader>bn', '<Cmd>bnext<Cr>')
keymap('n', '<Tab>', '<Cmd>bnext<Cr>')
keymap('n', '<leader>bb', '<Cmd>bprevious<Cr>')
keymap('n', '<leader>c', '<Cmd>bdelete<Cr>')


-- section_b 定制
function update_git_status ()
	g.airline_section_b = "%{get(g:, 'coc_git_status', '')}"
end

g.airline_section_b = "%{get(g:, 'coc_git_status', '')}"
