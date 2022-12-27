-- Global Config
Capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
Capabilities.textDocument.completion.completionItem.snippetSupport = true

LspSigns = { Error = "", Warn = "", Hint = "", Info = "" } -- Global Signs
-- Set Signs
for type, icon in pairs(LspSigns) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon .. " ", texthl = hl, numhl = hl })
end

require("weidinger.lsp.lsp")
require("weidinger.lsp.ls_lua")
require("weidinger.lsp.ls_null")
require("weidinger.lsp.ls_dotnet")
require("weidinger.lsp.lsp_actions")
require("weidinger.lsp.cmp")
