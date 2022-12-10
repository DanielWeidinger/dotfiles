local lspconfig = require("lspconfig")
local handlers = require("weidinger.lsp.handlers")

vim.lsp.handlers["textDocument/formatting"] = handlers.async_formatting

lspconfig.pyright.setup({
	capabilities = Capabilities,
	on_attach = handlers.on_attach,
	root_dir = function(_)
		return vim.loop.cwd()
	end,
})
lspconfig.dockerls.setup({ capabilities = Capabilities, on_attach = handlers.on_attach })
lspconfig.bashls.setup({ capabilities = Capabilities, on_attach = handlers.on_attach })

lspconfig.tsserver.setup({
	capabilities = Capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		handlers.on_attach(client)
	end,
})

lspconfig.cssls.setup({
	capabilities = Capabilities,
	on_attach = handlers.on_attach,
})

lspconfig.html.setup({
	capabilities = Capabilities,
	on_attach = function(client)
		client.server_capabilities.document_formatting = false
		handlers.on_attach(client)
	end,
})

lspconfig.emmet_ls.setup({
	capabilities = Capabilities,
	on_attach = handlers.on_attach,
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
		client.server_capabilities.document_formatting = false
		handlers.on_attach(client)
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
		client.server_capabilities.document_formatting = false
		handlers.on_attach(client)
	end,
})
