local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local format_async = function(err, result, params)
	if err ~= nil or result == nil then
		return
	end
	if not vim.api.nvim_buf_get_option(params.bufnr, "modified") then
		local view = vim.fn.winsaveview()
		local client = vim.lsp.get_client_by_id(params.client_id)
		vim.lsp.util.apply_text_edits(result, params.bufnr, client.offset_encoding)
		vim.fn.winrestview(view)
		if params.bufnr == vim.api.nvim_get_current_buf() then
			vim.api.nvim_command("noautocmd :update")
		end
	end
end
vim.lsp.handlers["textDocument/formatting"] = format_async

function on_attach(client)
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_exec(
			[[
         augroup LspAutocommands
             autocmd! * <buffer>
             autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()
         augroup END
         ]],
			true
		)
	end
end

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
})
lspconfig.dockerls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })

lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})

lspconfig.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})

-- if not lspconfig.emmet_ls then
--     configs.emmet_ls = {
--         default_config = {
--           cmd = {'emmet-ls', '--stdio'},
--           filetypes = {'html', 'css'},
--           root_dir = function(fname)
--             return vim.loop.cwd()
--           end,
--           settings = {},
--         },
--     }
-- end
lspconfig.emmet_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "emmet-ls", "--stdio" },
	filetypes = { "html", "css" },
	root_dir = function(fname)
		return vim.loop.cwd()
	end,
})

lspconfig.jsonls.setup({
	capabilities = capabilities,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end,
})

-- Flutter tools setup
require("flutter-tools").setup({
	lsp = {
		capabilities = capabilities,
		enabled = false,
		on_attach = function(client)
			on_attach(client)
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
