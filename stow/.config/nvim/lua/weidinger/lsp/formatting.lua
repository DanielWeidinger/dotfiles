require("conform").setup({
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", "ts_ls", stop_after_first = true },
        typescript = { "prettierd", "prettier", "ts_ls", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", "ts_ls", stop_after_first = true },
        json = { "prettierd", "prettier", "ts_ls", stop_after_first = true },
    },
})
