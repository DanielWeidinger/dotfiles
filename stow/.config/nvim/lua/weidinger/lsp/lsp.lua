local lspconfig = require("lspconfig")

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

function On_attach(client)
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
	capabilities = Capabilities,
	on_attach = On_attach,
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})
lspconfig.dockerls.setup({ capabilities = Capabilities, on_attach = On_attach })
lspconfig.bashls.setup({ capabilities = Capabilities, on_attach = On_attach })

lspconfig.tsserver.setup({
	capabilities = Capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		On_attach(client)
	end,
})

lspconfig.cssls.setup({
	capabilities = Capabilities,
	on_attach = On_attach,
})

lspconfig.html.setup({
	capabilities = Capabilities,
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		On_attach(client)
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
	capabilities = Capabilities,
	on_attach = On_attach,
	cmd = { "emmet-ls", "--stdio" },
	filetypes = { "html", "css" },
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})

lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
	capabilities = Capabilities,
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		On_attach(client)
	end,
})

-- add yaml schema definitions
local json_schemas = require("schemastore").json.schemas({})
local yaml_schemas = {}
vim.tbl_map(function(schema)
	if schema.name == "openapi.json" and type(schema.fileMatch) == "table" then
		schema.fileMatch = vim.list_extend({ "mantik-api-spec.yaml" }, schema.fileMatch)
	end
	yaml_schemas[schema.url] = schema.fileMatch
end, json_schemas)
lspconfig.yamlls.setup({
	capabilities = Capabilities,
	settings = {
		yaml = {
			trace = { server = "verbose" },
			-- schemaStore = { enable = true },
			schemas = yaml_schemas,
			-- validate = { enable = true },
		},
	},
	cmd = { "yaml-language-server", "--stdio" },
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		On_attach(client)
	end,
})
