require("trouble").setup()

-- Leader key mappings for Trouble
vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "Toggle" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "QFList" })

-- Normal mode mappings for Trouble
vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references focus=true<cr>", { desc = "(Trouble)References" })
vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions<cr>", { desc = "(Trouble)Definitions" })
