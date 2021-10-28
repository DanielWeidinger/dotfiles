local saga = require'lspsaga'
saga.init_lsp_saga()

-- vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR> Geht leider nu ned in whick-key:(

local wk = require("which-key")

wk.register({
-- show hover doc
        K = {":Lspsaga hover_doc<CR>", "hover docs"},
-- lsp provider to find the cursor word definition and reference
        ["gh"] = {":Lspsaga lsp_finder<CR>", "ref finder"},
-- scroll hover doc or scroll in definition preview
        ["<C-n>"] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "which_key_ignore"},
        ["<C-p>"] = {"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "which_key_ignore"},
        ["<C-k>"] = {":Lspsaga signature_help<CR>", "signature help"},
})

wk.register({
        c = {
                name = "Code", -- optional group name
                a = { ":Lspsaga code_action<cr>", "Action" }, -- create a binding with label
                r = { ":Lspsaga rename<cr>", "Rename" }, -- create a binding with label
                d = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Diagnostic" }, -- create a binding with label
                p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview def" }, -- create a binding with label
        },
}, { prefix = "<leader>" })
