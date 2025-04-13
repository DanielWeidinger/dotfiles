-- General
vim.cmd([[autocmd FileType python map <buffer> <F9> :9TermExec direction="vertical" cmd="python %"<CR>]])
vim.cmd([[autocmd FileType sh map <buffer> <F9> :9TermExec direction="vertical" cmd="./%"<CR>]])
