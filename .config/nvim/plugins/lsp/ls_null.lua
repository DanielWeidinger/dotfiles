local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local null_ls = require("null-ls")
null_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier_d_slim,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.autopep8,
	},
})
