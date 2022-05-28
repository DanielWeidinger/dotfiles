-- --- neoterm ---
vim.g.neoterm_default_mod = "vertical"
vim.g.neoterm_size = "50"
-- let g:neoterm_autoinsert = 1
vim.g.neoterm_autojump = 1
vim.g.neoterm_direct_open_repl = 1

vim.g.neoterm_repl_python = "ipython --no-autoindent"

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
local wk = require("which-key")

local jmpBack = ":call JumpBackIfTerminal()<cr>" --<C-w>r
wk.register({
	r = {
		name = "Run", -- optional group name
		-- neoterm
		f = { ":TREPLSendFile<CR>" .. jmpBack, "file" },
		l = { ":TREPLSendLine<CR>" .. jmpBack, "line" },
		s = { ":TREPLSendSelection<CR>" .. jmpBack, "selection", mode = "v" },
	},
}, {
	prefix = "<leader>",
})
-- General
vim.cmd([[autocmd FileType python map <buffer> <F9> :FloatermNew --autoclose=0 python %<CR>]])
vim.cmd([[autocmd FileType sh map <buffer> <F9> :FloatermNew --autoclose=0 ./%<CR>]])
