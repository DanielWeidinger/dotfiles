local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },
        file_ignore_patterns = { "^.git/" },
    },
    pickers = {
        find_all_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor(),
        },
    },
})

telescope.load_extension("fzy_native")
telescope.load_extension("ui-select")

local wk = require("which-key")
wk.register({
    f = {
        name = "Telescope", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find file" }, -- create a binding with label
        F = {
            ":lua require'telescope.builtin'.find_files({ hidden = true, find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '--glob', '*' },  })<cr>",
            "Find all files",
        }, -- Search though all files
        -- F = { "<cmd>Telescope git_files<cr>", "Find non-ignored File" }, -- create a binding with label
        o = { "<cmd>Telescope oldfiles<cr>", "prev. opened" }, -- create a binding with label
        c = { "<cmd>Telescope command_history<cr>", "prev. commands" }, -- create a binding with label
        ["&"] = { "<cmd>Telescope colorscheme<cr>", "avaliable colorschemes" }, -- create a binding with label
        g = { "<cmd>Telescope live_grep<cr>", "Grep" }, -- create a binding with label
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
        r = { "<cmd>Telescope reloader<cr>", "Reload modules" },
        t = { "<cmd>Telescope tasks specs<cr>", "Tasks" },
        T = { "<cmd>TodoTelescope<cr>", "Todos" },
        s = { "<cmd>SessionManager load_session<cr>", "Load Session" }, --SessionCommands
    },
}, {
    prefix = "<leader>",
})
