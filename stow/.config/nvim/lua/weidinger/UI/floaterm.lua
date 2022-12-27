vim.g.floaterm_keymap_toggle = "<F1>"
vim.g.floaterm_keymap_next = "<F2>"
vim.g.floaterm_keymap_prev = "<F3>"
vim.g.floaterm_keymap_new = "<F4>"

vim.g.floaterm_gitcommit = "floaterm"
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0
vim.g.floaterm_autoclose = 1

local wk = require("which-key")

wk.register({
    t = {
        name = "Term", -- optional group name
        [";"] = { ":FloatermNew --wintype=popup --height=6<cr>", "terminal" },
        g = { ":FloatermNew lazygit<cr>", "git" },
        d = { ":FloatermNew lazydocker<cr>", "docker" },
        n = { ":FloatermNew node<cr>", "node" },
        p = { ":FloatermNew python<cr>", "python" },
        t = { ":FloatermToggle<cr>", "toggle" },
        b = { ":FloatermNew btm<cr>", "bottom" },
        a = { ":FloatermKill! <cr>", "close all" },
    },
}, { prefix = "<leader>" })
