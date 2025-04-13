require("overseer").setup({
    strategy = "toggleterm",
})

vim.keymap.set("n", "<leader>or", ":OverseerRun<CR>")
vim.keymap.set("n", "<leader>oo", ":OverseerToggle<CR>")
