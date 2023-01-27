require("hover").setup({
    init = function()
        require("hover.providers.lsp")
        require("hover.providers.dictionary") -- Defintions for words
    end,
    preview_window = false,
    title = false,
})

vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
