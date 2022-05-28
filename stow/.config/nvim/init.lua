-- require files
require("weidinger.utils")
require("weidinger.general")
require("weidinger.keys")
require("weidinger.plugins")

-- Theming
vim.cmd([[colorscheme nord]]) -- actiavtes filetype, the possibility to load plugins and the indent.vim plugin

-- -- Plug Configs
require("weidinger.lsp")
require("weidinger.which-key")
require("weidinger.floaterm")
require("weidinger.fugitive")
require("weidinger.signs")
require("weidinger.cmp")
require("weidinger.cokeline")
require("weidinger.lualine")
require("weidinger.treesitter")
require("weidinger.telescope")
require("weidinger.todo")
require("weidinger.browser")
require("weidinger.execution")
require("weidinger.trouble")
require("weidinger.autoclosing")
require("weidinger.dap")
require("weidinger.tree")
require("weidinger.snippets")
