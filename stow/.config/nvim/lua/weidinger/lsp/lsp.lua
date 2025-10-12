vim.lsp.config("pyright", { capabilities = Capabilities })
vim.lsp.enable("pyright")

vim.lsp.config("dockerls", { capabilities = Capabilities })
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
            format = {
                enable = false,
            },
        },
    },
    capabilities = Capabilities,
})
vim.lsp.enable("jsonls")

vim.lsp.config("yamlls", {
    capabilities = Capabilities,
    cmd = { "yaml-language-server", "--stdio" },
})
vim.lsp.enable("yamlls")

vim.lsp.enable("texlab")
vim.lsp.enable("clangd")
