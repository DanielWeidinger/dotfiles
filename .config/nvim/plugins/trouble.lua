require("trouble").setup {

}

local wk = require("which-key")

wk.register({
        x = {
                name = "Trouble", -- optional group name
                x = {  "<cmd>TroubleToggle<cr>", "Toggle" },
                w = {  "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
                d = {  "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
                q = {  "<cmd>TroubleToggle quickfix<cr>", "QFList" },
                l = {  "<cmd>TroubleToggle loclist<cr>", "LocalList" },
        },
}, { prefix = "<leader>" })


wk.register({
        g = {
                R = {  "<cmd>TroubleToggle lsp_references<cr>", "(Trouble)Refrences" },
        },
})
--nnoremap gR <cmd>TroubleToggle lsp_references<cr>
