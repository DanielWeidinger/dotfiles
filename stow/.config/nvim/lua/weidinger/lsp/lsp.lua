local lspconfig = require("lspconfig")
local handlers = require("weidinger.lsp.handlers")

vim.lsp.handlers["textDocument/formatting"] = handlers.async_formatting

lspconfig.pyright.setup({
    capabilities = Capabilities,
    on_attach = handlers.on_attach_format,
    root_dir = function(_)
        return vim.loop.cwd()
    end,
})
lspconfig.dockerls.setup({ capabilities = Capabilities, on_attach = handlers.on_attach_format })
lspconfig.bashls.setup({ capabilities = Capabilities })

lspconfig.tsserver.setup({
    capabilities = Capabilities,
})

lspconfig.cssls.setup({
    capabilities = Capabilities,
})

lspconfig.html.setup({
    capabilities = Capabilities,
})

lspconfig.emmet_ls.setup({
    capabilities = Capabilities,
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
})
