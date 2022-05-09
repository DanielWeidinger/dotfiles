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
    lua require'dapui'.close()
    NvimTreeClose
    TroubleClose
endfun


fun GotoWindow(id)
        call win_gotoid(a:id)
        " MaximizerToggle
endfun

let g:current_mouse_mode = 0

fun! ToggleMouseMode()
    if g:current_mouse_mode == 1
        set mouse=
        let g:current_mouse_mode = 0
    else
        set mouse=n
        let g:current_mouse_mode = 1
    endif
endfun
