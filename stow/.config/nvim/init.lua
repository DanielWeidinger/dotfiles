-- require files
require("weidinger.plugins")
require("weidinger.general")
require("weidinger.keys")

require("weidinger.utils")

-- Theming
vim.g.nord_borders = true
vim.g.nord_bold = false
vim.g.nord_italic = false
local defaultTheme = "nord"
local previousExists = Exists(vim.fn.stdpath("data") .. "/last_color")
if not previousExists then
    vim.cmd(("colorscheme %s"):format(defaultTheme))
else
    local theme = require("last-color").recall() or defaultTheme
    vim.cmd(("colorscheme %s"):format(theme)) -- actiavtes filetype, the possibility to load plugins and the indent.vim plugin
end

-- -- Plug Configs
require("weidinger.lsp")
require("weidinger.UI")
require("weidinger.execution")

require("weidinger.treesitter")
require("weidinger.dap")
require("weidinger.neotest")
