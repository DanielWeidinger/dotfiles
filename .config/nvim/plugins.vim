call plug#begin("~/.vim/plugged")
    " Easy Motion
    Plug 'easymotion/vim-easymotion'
            
    " Project managment(Sessions, bookmarks, ...)
    Plug 'mhinz/vim-startify'
    
    "As the name suggests
    Plug 'windwp/nvim-autopairs'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-commentary'

    " Status icons in tree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Git Stuff
    Plug 'mhinz/vim-signify' " GitGutter and diff in Airline
    Plug 'junegunn/gv.vim' " Commit browse
    " Hex code colorization
    Plug 'norcalli/nvim-colorizer.lua'
    " Fancy bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " should be last 
    Plug 'ryanoasis/vim-devicons'

    " Terminal functionality
    Plug 'voldikss/vim-floaterm'
    Plug 'kassio/neoterm'
    " Nvim utils(need for some plugs(e.g. todo))
    Plug 'nvim-lua/plenary.nvim'

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
    Plug 'glepnir/lspsaga.nvim'
    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets'

    " --- Datasci stuff ---
    Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }

    " Which key to show leader commands
    Plug 'folke/which-key.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

    " todo finder and highlighting
    Plug 'folke/todo-comments.nvim'

    " Mutli-language debugger
    Plug 'puremourning/vimspector'

    " Fuzzy finding
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
call plug#end()

