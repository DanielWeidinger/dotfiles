-- Global Config
Capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
Capabilities.textDocument.completion.completionItem.snippetSupport = true

require("weidinger.lsp.lsp")
require("weidinger.lsp.ls_lua")
require("weidinger.lsp.ls_null")
require("weidinger.lsp.lsp_actions")
require("weidinger.lsp.cmp")
