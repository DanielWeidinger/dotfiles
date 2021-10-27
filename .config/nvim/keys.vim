noremap <SPACE> <Nop>
let mapleader = " "

" https://www.youtube.com/watch?v=hSHATqh8svM 
"   behavious like the other actions
nnoremap Y y$h 
"   Centering on jumping and concat
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ`z
"   Textmovement with indentation
"   TODO: Jz dawei kann bock sie des anzugwona


vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

nnoremap <leader>p "+p

nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Ctrl + s for buffer writing
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Quick Escape
inoremap jk <Esc>
inoremap kj <Esc>

" Better Indentations
vnoremap < <gv
vnoremap > >gv

" To escape insert mode in a terminal
tnoremap <Esc><Esc> <C-\><C-n>

if exists('g:vscode')
		" navigation
		nnoremap <silent> üü :call VSCodeNotify('workbench.action.navigateToLastEditLocation')<CR>
		nnoremap <silent> <S-TAB> :call VSCodeNotify('workbench.action.previousEditor')<CR>
		nnoremap <silent> <TAB> :call VSCodeNotify('workbench.action.nextEditor')<CR>

		" comments
		xmap gc  <Plug>VSCodeCommentary
		nmap gc  <Plug>VSCodeCommentary
		omap gc  <Plug>VSCodeCommentary
		nmap gcc <Plug>VSCodeCommentaryLine
else
    " NERD Tree
    " nmap <leader>e :NERDTreeToggle<CR>
		" Movement
		nnoremap <silent> <S-TAB> :bp<CR>
		nnoremap <silent> <TAB> :bn<CR>
		" nnoremap <silent> <C-h> <C-w><h>
		" nnoremap <silent> <C-l> <C-w><l>
   
		" Closing buffers(the extra are here to no let NERD tree get the focus on
    " closing)
		nnoremap <C-x> :bp<bar>sp<bar>bn<bar>bd<CR>
		nnoremap <C-c> :close<CR>
		nnoremap <leader><C-x> :NERDTreeClose <bar> :SClose <bar> :qa<CR>
endif

