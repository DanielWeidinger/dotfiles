" Populate locallist with lsp diagnostics automatically 
" autocmd User LspDiagnosticsChanged :lua vim.diagnostic.set_loclist({open_loclist = false})

" Local setting
autocmd FileType markdown setlocal wrap

" Conda support 
lua << EOF
    vim.g.python3_host_prog = vim.fn.trim(vim.fn.system("which python") )
EOF

" navigation
set relativenumber
set number
set scrolloff=10 " sets the scroll boarder 2*n lines more narrow
set encoding=UTF-8

" Styling
set termguicolors

" Text formatting
filetype plugin indent on
  " show existing tab with 4 spaces width
set tabstop=4
  " when indenting with '>', use 4 spaces width
set shiftwidth=4
  " On pressing tab, insert 4 spaces
set expandtab
set nowrap
 
set mouse=

" Search
set nohlsearch
set incsearch " highlights the current search
set ignorecase
set smartcase

set hidden " keeps closed but unsaved buffers in the background


" misc
set signcolumn=yes
set exrc " additionally executes local rc config if present

"commands
set showcmd

" Treesitter Folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
"
