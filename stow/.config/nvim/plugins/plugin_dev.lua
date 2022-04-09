local plugin_path = "" --vim.fn.expand("$HOME/Projects/copilot.lua") -- set to empty sting te deactivate

vim.g.plugin_dev_mode = plugin_path ~= ""
vim.opt.runtimepath:append(plugin_path)

