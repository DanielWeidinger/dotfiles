-- Global Config
Capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
Capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP config (the mappings used in the default file don't quite work right)
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

-- keymap("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
-- keymap("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_next()<CR>")

local wk = require("which-key")
-- Using trouble for navigation rather than QL list
wk.register({
	g = {
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
	},
	["Ö"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next Diagnostic" },
	["Ä"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to next Diagnostic" },
})

require("weidinger.lsp.lsp")
require("weidinger.lsp.ls_lua")
require("weidinger.lsp.ls_null")
require("weidinger.lsp.lsp_actions")
require("weidinger.lsp.cmp")
