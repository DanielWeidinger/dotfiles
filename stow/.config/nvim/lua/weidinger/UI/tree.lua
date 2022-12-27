require("nvim-tree").setup({
    disable_netrw = false,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    renderer = {
        group_empty = true,
    },
})
