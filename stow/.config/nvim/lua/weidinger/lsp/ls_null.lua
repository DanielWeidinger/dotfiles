local null_ls = require("null-ls")
null_ls.setup({
	on_attach = On_attach,
	capabilities = Capabilities,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd.with({
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file({ "eslint.json", "eslintrc.json", "eslint.js" })
			end,
		}),
		-- null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.autopep8,
	},
})
