require("nvim-tree").setup({
    disable_netrw = false,
    update_cwd = true,
    diagnostics = {
        enable = false,
        icons = {
            hint = LspSigns.Hint,
            info = LspSigns.Info,
            warning = LspSigns.Warning,
            error = LspSigns.Error,
        },
    },
    renderer = {
        group_empty = true,
    },
})
