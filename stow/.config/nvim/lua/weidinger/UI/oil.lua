require("oil").setup()

-- vim.keymap.set("n", "<leader>E", ":vsplit<cr>:e .<cr>", { desc = "oil.nvim" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "(oil)Open parent directory" })
