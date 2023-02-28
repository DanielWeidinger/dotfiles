local wk = require("which-key")

wk.register({
    g = {
        name = "Git", -- optional group name
        s = { ":Git<cr>", "Status" },
        b = { ":G blame<cr>", "Blame" },
        d = { ":Gvdiffsplit @~1<cr>", "Diff @~1" },
        h = { ":GBrowse<cr>", "Open in Web" },
    },
}, {
    prefix = "<leader>",
})
