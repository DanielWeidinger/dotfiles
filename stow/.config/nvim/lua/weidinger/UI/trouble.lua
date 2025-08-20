require("trouble").setup()

-- Leader key mappings for Trouble

vim.keymap.set("n", "<leader>xc", ":lua require('trouble').close()<cr>", { desc = "Close" })
vim.keymap.set("n", "<leader>xd", ":Trouble diagnostics toggle<cr>", { desc = "Close" })

-- Quickfix functionality
vim.keymap.set("n", "<leader>q", "<cmd>Trouble qflist toggle<cr>", { desc = "QFList" })
vim.keymap.set("n", "<C-j>", ":lua require('trouble').next({ jump = true })<cr>", { desc = "Next QF Item" })
vim.keymap.set("n", "<C-k>", ":lua require('trouble').prev({ jump = true })<cr>", { desc = "Prev QF Item" })

-- Normal mode mappings for Trouble
vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", { desc = "(Trouble)References" })
vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions<cr>", { desc = "(Trouble)Definitions" })
