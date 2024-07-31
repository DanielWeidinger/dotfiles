-- --- neoterm ---
vim.g.neoterm_default_mod = "vertical"
vim.g.neoterm_size = "50"
-- let g:neoterm_autoinsert = 1
vim.g.neoterm_autojump = 1
vim.g.neoterm_direct_open_repl = 1

vim.g.neoterm_repl_python = { "ipython --no-autoindent --no-confirm-exit" }
vim.g.neoterm_repl_command = vim.g.neoterm_repl_python

vim.cmd([[
function! JumpBackIfTerminal()
        let bufType = getbufvar(bufnr(), '&buftype', 'ERROR')
        if bufType == 'terminal'
                call feedkeys("G\<C-w>p")
        else
                call feedkeys("\<C-w>pG\<C-w>p")
        endif
endfunction
]])

-- --- Remaps ---
local jmpBack = ":call JumpBackIfTerminal()<cr>"

vim.keymap.set("n", "<leader>rf", ":TREPLSendFile<CR>" .. jmpBack, { desc = "file" })
vim.keymap.set("n", "<leader>rl", ":TREPLSendLine<CR>" .. jmpBack, { desc = "line" })
vim.keymap.set("v", "<leader>rs", ":TREPLSendSelection<CR>" .. jmpBack, { desc = "selection" })

-- General
vim.cmd([[autocmd FileType python map <buffer> <F9> :9TermExec direction="vertical" cmd="python %"<CR>]])
vim.cmd([[autocmd FileType sh map <buffer> <F9> :9TermExec direction="vertical" cmd="./%"<CR>]])
