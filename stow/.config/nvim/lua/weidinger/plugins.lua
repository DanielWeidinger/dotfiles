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
    use({ "MunifTanjim/nui.nvim" })

    -- use 'DanielWeidinger/nvim-sshfs'

    -- Session managment(wrapper around mksession)
    use({
        "Shatur/neovim-session-manager",
        config = function()
            require("weidinger.utils.session_management").setup()
        end,
    })

    -- Filesystem
    use("kyazdani42/nvim-tree.lua")
    use({
        "stevearc/oil.nvim",
    })

    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Hex code colorization
    use({
        "catgoose/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })
    -- Fancy bar
    use("nvim-lualine/lualine.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")
    use({ "echasnovski/mini.icons", version = "*" })

    -- Terminal functionality and execution
    use({ "akinsho/toggleterm.nvim", tag = "*" })
    use({
        "untitled-ai/jupyter_ascending.vim",
        ft = { "python" },
        setup = function()
            vim.keymap.set("n", "<leader>jj", "<Plug>JupyterExecute", { desc = "Execute cell" })
            vim.keymap.set("n", "<leader>ja", "<Plug>JupyterExecuteAll", { desc = "Execute all cells" })
            vim.keymap.set("n", "<leader>jr", "<Plug>JupyterRestart", { desc = "Restart Kernel" })
        end,
    })

    -- General Git Stuff
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    }) -- mainly for GitGutter
    use("tpope/vim-fugitive") -- Basic git functionality
    use("tpope/vim-rhubarb") -- Adds Browse command to open in the web

    -- Surround for text surroundings
    use("tpope/vim-surround")
    use("tpope/vim-repeat") -- for dot repeat functionality

    -- Browser utils
    use("dhruvasagar/vim-open-url")

    -- AI
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })

    -- Task Executor
    use("stevearc/overseer.nvim")

    use({
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    })

    use("mbbill/undotree")

    -- Themes
    use("shaunsingh/nord.nvim")
    use("rebelot/kanagawa.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("nvimtools/none-ls-extras.nvim")
    use({ "nvimtools/none-ls.nvim", dependencies = {
        "nvimtools/none-ls-extras.nvim",
    } })

    use("lukas-reineke/lsp-format.nvim") -- wrapper around LSP formatting to not have to worry about implementation
    -- Autocomple + Sources
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("ray-x/cmp-treesitter")
    use("onsails/lspkind-nvim") -- Better iconography for completion
    use({
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_enable = true,
                floating_window = false,
                hint_prefix = " ",
                timer_interval = 100,
            })
        end,
    }) -- Floating window lsp signature
    use("lewis6991/hover.nvim")

    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    })
    use("rafamadriz/friendly-snippets")
    use("saadparwaiz1/cmp_luasnip")

    --Macros
    use({ "kr40/nvim-macros" })

    --Latex
    use({
        "lervag/vimtex",
        setup = function()
            vim.cmd([[
            let g:vimtex_view_general_viewer = 'okular'
            let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
            ]])
        end,
        ft = { "tex" },
    })
    --Markdown viewer
    use({
        "MeanderingProgrammer/render-markdown.nvim",
        after = { "nvim-treesitter" },
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = function()
            require("render-markdown").setup({})
        end,
    })

    -- Which key to show leader commands
    use("folke/which-key.nvim")
    use("folke/trouble.nvim")
    -- use("folke/neodev.nvim")
    use({
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("hardtime").setup()
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    use("windwp/nvim-autopairs")
    use({ "windwp/nvim-ts-autotag" })

    -- DAP
    use("mfussenegger/nvim-dap")
    use("nvim-neotest/nvim-nio")
    use("theHamsta/nvim-dap-virtual-text")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
    use("mfussenegger/nvim-dap-python")
    use("nvim-telescope/telescope-dap.nvim")
    use("rcarriga/cmp-dap")

    use({
        "szw/vim-maximizer",
        config = function()
            vim.g.maximizer_set_default_mapping = 0
        end,
    })

    -- Test runner
    -- use("nvim-neotest/neotest")
    -- use("haydenmeade/neotest-jest")

    --
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
