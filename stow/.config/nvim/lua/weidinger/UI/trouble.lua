require("trouble").setup({})

local wk = require("which-key")

wk.register({
    x = {
        name = "Trouble", -- optional group name
        x = { "<cmd>TroubleToggle<cr>", "Toggle" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "QFList" },
        l = { "<cmd>TroubleToggle loclist<cr>", "LocalList" },
    },
}, {
    prefix = "<leader>",
})

wk.register({
    g = {
        r = { "<cmd>TroubleToggle lsp_references<cr>", "(Trouble)Refrences" },
        d = { "<cmd>TroubleToggle lsp_definitions<cr>", "(Trouble)Definitions" },
        i = { "<cmd>TroubleToggle lsp_implementations<cr>", "(Trouble)Implementations" },
        -- t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "(Trouble)Definitions" },
    },
})
--nnoremap gR <cmd>TroubleToggle lsp_references<cr>
