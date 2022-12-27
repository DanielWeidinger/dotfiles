-- https://www.jmaguire.tech/posts/treesitter_folding/

local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Autocommand to open all folds per default
vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])
