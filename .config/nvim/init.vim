" Source files
source ~/.config/nvim/utils.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/keys.vim
source ~/.config/nvim/plugins.vim


" Theming
colorscheme tokyonight


"   Plug Configs
source ~/.config/nvim/plugins/project_management.vim
source ~/.config/nvim/plugins/lsp/lsp.vim  
source ~/.config/nvim/plugins/which-key.lua  
source ~/.config/nvim/plugins/floaterm.vim  
source ~/.config/nvim/plugins/git/fugitive.lua  
source ~/.config/nvim/plugins/git/signs.lua  
source ~/.config/nvim/plugins/lsp/cmp.lua
source ~/.config/nvim/plugins/lsp/lspsaga.lua
source ~/.config/nvim/plugins/appearence/cokeline.lua
source ~/.config/nvim/plugins/appearence/lualine.lua
source ~/.config/nvim/plugins/treesitter.lua
source ~/.config/nvim/plugins/telescope.lua
source ~/.config/nvim/plugins/todo.lua
source ~/.config/nvim/plugins/browser.lua
source ~/.config/nvim/plugins/execution/config.vim
source ~/.config/nvim/plugins/trouble.lua
source ~/.config/nvim/plugins/autoclosing.lua
source ~/.config/nvim/plugins/vimspector.lua
source ~/.config/nvim/plugins/tree.lua
lua require 'colorizer'.setup()
