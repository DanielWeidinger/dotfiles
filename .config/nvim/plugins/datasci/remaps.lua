local wk = require("which-key")

local jmpBack = ":call JumpBackIfTerminal()<cr>" --<C-w>r
wk.register({
 r = {
   name = "Run", -- optional group name
   -- neoterm
   r = {
       name = "+REPL",
       f = {":TREPLSendFile<CR>" .. jmpBack, "file"},
       l = {":TREPLSendLine<CR>" .. jmpBack, "line"},
       s = {":TREPLSendSelection<CR>" .. jmpBack, "selection", mode="v"},
       -- m = {"<Plug>(neoterm-repl-send)", "Motion"},
   },
   -- magma
   i = {":MagmaInit<CR>" .. jmpBack, "init Magma"},
   c = {":MagmaReevaluateCell<CR>" .. jmpBack, "(re)eval cell"},
   l = {":MagmaEvaluateLine<CR>" .. jmpBack, "line"},
   s = {":MagmaEvaluateVisual<CR>" .. jmpBack, "selection", mode="v"},
 },
}, { prefix = "<leader>" })


wk.register({
 r = {
   name = "Run", -- optional group name
   -- magma
   o = {":MagmaEvaluateOperator<CR>" .. jmpBack, "operator"},
 },
}, { prefix = "<leader><expr>" })

