source ~/.config/nvim/plugins/lsp/lsp.lua

" for prettier and eslint
source ~/.config/nvim/plugins/lsp/ls_null.lua
source ~/.config/nvim/plugins/lsp/ls_lua.lua

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

lua << EOF
local wk = require("which-key")

-- Using trouble for navigation rather than QL list
wk.register({
  g = {
     -- d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
     D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
     -- R = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Open references' },
     -- i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
  },
})
EOF

" Moved to LSP Saga
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next()<CR>

" " auto-format
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)