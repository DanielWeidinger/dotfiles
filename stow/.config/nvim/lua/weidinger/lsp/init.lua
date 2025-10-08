-- Global Config
Capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
Capabilities.textDocument.completion.completionItem.snippetSupport = true

LspSigns = { Error = "", Warn = "", Hint = "", Info = "" } -- Global Signs
vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = LspSigns.Error,
            [vim.diagnostic.severity.WARN] = LspSigns.Warn,
            [vim.diagnostic.severity.INFO] = LspSigns.Info,
            [vim.diagnostic.severity.HINT] = LspSigns.Hint,
        },
    },
})

require("weidinger.lsp.lsp")
require("weidinger.lsp.ls_lua")
require("weidinger.lsp.ls_null")
require("weidinger.lsp.lsp_actions")
require("weidinger.lsp.cmp")
