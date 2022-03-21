let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

lua << EOF
local wk = require("which-key")

wk.register({
  t = {
    name = "Term", -- optional group name
     [ ";" ] = { ':FloatermNew --wintype=popup --height=6<cr>'        , 'terminal' },
     g = { ':FloatermNew lazygit<cr>'                           , 'git' },
     d = { ':FloatermNew lazydocker<cr>'                        , 'docker' },
     n = { ':FloatermNew node<cr>'                              , 'node' },
     p = { ':FloatermNew python<cr>'                            , 'python' },
     t = { ':FloatermToggle<cr>'                                , 'toggle' },
     b = { ':FloatermNew btm<cr>'                               , 'bottom' },
     a = { ':FloatermKill! <cr>'                               , 'close all' },
  },
}, { prefix = "<leader>" })
EOF
