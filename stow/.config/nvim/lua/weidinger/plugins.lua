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
            require("weidinger.utils.session_management").setup()
        end,
    })

    use("kyazdani42/nvim-tree.lua")
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Hex code colorization
    use({
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })
    -- Fancy bar
    use("nvim-lualine/lualine.nvim")
    use("willothy/nvim-cokeline")

    -- Icons
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons") -- for folke's Trouble plugin
    use("ChristianChiarulli/neovim-codicons") -- for folke's Trouble plugin

    -- Terminal functionality and execution
    use({ "akinsho/toggleterm.nvim", tag = "*" })
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
                    r = { "<Plug>JupyterRestart", "Restart Kernel" },
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
            require("gitsigns").setup()
        end,
    }) -- GitGutter and diff in Airline
    use("tpope/vim-fugitive") -- Basic git functionality
    use("tpope/vim-rhubarb") -- Adds Browse command to open in the web

    -- Surround for text surroundings
    use("tpope/vim-surround")
    use("tpope/vim-repeat") -- for dot repeat functionality

    -- Browser utils
    use("dhruvasagar/vim-open-url")

    use({ "MunifTanjim/nui.nvim" })
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })
    use({ "github/copilot.vim" })

    use({ "GustavoKatel/tasks.nvim", requires = { "nvim-lua/plenary.nvim" } })

    use({
        "phaazon/hop.nvim",
        branch = "v1", -- optional but strongly recommended
        config = function()
            require("hop").setup()
        end,
    })

    use({
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    })

    use("mbbill/undotree")

    -- Themes
    use("raddari/last-color.nvim")
    use("shaunsingh/nord.nvim")
    use("dracula/vim")
    use("morhetz/gruvbox")
    use("rebelot/kanagawa.nvim")
    -- use("folke/tokyonight.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/null-ls.nvim")
    use("lukas-reineke/lsp-format.nvim") -- wrapper around LSP formatting to not have to worry about implementation
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
        "mrshmllow/document-color.nvim",
        config = function()
            require("document-color").setup({
                -- Default options
                mode = "background", -- "background" | "foreground"
            })
        end,
    })
    use("lewis6991/hover.nvim")
    -- better code diagnostics with floating window
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
    use("folke/trouble.nvim")
    -- use("folke/neodev.nvim")

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    use("windwp/nvim-autopairs")
    use({ "windwp/nvim-ts-autotag" })

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
    use({ "rcarriga/nvim-dap-ui" })
    use("mfussenegger/nvim-dap-python")
    use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
    use("nvim-telescope/telescope-dap.nvim")
    use("rcarriga/cmp-dap")

    use({
        "szw/vim-maximizer",
        config = function()
            vim.g.maximizer_set_default_mapping = 0
        end,
    })

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
