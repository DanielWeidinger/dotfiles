" autocmd's
" autocmd BufWritePost init.vim source %
" To avoid overwriting the NERDTree
let NERDTreeShowHidden=1
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Populate locallist with lsp diagnostics automatically 
autocmd User LspDiagnosticsChanged :lua vim.diagnostic.set_loclist({open_loclist = false})

" navigation
set relativenumber
set nu
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

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode = ':t'
" Only works with powerline font
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

