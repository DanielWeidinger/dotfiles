-- GPT
require("chatgpt").setup({
    popup_input = {
        submit = "<cr>",
    },
    actions_paths = { vim.fn.stdpath("config") .. "/lua/weidinger/utils/ai/actions.json" },
})

local chatgpt = require("chatgpt")

vim.keymap.set({ "n", "v" }, "<leader>aa", ":ChatGPT<cr>", { desc = "Launch (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ae", function()
    chatgpt.edit_with_instructions()
end, { desc = "Edit with instructions (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ag", ":ChatGPTRun grammar_correction<cr>", { desc = "Grammar English (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>at", ":ChatGPTRun latex_correction<cr>", { desc = "German (GPT)" })
