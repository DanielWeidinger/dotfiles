local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Nvim utils(need for some plugs(e.g. todo))
	use("nvim-lua/plenary.nvim")
	-- use 'DanielWeidinger/nvim-sshfs'

	-- Session managment(wrapper around mksession)
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
			})
		end,
	})

	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-tree.lua")
	use("tpope/vim-commentary")

	-- Hex code colorization
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	-- Fancy bar
	use("nvim-lualine/lualine.nvim")
	use("noib3/nvim-cokeline")
	-- use 'vim-airline/vim-airline'
	-- use 'vim-airline/vim-airline-themes'
	-- should be last
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons") -- for folke's Trouble plugin

	-- Terminal functionality
	use("voldikss/vim-floaterm")
	use("kassio/neoterm")

	-- General Git Stuff
	use("lewis6991/gitsigns.nvim") -- GitGutter and diff in Airline
	use("tpope/vim-fugitive") -- Basic git functionality
	use("tpope/vim-rhubarb") -- Adds Browse command to open in the web

	-- Surround for text surroundings
	use("tpope/vim-surround")

	-- Broser utils
	use("dhruvasagar/vim-open-url")

	-- Themes
	use("arcticicestudio/nord-vim")
	use("dracula/vim")
	use("morhetz/gruvbox")
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")

	-- --- LSP because its built-in ---
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	-- WARN: Behold the mighty copilot
	-- use 'github/copilot.vim' " Needed for the setup
	-- use 'zbirenbaum/copilot.lua'
	-- use 'zbirenbaum/copilot-cmp' " cmp source
	-- Autocomple + Sources
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-path")
	use("f3fora/cmp-spell")
	use("hrsh7th/cmp-calc")
	use("ray-x/cmp-treesitter")
	use("onsails/lspkind-nvim") -- Better iconography for completion
	-- better code diagnostics with floating window
	-- use 'glepnir/lspsaga.nvim'
	use("tami5/lspsaga.nvim")
	-- Flutter support (autosetup for dartls)
	use("akinsho/flutter-tools.nvim")
	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- --- Datasci stuff ---
	-- TODO: add jupyter support (jupyter ascending)
	-- use 'untitled-ai/jupyter_ascending.vim'
	-- TODO: add markdown preview support

	-- Which key to show leader commands
	use("folke/which-key.nvim")
	-- Pretty code diagnostics
	use("folke/lsp-colors.nvim")
	use("folke/trouble.nvim")
	use("folke/lua-dev.nvim")

	use("nvim-treesitter/nvim-treesitter") -- TODO: , {'do': ':TSUpdate'}
	-- treesitter based autoclosing and renaming of xml tags
	use({ "windwp/nvim-ts-autotag", config = function() end })

	-- todo finder and highlighting
	use("folke/todo-comments.nvim")

	-- Mutli-language debugger
	-- use 'puremourning/vimspector'

	-- DAP
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("nvim-telescope/telescope-dap.nvim")
	use("rcarriga/cmp-dap")
	use({ "Pocco81/dap-buddy.nvim", commit = "24923c3819a450a772bb8f675926d530e829665f" })

	use("szw/vim-maximizer")

	-- Fuzzy finding
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)