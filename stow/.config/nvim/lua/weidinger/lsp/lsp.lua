local lspconfig = require("lspconfig")

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params({}),
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				local client = vim.lsp.get_client_by_id(ctx.client_id)
				vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end
vim.lsp.handlers["textDocument/formatting"] = async_formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
function On_attach(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
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
		client.server_capabilities.document_formatting = false
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
		client.server_capabilities.document_formatting = false
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
		client.server_capabilities.document_formatting = false
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
		client.server_capabilities.document_formatting = false
		On_attach(client)
	end,
})
