local null_ls = require("null-ls")

null_ls.setup({
    capabilities = Capabilities,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        require("none-ls.diagnostics.eslint_d").with({
            condition = function(utils)
                return utils.root_has_file({ "eslintrc.json", ".eslintrc.json" })
            end,
        }),
        require("none-ls.formatting.ruff_format"),
        null_ls.builtins.formatting.shfmt, -- shell script formatting
        null_ls.builtins.formatting.clang_format,
    },
})
