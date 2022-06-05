-- LSP config (the mappings used in the default file don't quite work right)
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

keymap("n", "<C-n>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

local wk = require("which-key")
-- Using trouble for navigation rather than QL list
wk.register({
	g = {
		-- d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
		-- R = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Open references' },
		-- i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
	},
})

require("weidinger.lsp.lsp")
require("weidinger.lsp.ls_lua")
require("weidinger.lsp.ls_null")
require("weidinger.lsp.lsp_actions")
