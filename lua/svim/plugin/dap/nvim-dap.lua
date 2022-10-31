local keymap = vim.keymap.set
vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })


require('dap.ext.vscode').load_launchjs(nil, {})

-- 快捷键
local opts = {}
keymap('n', '<leader>bg', '<cmd>DapToggleBreakpoint<cr>', opts)
keymap('n', '<leader>bc', '<cmd>DapContinue<cr>', opts)
keymap('n', '<leader>be', '<Cmd>lua require("dapui").eval(nil, {enter=true})<CR>', opts)

-- dap-ui 配置
local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
