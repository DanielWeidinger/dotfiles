require("lsp-format").setup({
    typescript = {
        exclude = { "ts_ls" },
    },
    typescriptreact = {
        exclude = { "ts_ls" },
    },
    javascriptreact = {
        exclude = { "ts_ls" },
    },
    javascript = {
        exclude = { "ts_ls" },
    },
    json = {
        exclude = { "jsonls" },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        require("lsp-format").on_attach(client, args.buf)
    end,
})
