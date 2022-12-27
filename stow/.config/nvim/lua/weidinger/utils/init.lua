vim.cmd([[
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
]])

vim.cmd([[
    fun! CloseExtraWindows()
        " lua require'dapui'.close()
        NvimTreeClose
        TroubleClose
    endfun
]])

vim.cmd([[
fun GotoWindow(id)
    call win_gotoid(a:id)
    " MaximizerToggle
endfun
]])

vim.cmd([[
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
]])

--- Check if a file or directory exists in this path
function Exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

require("weidinger.utils.autoclosing")
require("weidinger.utils.browser")
require("weidinger.utils.fugitive")
require("weidinger.utils.tasks")
require("weidinger.utils.case_conversion")
-- require("weidinger.utils.folds")
