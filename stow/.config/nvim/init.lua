-- require files
require("weidinger.plugins")
require("weidinger.general")
require("weidinger.keys")

-- Theming
vim.cmd([[colorscheme nord]]) -- actiavtes filetype, the possibility to load plugins and the indent.vim plugin

-- -- Plug Configs
require("weidinger.lsp")
require("weidinger.UI")
require("weidinger.execution")
require("weidinger.utils")

require("weidinger.treesitter")
require("weidinger.dap")
require("weidinger.neotest")
