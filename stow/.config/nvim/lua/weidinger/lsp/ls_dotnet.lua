local handlers = require("weidinger.lsp.handlers")
local omnisharp_path = vim.fn.expand("$HOME/.local/share/nvim/lang-servers/omnisharp/run")

require("lspconfig").omnisharp.setup({
    capabilities = Capabilities,
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        handlers.on_attach_format(client)
    end,
    cmd = { omnisharp_path, "--languageserver" },
})
