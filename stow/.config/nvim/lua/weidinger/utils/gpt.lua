require("chatgpt").setup({
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 300,
    temperature = 0,
    top_p = 1,
    n = 1,
    keymaps = {
        close = { "<C-c>" },
        -- submit = "<C-Enter>",
        submit = "<CR>",
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
local wk = require("which-key")
wk.register({
    a = { ":ChatGPT<cr>", "Launch ChatGPT" },
}, {
    prefix = "<leader>",
})
