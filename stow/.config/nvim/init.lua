-- Improve startup time
vim.loader.enable()

-- require files
require("weidinger.plugins")
require("weidinger.general")
require("weidinger.keys")

require("weidinger.utils")

-- Theming
vim.g.nord_borders = true
vim.g.nord_bold = false
vim.g.nord_italic = false
local defaultTheme = "kanagawa"
vim.cmd(("colorscheme %s"):format(defaultTheme))

-- -- Plug Configs
require("weidinger.lsp")
require("weidinger.UI")
require("weidinger.execution")

require("weidinger.treesitter")
require("weidinger.dap")
-- require("weidinger.neotest")
