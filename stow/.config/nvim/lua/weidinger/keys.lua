local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>y", '"+y', opts)

keymap("n", "<leader>p", '"+p', opts)

keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("v", "<leader>P", '"+P', opts)

-- Special QWERTZ mappings
keymap("n", "ö", "{", opts)
keymap("n", "ä", "}", opts)
keymap("n", "ü", ":HopWord<cr>", opts)
keymap("n", "Ü", "/", { noremap = true })

-- Ctrl + s for buffer writing
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

-- Quick Escape
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)

-- Better Indentations
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- To escape insert mode in a terminal
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
--
-- Closing buffers(the extra are here to no let NERD tree get the focus on closing)
keymap("n", "<C-x>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<C-c>", ":close<CR>", opts)
keymap("n", "<leader><C-x>", ":call CloseExtraWindows()<bar>:qa<CR>", opts)

-- Tab functionality
keymap("n", "<A-x>", ":tabclose<CR>", opts)
