vim.diagnostic.config({
    float = { border = "single" },
})

-- Leader key mappings for code actions
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Action" })
vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Line Diagnostic" })
vim.keymap.set("n", "<leader>cö", "<cmd>LspRestart<CR>", { desc = "Restart Lsp" })

-- Normal mode mappings for navigation using trouble
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
vim.keymap.set("n", "Ö", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next Diagnostic" })
vim.keymap.set("n", "Ä", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to prev Diagnostic" })
