-- GPT
require("chatgpt").setup({
    keymaps = {
        close = { "<C-c>" },
        submit = "<C-Enter>",
        yank_last = "<C-y>",
        yank_last_code = "<C-k>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        toggle_settings = "<C-o>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
        -- in the Sessions pane
        select_session = "<Space>",
        rename_session = "r",
        delete_session = "d",
    },
})

local chatgpt = require("chatgpt")

-- Copilot
vim.cmd([[
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
]])

local wk = require("which-key")
wk.register({
    a = {
        name = "AI Stuff",
        a = { ":ChatGPT<cr>", "Launch (GPT)" },
        r = { ":ChatGPTRun<cr>", "Run (GPT)" },
        e = {
            function()
                chatgpt.edit_with_instructions()
            end,
            "Edit (GPT)",
        },
        c = { ":Copilot setup <bar>Copilot enable<cr>", "Enable (Copilot)" },
        d = { ":Copilot disable<cr>", "Disable (Copilot)" },
        p = { ":Copilot panel<cr>", "Panel (Copilot)" },
    },
}, {
    prefix = "<leader>",
})
