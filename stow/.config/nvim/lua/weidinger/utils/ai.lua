-- GPT
require("chatgpt").setup({
    popup_input = {
        submit = "<cr>",
    },
})

local chatgpt = require("chatgpt")

-- Copilot
vim.cmd([[
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]])

vim.cmd([[
let g:copilot_filetypes = {
      \ 'dap-repl': v:false,
      \ 'TelescopePrompt': v:false,
      \ }
]])

local wk = require("which-key")
wk.register({
    a = {
        name = "AI Stuff",
        a = { ":ChatGPT<cr>", "Launch (GPT)" },
        e = {
            function()
                chatgpt.edit_with_instructions()
            end,
            "Edit with instructions (GPT)",
        },
        g = {
            ":ChatGPTRun grammar_correction<cr>",
            "Grammar (GPT)",
        },
        c = { ":Copilot setup <bar>Copilot enable<cr>", "Enable (Copilot)" },
        d = { ":Copilot disable<cr>", "Disable (Copilot)" },
        p = { ":Copilot panel<cr>", "Panel (Copilot)" },
    },
}, {
    prefix = "<leader>",
    mode = { "n", "v" },
})
