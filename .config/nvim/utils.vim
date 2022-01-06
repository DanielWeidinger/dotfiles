let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

fun! CloseExtraWindows()
    NvimTreeClose
    TroubleClose
endfun

" fun! RemapIfNerdTree()
"     if bufname('%') =~ 'NERD_tree_\d\+' 
"         " TODO: Integrate whichkey into unmapping
"         let telescope_funcs = ["f", "g", "h", "b", "t"]

"         for func in telescope_funcs
"             execute "nnoremap <buffer> <leader>f" . func . " :echo 'There will be general mayhem, so no'<cr>"
"         endfor

"         let i = 1
"         while i <= 12
"             execute "nnoremap <buffer> <F" . i . "> :echo 'There will be general mayhem, so no'<cr>"
"             let i = i + 1
"         endwhile 
"     endif
" endfun

fun GotoWindow(id)
        call win_gotoid(a:id)
        " MaximizerToggle
endfun
