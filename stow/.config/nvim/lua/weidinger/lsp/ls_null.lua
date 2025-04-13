local null_ls = require("null-ls")
local handlers = require("weidinger.lsp.handlers")

null_ls.setup({
    on_attach = handlers.on_attach_format,
    capabilities = Capabilities,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({
            prefer_local = "node_modules/.bin",
        }),
        require("none-ls.diagnostics.eslint_d").with({
            condition = function(utils)
                return utils.root_has_file({ "eslint.json", "eslintrc.json", ".eslintrc.json", "eslint.js" })
            end,
        }),
        -- null_ls.builtins.code_actions.gitsigns,
        require("none-ls.formatting.ruff_format"),
        null_ls.builtins.formatting.shfmt, -- shell script formatting
        null_ls.builtins.formatting.clang_format,
    },
})
