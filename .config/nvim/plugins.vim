call plug#begin("~/.vim/plugged")
    " Nvim utils(need for some plugs(e.g. todo))
    Plug 'nvim-lua/plenary.nvim'
    Plug 'DanielWeidinger/nvim-sshfs'

    " Easy Motion
    Plug 'easymotion/vim-easymotion'
            
    " Project managment(Sessions, bookmarks, ...)
    Plug 'mhinz/vim-startify'
    
    " As the name suggests
    Plug 'windwp/nvim-autopairs'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-commentary'

    " Status icons in tree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Git Stuff
    " Plug 'mhinz/vim-signify' 
    Plug 'lewis6991/gitsigns.nvim' " GitGutter and diff in Airline
    " Hex code colorization
    Plug 'norcalli/nvim-colorizer.lua'
    " Fancy bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " should be last 
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons' " for folke's Trouble plugin 

    " Terminal functionality
    Plug 'voldikss/vim-floaterm'
    Plug 'kassio/neoterm'

    " General Git Stuff
    Plug 'tpope/vim-fugitive' " Basic git functionality
    Plug 'tpope/vim-rhubarb' " Adds Browse command to open in the web
    
    " Surround for text surroundings
    Plug 'tpope/vim-surround'

    " Broser utils
    Plug 'dhruvasagar/vim-open-url'

    " Themes
    Plug 'arcticicestudio/nord-vim'
    Plug 'dracula/vim'

    " --- LSP because its built-in ---
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim', { 'branch': '0.6-only' } 
    " Autocomple + Sources
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/cmp-path'
    Plug 'f3fora/cmp-spell'
    Plug 'hrsh7th/cmp-calc'
    Plug 'ray-x/cmp-treesitter'
    Plug 'onsails/lspkind-nvim' " Better iconography for completion
    " better code diagnostics with floating window
    " Plug 'glepnir/lspsaga.nvim'
    Plug 'tami5/lspsaga.nvim'
    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'

    " --- Datasci stuff ---
    "  TODO: add jupyter support (jupyter ascending)

    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  } 

    " Which key to show leader commands
    Plug 'folke/which-key.nvim'
    " Pretty code diagnostics 
    Plug 'folke/lsp-colors.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'folke/lua-dev.nvim' " NOTE: remove if u are not developing plugins

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
    Plug 'windwp/nvim-ts-autotag' " treesitter based autoclosing and renaming of xml tags

    " todo finder and highlighting
    Plug 'folke/todo-comments.nvim'

    " Mutli-language debugger
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'

    " Fuzzy finding
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

