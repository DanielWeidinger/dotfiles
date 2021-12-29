local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local null_ls = require("null-ls")
null_ls.setup({
	debug = true,
	on_attach = on_attach,
	capabilities = capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ "eslint.json" })
			end,
		}),
		-- null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.autopep8,
	},
})
