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

vim.keymap.set({ "n", "v" }, "<leader>aa", ":ChatGPT<cr>", { desc = "Launch (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ae", function()
    chatgpt.edit_with_instructions()
end, { desc = "Edit with instructions (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ag", ":ChatGPTRun grammar_correction<cr>", { desc = "Grammar (GPT)" })
vim.keymap.set({ "n", "v" }, "<leader>ac", ":Copilot setup <bar>Copilot enable<cr>", { desc = "Enable (Copilot)" })
vim.keymap.set({ "n", "v" }, "<leader>ad", ":Copilot disable<cr>", { desc = "Disable (Copilot)" })
vim.keymap.set({ "n", "v" }, "<leader>ap", ":Copilot panel<cr>", { desc = "Panel (Copilot)" })
