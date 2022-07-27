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

	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						ipynb = "jupyter",
					},
				},
			})
		end,
	})

	-- Session managment(wrapper around mksession)
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
					"zsh",
				},
			})
		end,
	})

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

	-- should be last
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons") -- for folke's Trouble plugin

	-- Terminal functionality and execution
	use("voldikss/vim-floaterm")
	use("kassio/neoterm")
	use({
		"untitled-ai/jupyter_ascending.vim",
		ft = { "python" },
		setup = function()
			local wk = require("which-key")
			wk.register({
				j = {
					name = "Jupyter",
					j = { "<Plug>JupyterExecute", "Execute cell" },
					a = { "<Plug>JupyterExecuteAll", "Execute all cells" },
				},
			}, {
				prefix = "<leader>",
			})
		end,
	})

	-- General Git Stuff
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ keymaps = {} })
		end,
	}) -- GitGutter and diff in Airline
	use("tpope/vim-fugitive") -- Basic git functionality
	use("tpope/vim-rhubarb") -- Adds Browse command to open in the web

	-- Surround for text surroundings
	use("tpope/vim-surround")

	-- Broser utils
	use("dhruvasagar/vim-open-url")

	use({ "GustavoKatel/tasks.nvim", requires = { "nvim-lua/plenary.nvim" } })

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			require("hop").setup()
		end,
	})

	-- Themes
	use("arcticicestudio/nord-vim")
	use("dracula/vim")
	use("morhetz/gruvbox")
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")

	-- LSP
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
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				hint_enable = true,
				floating_window = false,
				hint_prefix = "ﲒ ",
				timer_interval = 100,
			})
		end,
	}) -- Floating window lsp signature
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		disable = true,
		config = function()
			require("lsp_lines").setup()
		end,
	})
	-- better code diagnostics with floating window
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").init_lsp_saga({
				diagnostic_header = { " ", " ", " ", "ﴞ " },
			})
		end,
	})
	use("b0o/schemastore.nvim") -- For json schema validation capabilities

	-- Flutter support (autosetup for dartls)
	use({
		"akinsho/flutter-tools.nvim",
		config = function()
			require("weidinger.lsp.ls_flutter").setup()
		end,
		ft = { "dart" },
	})

	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- Previewers
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Which key to show leader commands
	use("folke/which-key.nvim")
	-- Pretty code diagnostics
	use({
		"folke/lsp-colors.nvim",
		config = function()
			require("lsp-colors").setup()
		end,
	})
	use("bellini666/trouble.nvim")
	use("folke/lua-dev.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", config = function() end })

	-- todo finder and highlighting
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({
				search = {
					command = "rg",
				},
			})
		end,
	})

	-- DAP
	use("mfussenegger/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("nvim-telescope/telescope-dap.nvim")
	use("rcarriga/cmp-dap")
	use({ "Pocco81/dap-buddy.nvim", commit = "24923c3819a450a772bb8f675926d530e829665f" })

	use("szw/vim-maximizer")

	-- Test runner
	use("nvim-neotest/neotest")
	use("haydenmeade/neotest-jest")

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
