require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "python",
        "json",
        "yaml",
        "html",
        "scss",
        "php",
        "lua",
        "markdown",
        "markdown_inline",
    },
})
