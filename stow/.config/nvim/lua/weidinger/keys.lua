local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

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

-- Remap forward jumplist movement due to tab-<C-i> equality
keymap("n", "<A-o>", "<C-i>", opts)

-- Window functionality
keymap("n", "<A-<>", "10<C-w><", opts) -- resizing
keymap("n", "<A->>", "10<C-w>>", opts)
keymap("n", "<A-+>", "10<C-w>+", opts) -- resizing
keymap("n", "<A-->", "10<C-w>-", opts)

-- Special QWERTZ mappings
keymap("n", "ö", "}", opts)
keymap("n", "ä", "{", opts)
keymap("v", "ö", "}", opts)
keymap("v", "ä", "{", opts)
-- mark navigation
keymap({ "n", "v" }, "ü", "'", opts)

-- Ctrl + s for buffer writing
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)

-- Better Indentations
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- To escape insert mode in a terminal
keymap("t", "<c-j>", "<C-\\><C-n>", opts)

-- Closing buffers(the extra are here to no let NERD tree get the focus on closing)
keymap("n", "<C-x>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<C-c>", ":close<CR>", opts)
keymap("n", "<leader><C-x>", ":call CloseExtraWindows()<bar>:qa<CR>", opts)

-- Tab functionality
keymap("n", "<A-x>", ":tabclose<CR>", opts)

-- QFlist functionality
keymap("n", "<leader>q", ":copen<CR>", opts)
keymap("n", "<C-k>", ":cnext<CR>", opts)
keymap("n", "<C-l>", ":cprev<CR>", opts)

-- Leader key mappings for general actions
vim.keymap.set("n", "<leader>s", ":source $MYVIMRC<cr>", { desc = "source" })
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "explorer" })
vim.keymap.set("n", "<leader>E", ":vsplit<cr>:e .<cr>", { desc = "oil.nvim" })
vim.keymap.set("n", "<leader>m", ":MaximizerToggle!<cr>", { desc = "maximize" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Open UndoTree helper" })
-- QF list
vim.keymap.set("n", "<leader>q", ":call ToggleQFList(1)<CR>", { desc = "local qfl" })
vim.keymap.set("n", "<leader>ö", ":cnext<CR>", { desc = "next qf list item" })
vim.keymap.set("n", "<leader>ä", ":cprev<CR>", { desc = "previous qf list item" })

-- Visual mode mappings for renaming
vim.keymap.set("v", "<leader>s", '"sy:%s/<C-R>s//g<Left><Left>', { desc = "rename all" })
vim.keymap.set("v", "<leader>S", '"sy:%s/<C-R>s/<C-R>s/g<Left><Left>', { desc = "full rename all" })
-- vim.keymap.set("v", "<leader>k", [[:s/\%V\w\u\+\(_\w\u\+\)\+/\L\0/g<cr>:s/\%V_\(\w\)/\U\1/g<cr>]], { desc = "Snake to Camel" }) -- uncomment if needed

-- Leader key mappings for spelling and folding
vim.keymap.set("n", "<leader>zt", ":setlocal spell!<cr>", { desc = "local spelling" })
vim.keymap.set("n", "<leader>zf", require("weidinger.utils.folds").toggle_ts_folding, { desc = "folds with TS" })
