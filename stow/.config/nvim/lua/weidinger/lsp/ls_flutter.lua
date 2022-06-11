local M = {}

M.setup = function()
	local wk = require("which-key")
	wk.register({
		f = {
			d = { "<cmd>lua require('telescope').extensions.flutter.commands()<cr>", "Flutter commands" },
		},
	}, {
		prefix = "<leader>",
	})

	require("flutter-tools").setup({
		lsp = {
			capabilities = Capabilities,
			enabled = false,
			on_attach = function(client)
				On_attach(client)
				client.resolved_capabilities.document_formatting = true
			end,
		},
		debugger = { -- integrate with nvim dap + install dart code debugger
			enabled = true,
			run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
			-- register_configurations = function(paths)

			-- end,
		},
		dev_log = {
			enabled = false,
		},
	})
	require("telescope").load_extension("flutter")
end

return M
