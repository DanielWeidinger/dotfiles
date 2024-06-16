require("trouble").setup()

local wk = require("which-key")

wk.register({
    x = {
        name = "Trouble", -- optional group name
        r = { "<cmd>Trouble lsp_references toggle<cr>", "Toggle" },
        q = { "<cmd>Trouble qflist toggle<cr>", "QFList" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        r = { "<cmd>Trouble lsp_references focus=true<cr>", "(Trouble)Refrences" },
        d = { "<cmd>Trouble lsp_definitions<cr>", "(Trouble)Definitions" },
    },
})
