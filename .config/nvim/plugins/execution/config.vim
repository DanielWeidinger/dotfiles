" --- neoterm ---
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = '50'
" let g:neoterm_autoinsert = 1
let g:neoterm_autojump = 1
let g:neoterm_direct_open_repl = 1

" Conda support 
if has('nvim') && !empty($CONDA_PREFIX)
  let g:neoterm_repl_python = "ipython --no-autoindent"
endif


function! JumpBackIfTerminal()
        let bufType = getbufvar(bufnr(), '&buftype', 'ERROR')
        if bufType == 'terminal'
                call feedkeys("G\<C-w>p")
        else
                call feedkeys("\<C-w>pG\<C-w>p")
        endif
endfunction

" --- Remaps ---
source ~/.config/nvim/plugins/execution/remaps.lua
" General
autocmd FileType python map <buffer> <F9> :FloatermNew --autoclose=1 python %<CR>
autocmd FileType sh map <buffer> <F9> :FloatermNew --autoclose=1 ./%<CR>
