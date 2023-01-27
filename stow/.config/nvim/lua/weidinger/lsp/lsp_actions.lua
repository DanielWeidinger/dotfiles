local wk = require("which-key")

vim.diagnostic.config({
    float = { border = "single" },
})

wk.register({
    c = {
        name = "Code", -- optional group name
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" }, -- create a binding with label
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" }, -- create a binding with label
        d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostic" }, -- create a binding with label
        -- c = { "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", "Cursor Diagnostic" },
        ["ö"] = { "<cmd>LspRestart<CR>", "Restart Lsp" },
    },
}, { prefix = "<leader>" })

-- Using trouble for navigation rather than QL list
wk.register({
    g = {
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    },
    ["Ö"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next Diagnostic" },
    ["Ä"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to prev Diagnostic" },
})
