local handlers = require("weidinger.lsp.handlers")

vim.lsp.handlers["textDocument/formatting"] = handlers.async_formatting

vim.lsp.config("pyright", {
    capabilities = Capabilities,
    on_attach = handlers.on_attach_format,
    root_dir = function(_)
        return vim.loop.cwd()
    end,
})
vim.lsp.enable("pyright")

vim.lsp.config("dockerls", { capabilities = Capabilities, on_attach = handlers.on_attach_format })
vim.lsp.enable("dockerls")

vim.lsp.config("bashls", { capabilities = Capabilities })
vim.lsp.enable("bashls")

vim.lsp.config("ts_ls", {
    capabilities = Capabilities,
})
vim.lsp.enable("ts_ls")

vim.lsp.config("cssls", {
    capabilities = Capabilities,
})
vim.lsp.enable("cssls")

vim.lsp.config("html", {
    capabilities = Capabilities,
})
vim.lsp.enable("html")

vim.lsp.config("emmet_ls", {
    capabilities = Capabilities,
    cmd = { "emmet-ls", "--stdio" },
    filetypes = { "html", "css" },
    root_dir = function(_)
        return vim.loop.cwd()
    end,
})
vim.lsp.enable("emmet_ls")

vim.lsp.config("jsonls", {
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
vim.lsp.enable("jsonls")

-- add yaml schema definitions
local json_schemas = require("schemastore").json.schemas({})
local yaml_schemas = {}
vim.tbl_map(function(schema)
    if schema.name == "openapi.json" and type(schema.fileMatch) == "table" then
        schema.fileMatch = vim.list_extend({ "mantik-api-spec.yaml" }, schema.fileMatch)
    end
    yaml_schemas[schema.url] = schema.fileMatch
end, json_schemas)
vim.lsp.config("yamlls", {
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
vim.lsp.enable("yamlls")

vim.lsp.enable("texlab")
vim.lsp.enable("clangd")
