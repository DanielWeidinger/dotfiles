-- require files
require("weidinger.utils")
require("weidinger.general")
require("weidinger.keys")
require("weidinger.plugins")

-- Theming
vim.cmd([[colorscheme nord]]) -- actiavtes filetype, the possibility to load plugins and the indent.vim plugin

-- -- Plug Configs
require("weidinger.lsp")
require("weidinger.UI")
require("weidinger.execution")
require("weidinger.dap")
