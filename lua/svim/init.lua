-- globol env config
local status_ok = pcall(require, "svim.env")
if not status_ok then
	SELFENV = require('svim.defulat_env')
end

--插件管理
require('svim.plugins')

-- 基础配置
require("svim.settings").load_defaults()

-- 加载主题
require('svim.theme')

-- plugin配置
require('svim.plugin')
