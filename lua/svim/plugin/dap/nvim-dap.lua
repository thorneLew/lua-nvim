vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

require("dap.ext.vscode").load_launchjs(nil, {})

-- 快捷键

-- dap-ui 配置
local dap, dapui = require("dap"), require("dapui")

local option = {
	reset = true,
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open(option)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close(option)
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close(option)
end
