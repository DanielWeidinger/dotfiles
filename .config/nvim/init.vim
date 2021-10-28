" Source files
if has('unix')
	source ~/.config/nvim/general.vim
  source ~/.config/nvim/utils.vim
	source ~/.config/nvim/keys.vim
else
	source ~/AppData/Local/nvim/general.vim
	source ~/AppData/Local/nvim/keys.vim
endif

source ~/.config/nvim/plugins.vim


" Theming
colorscheme nord

" Misc
"   hex colorizer
lua require 'colorizer'.setup()
"   Plug Configs
if has('unix')
  source ~/.config/nvim/plugins/project_management.vim
  source ~/.config/nvim/plugins/lsp/lsp.vim  
  source ~/.config/nvim/plugins/which-key.lua  
  source ~/.config/nvim/plugins/floatterm.vim  
  source ~/.config/nvim/plugins/fugitive.lua  
  source ~/.config/nvim/plugins/cmp.lua
  source ~/.config/nvim/plugins/lspsaga.lua
  lua require('nvim-autopairs').setup{}
  " source ~/.config/nvim/plugins/vsnip.vim
  source ~/.config/nvim/plugins/themes.lua
  source ~/.config/nvim/plugins/treesitter.lua
  source ~/.config/nvim/plugins/vimspector.lua
  source ~/.config/nvim/plugins/telescope.lua
  source ~/.config/nvim/plugins/todo.lua
  source ~/.config/nvim/plugins/browser.lua
  source ~/.config/nvim/plugins/datasci/config.vim
else
	source ~/AppData/Local/nvim/project_management.vim
endif
"   NERDTree
let NERDTreeShowHidden=1
